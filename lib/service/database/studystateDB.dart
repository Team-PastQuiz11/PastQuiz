import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class StudyStateModel{

  static const dbName= "past_records_db.db";
  static const tableName = "states";
  static const yearName = "year";
  static const nowquestionName = "nowquestion";
  static const unsolvesName = "unsolveds";

  Future<void> createStateTables(Database database) async{
    await database.execute(
      """
      CREATE TABLE $tableName(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        $yearName INTEGER,
        $nowquestionName INTEGER,
        $unsolvesName TEXT
      )
      """
    );
  }

  Future<Database> db() async{
    return openDatabase(
      join(await getDatabasesPath(), dbName),
      onCreate: (db, version) async {
        await createStateTables(db);
      },
      version: 1
    );
  }

  static Future<int> createState(
    int year,int nowQuestion, String unsolveds
  )async{
    final db = await StudyStateModel().db();

    final data = {yearName: year,nowquestionName:nowQuestion,unsolvesName:unsolveds};
    final id = await db.insert(tableName, data,conflictAlgorithm: ConflictAlgorithm.replace);
    return id;
  }

  static Future<List<Map<String, dynamic>>> getState() async{
    final db = await StudyStateModel().db();
    return db.query(tableName,orderBy: "id");
  }

  static Future<int> updateState(
    int year,int nowQuestion,String unsolveds
  ) async {
    final db = await StudyStateModel().db();

    final data = {yearName: year,nowquestionName:nowQuestion,unsolvesName:unsolveds};
    final result = await db.update(tableName, data,where: "$yearName = ?", whereArgs: [year]);
    return result;
  }

  static Future<void> deleteState() async {
    final db = await StudyStateModel().db();
    try{
      await db.delete(tableName);
    }catch(err){
      debugPrint("Something went wrong $err");
    }
  }
}