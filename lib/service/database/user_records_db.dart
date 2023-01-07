import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class UserRecordsModel {
  static const dbName = 'past_records_db.db';
  static const tableName = 'recordstable';
  // static const yearName = "year";
  static const nowquestionColumn = 'nowquestion';
  //0 true 1 false
  static const isCorrectColumn = 'isCorrect';
  static const createdAtColumn = 'createdAt';

  Future<void> createRecordTables(Database database) async {
    await database.execute('''
      CREATE TABLE $tableName(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        $nowquestionColumn TEXT NOT NULL,
        $isCorrectColumn INTEGER NOT NULL,
        $createdAtColumn TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
      )
      ''');
  }

  Future<Database> db() async {
    return openDatabase(
      join(await getDatabasesPath(), dbName),
      onCreate: (db, version) async {
        await createRecordTables(db);
      },
      version: 1,
    );
  }

  static Future<void> deleteDB() async {
    await deleteDatabase(
      join(await getDatabasesPath(), dbName),
    );
    print('deleteDBok');
  }

  static Future<List<Map<String, dynamic>>> getRecordsList() async {
    final db = await UserRecordsModel().db();
    return db.query(tableName, orderBy: 'id');
  }

  static Future<List<Map<String, dynamic>>> getRecordsListTrue() async {
    final db = await UserRecordsModel().db();
    return db.query(tableName, where: '$isCorrectColumn = ?', whereArgs: [0]);
  }

  static Future<List<Map<String, dynamic>>> getSpecificRecord(
    String nowquestion,
  ) async {
    final db = await UserRecordsModel().db();
    return db.query(
      tableName,
      where: '$nowquestionColumn = ?',
      whereArgs: [nowquestion],
    );
  }

  static Future<int> createRecord({
    required String popQuestionStr,
    required int isCorrect,
  }) async {
    final db = await UserRecordsModel().db();

    final data = {
      nowquestionColumn: popQuestionStr,
      isCorrectColumn: isCorrect
    };
    final id = await db.insert(
      tableName,
      data,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return id;
  }

  static Future<int> updateRecord(String nowquestion, int isCorrect) async {
    final db = await UserRecordsModel().db();

    final data = {nowquestionColumn: nowquestion, isCorrectColumn: isCorrect};
    final result = await db.update(
      tableName,
      data,
      where: '$nowquestionColumn = ?',
      whereArgs: [nowquestion],
    );
    return result;
  }

  static Future<void> deleteAllRecord() async {
    final db = await UserRecordsModel().db();
    try {
      await db.delete(tableName);
    } catch (err) {
      debugPrint('Something went wrong $err');
    }
  }
}
