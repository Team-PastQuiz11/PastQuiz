import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class UserRecordsModel{
  static const dbName= "past_state_db.db";
  static const tableName = "recordstable";
  static const yearName = "year";
  static const nowquestionName = "nowquestion";
  //0 true 1false
  static const isCorrectName = "isCorrect";
  static const createdAtName = "createdAt";

  Future<void> createRecordTables(Database database) async{
    await database.execute(
      """
      CREATE TABLE $tableName(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        $yearName INTEGER NOT NULL,
        $nowquestionName INTEGER NOT NULL,
        $isCorrectName INTEGER NOT NULL,
        $createdAtName TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
      )
      """
    );
  }

  Future<Database> db() async{
    print("open");
    return openDatabase(
      join(await getDatabasesPath(), dbName),
      onCreate: (db, version) async {
        print("create");
        await createRecordTables(db);
      },
      version: 1
    );
  }

  static Future<List<Map<String, dynamic>>> getRecordsList() async{
    final db = await UserRecordsModel().db();
    return db.query(tableName,orderBy: "id");
  }

  static Future<List<Map<String, dynamic>>> getRecordsList_true() async{
    final db = await UserRecordsModel().db();
    return db.query(tableName,where: "$isCorrectName = ?",whereArgs: [0]);
  }

  static Future<List<Map<String, dynamic>>> getSpecificRecord(int year,int nowQuestion) async{
    final db = await UserRecordsModel().db();
    return db.query(
      tableName,
      where: "$yearName = ? AND $nowquestionName = ?",
      whereArgs: [year,nowQuestion],
      );
  }

  static Future<int> createRecord(
    int year,int nowQuestion,int isCorrect
  )async{
    print("createRecord");
    final db = await UserRecordsModel().db();

    final data = {yearName: year,nowquestionName:nowQuestion, isCorrectName:isCorrect};
    final id = await db.insert(tableName, data,conflictAlgorithm: ConflictAlgorithm.replace);
    return id;
  }

  static Future<int> updateRecord(
    int year,int nowQuestion,int isCorrect
  ) async {
    print("updateRecord");
    final db = await UserRecordsModel().db();

    final data = {yearName: year,nowquestionName:nowQuestion, isCorrectName:isCorrect};
    final result = await db.update(tableName, data,where: "$yearName = ? AND $nowquestionName = ?", whereArgs: [year,nowQuestion]);
    return result;
  }

  static Future<void> deleteAllRecord() async{
    final db = await UserRecordsModel().db();
    try{
      await db.delete(tableName);
    }catch(err){
      debugPrint("Something went wrong $err");
    }
  }
}