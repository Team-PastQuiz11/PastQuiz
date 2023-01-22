import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class StudyStateModel {
  static const dbName = 'past_state_db.db';

  static const tableName = 'states';
  // static const yearName = "year";
  static const nowQuestionColumn = 'nowQuestion';
  static const unSolvedColumn = 'unSolved';

  Future<void> createStateTables(Database database) async {
    await database.execute('''
      CREATE TABLE $tableName(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        $nowQuestionColumn TEXT NOT NULL,
        $unSolvedColumn TEXT NOT NULL
      )
      ''');
  }

  Future<Database> db() async {
    return openDatabase(
      join(await getDatabasesPath(), dbName),
      onCreate: (db, version) async {
        await createStateTables(db);
      },
      version: 1,
    );
  }

  static Future<void> deleteDB() async {
    await deleteDatabase(
      join(await getDatabasesPath(), dbName),
    );
    debugPrint('deleteDBok');
  }

  static Future<int> createState({
    required String nowQuestion,
    required String unSolved,
  }) async {
    final db = await StudyStateModel().db();

    final data = {
      // yearName: year,
      nowQuestionColumn: nowQuestion,
      unSolvedColumn: unSolved
    };
    final id = await db.insert(
      tableName,
      data,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    debugPrint('createID$id');
    return id;
  }

  static Future<List<Map<String, dynamic>>> getState() async {
    final db = await StudyStateModel().db();
    return db.query(tableName, orderBy: 'id');
  }

  static Future<int> updateState({
    required int stateId,
    required String nowQuestion,
    required String unSolved,
  }) async {
    final db = await StudyStateModel().db();

    final data = {nowQuestionColumn: nowQuestion, unSolvedColumn: unSolved};
    final result = await db.update(
      tableName,
      data,
      where: 'id = ?',
      whereArgs: [stateId],
    );
    return result;
  }

  static Future<void> deleteState() async {
    final db = await StudyStateModel().db();
    try {
      await db.delete(tableName);
    } catch (err) {
      debugPrint('Something went wrong $err');
    }
  }
}
