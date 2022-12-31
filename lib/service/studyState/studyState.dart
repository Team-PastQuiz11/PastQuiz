// import 'dart:io';

// import 'package:drift/drift.dart';
// import 'package:drift/native.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:path/path.dart' as p;

// part 'studyState.g.dart';

// class StudyStates extends Table{
//   IntColumn get id => integer().autoIncrement()();
//   IntColumn get year => integer()();
//   TextColumn get unsolvedList => text()();
//   IntColumn get nowQuestion => integer()();
// }

// @DriftDatabase(tables: [StudyStates])
// class StateDatabase extends _$StateDatabase{
//   StateDatabase() : super(_openConnection());

//   @override
//   int get schemaVersion => 1;

//   Stream<List<StudyState>> watchEntries(){
//     return (select(studyStates)).watch();
//   }

//   Future<List<StudyState>> get allStudyStateEntries => select(studyStates).get();

//   Future addStudyState({
//     required int year,
//     required String unsolvedList,
//     required int nowQuestion
//     }){
//     return into(studyStates).insert(StudyStatesCompanion(
//       year: Value(year),
//       unsolvedList: Value(unsolvedList),
//       nowQuestion: Value(nowQuestion)
//     ));
//   }

//   Future updateStudyState({
//     required int year,
//     required String unsolvedList,
//     required int nowQuestion
//   }){
//     return (update(studyStates)..where((tbl) => tbl.year.equals(year))).write(
//       StudyStatesCompanion(
//         year: Value(year),
//         unsolvedList: Value(unsolvedList),
//         nowQuestion: Value(nowQuestion)
//       )
//     );
//   }

//   Future deleteStudyState({
//     required int year,
//   }){
//     return (delete(studyStates)..where((tbl) => tbl.year.equals(year))).go();
//   }
// }

// LazyDatabase _openConnection(){
//   return LazyDatabase(() async {
//     final dbFolder = await getApplicationDocumentsDirectory();
//     final file = File(p.join(dbFolder.path,"db2.sqlite"));
//     return NativeDatabase(file);
//   });
// }

