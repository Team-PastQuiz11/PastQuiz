
// import 'dart:io';

// import 'package:drift/drift.dart';
// import 'package:drift/native.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:path/path.dart' as p;

// part 'userRecords.g.dart';

// class UserRecords extends Table{
//   IntColumn get id => integer().autoIncrement()();
//   IntColumn get year => integer()();
//   IntColumn get questionNumber => integer()();
//   BoolColumn get isCorrect => boolean()();
// }

// @DriftDatabase(tables: [UserRecords])
// class UserDatabase extends _$UserDatabase{
//   UserDatabase() : super(_openConnection());

//   @override
//   int get schemaVersion => 1;

//   Stream<List<UserRecord>> watchEntries(){
//     return (select(userRecords)).watch();
//   }

//   Future<List<UserRecord>> get allUserRecordEntries => select(userRecords).get();

//   Future addUserRecord({
//     required int year,
//     required int questionNumber,
//     required bool isCorrect
//   }){
//     return into(userRecords).insert(UserRecordsCompanion(
//       year: Value(year),
//       questionNumber: Value(questionNumber),
//       isCorrect: Value(isCorrect)
//     ));
//   }
// }

// LazyDatabase _openConnection(){
//   return LazyDatabase(() async {
//     final dbFolder = await getApplicationDocumentsDirectory();
//     final file = File(p.join(dbFolder.path,"db1.sqlite"));
//     return NativeDatabase(file);
//   });
// }