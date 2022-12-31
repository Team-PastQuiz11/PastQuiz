// // GENERATED CODE - DO NOT MODIFY BY HAND

// part of 'studyState.dart';

// // ignore_for_file: type=lint
// class StudyState extends DataClass implements Insertable<StudyState> {
//   final int id;
//   final int year;
//   final String unsolvedList;
//   final int nowQuestion;
//   const StudyState(
//       {required this.id,
//       required this.year,
//       required this.unsolvedList,
//       required this.nowQuestion});
//   @override
//   Map<String, Expression> toColumns(bool nullToAbsent) {
//     final map = <String, Expression>{};
//     map['id'] = Variable<int>(id);
//     map['year'] = Variable<int>(year);
//     map['unsolved_list'] = Variable<String>(unsolvedList);
//     map['now_question'] = Variable<int>(nowQuestion);
//     return map;
//   }

//   StudyStatesCompanion toCompanion(bool nullToAbsent) {
//     return StudyStatesCompanion(
//       id: Value(id),
//       year: Value(year),
//       unsolvedList: Value(unsolvedList),
//       nowQuestion: Value(nowQuestion),
//     );
//   }

//   factory StudyState.fromJson(Map<String, dynamic> json,
//       {ValueSerializer? serializer}) {
//     serializer ??= driftRuntimeOptions.defaultSerializer;
//     return StudyState(
//       id: serializer.fromJson<int>(json['id']),
//       year: serializer.fromJson<int>(json['year']),
//       unsolvedList: serializer.fromJson<String>(json['unsolvedList']),
//       nowQuestion: serializer.fromJson<int>(json['nowQuestion']),
//     );
//   }
//   @override
//   Map<String, dynamic> toJson({ValueSerializer? serializer}) {
//     serializer ??= driftRuntimeOptions.defaultSerializer;
//     return <String, dynamic>{
//       'id': serializer.toJson<int>(id),
//       'year': serializer.toJson<int>(year),
//       'unsolvedList': serializer.toJson<String>(unsolvedList),
//       'nowQuestion': serializer.toJson<int>(nowQuestion),
//     };
//   }

//   StudyState copyWith(
//           {int? id, int? year, String? unsolvedList, int? nowQuestion}) =>
//       StudyState(
//         id: id ?? this.id,
//         year: year ?? this.year,
//         unsolvedList: unsolvedList ?? this.unsolvedList,
//         nowQuestion: nowQuestion ?? this.nowQuestion,
//       );
//   @override
//   String toString() {
//     return (StringBuffer('StudyState(')
//           ..write('id: $id, ')
//           ..write('year: $year, ')
//           ..write('unsolvedList: $unsolvedList, ')
//           ..write('nowQuestion: $nowQuestion')
//           ..write(')'))
//         .toString();
//   }

//   @override
//   int get hashCode => Object.hash(id, year, unsolvedList, nowQuestion);
//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//       (other is StudyState &&
//           other.id == this.id &&
//           other.year == this.year &&
//           other.unsolvedList == this.unsolvedList &&
//           other.nowQuestion == this.nowQuestion);
// }

// class StudyStatesCompanion extends UpdateCompanion<StudyState> {
//   final Value<int> id;
//   final Value<int> year;
//   final Value<String> unsolvedList;
//   final Value<int> nowQuestion;
//   const StudyStatesCompanion({
//     this.id = const Value.absent(),
//     this.year = const Value.absent(),
//     this.unsolvedList = const Value.absent(),
//     this.nowQuestion = const Value.absent(),
//   });
//   StudyStatesCompanion.insert({
//     this.id = const Value.absent(),
//     required int year,
//     required String unsolvedList,
//     required int nowQuestion,
//   })  : year = Value(year),
//         unsolvedList = Value(unsolvedList),
//         nowQuestion = Value(nowQuestion);
//   static Insertable<StudyState> custom({
//     Expression<int>? id,
//     Expression<int>? year,
//     Expression<String>? unsolvedList,
//     Expression<int>? nowQuestion,
//   }) {
//     return RawValuesInsertable({
//       if (id != null) 'id': id,
//       if (year != null) 'year': year,
//       if (unsolvedList != null) 'unsolved_list': unsolvedList,
//       if (nowQuestion != null) 'now_question': nowQuestion,
//     });
//   }

//   StudyStatesCompanion copyWith(
//       {Value<int>? id,
//       Value<int>? year,
//       Value<String>? unsolvedList,
//       Value<int>? nowQuestion}) {
//     return StudyStatesCompanion(
//       id: id ?? this.id,
//       year: year ?? this.year,
//       unsolvedList: unsolvedList ?? this.unsolvedList,
//       nowQuestion: nowQuestion ?? this.nowQuestion,
//     );
//   }

//   @override
//   Map<String, Expression> toColumns(bool nullToAbsent) {
//     final map = <String, Expression>{};
//     if (id.present) {
//       map['id'] = Variable<int>(id.value);
//     }
//     if (year.present) {
//       map['year'] = Variable<int>(year.value);
//     }
//     if (unsolvedList.present) {
//       map['unsolved_list'] = Variable<String>(unsolvedList.value);
//     }
//     if (nowQuestion.present) {
//       map['now_question'] = Variable<int>(nowQuestion.value);
//     }
//     return map;
//   }

//   @override
//   String toString() {
//     return (StringBuffer('StudyStatesCompanion(')
//           ..write('id: $id, ')
//           ..write('year: $year, ')
//           ..write('unsolvedList: $unsolvedList, ')
//           ..write('nowQuestion: $nowQuestion')
//           ..write(')'))
//         .toString();
//   }
// }

// class $StudyStatesTable extends StudyStates
//     with TableInfo<$StudyStatesTable, StudyState> {
//   @override
//   final GeneratedDatabase attachedDatabase;
//   final String? _alias;
//   $StudyStatesTable(this.attachedDatabase, [this._alias]);
//   static const VerificationMeta _idMeta = const VerificationMeta('id');
//   @override
//   late final GeneratedColumn<int> id = GeneratedColumn<int>(
//       'id', aliasedName, false,
//       hasAutoIncrement: true,
//       type: DriftSqlType.int,
//       requiredDuringInsert: false,
//       defaultConstraints:
//           GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
//   static const VerificationMeta _yearMeta = const VerificationMeta('year');
//   @override
//   late final GeneratedColumn<int> year = GeneratedColumn<int>(
//       'year', aliasedName, false,
//       type: DriftSqlType.int, requiredDuringInsert: true);
//   static const VerificationMeta _unsolvedListMeta =
//       const VerificationMeta('unsolvedList');
//   @override
//   late final GeneratedColumn<String> unsolvedList = GeneratedColumn<String>(
//       'unsolved_list', aliasedName, false,
//       type: DriftSqlType.string, requiredDuringInsert: true);
//   static const VerificationMeta _nowQuestionMeta =
//       const VerificationMeta('nowQuestion');
//   @override
//   late final GeneratedColumn<int> nowQuestion = GeneratedColumn<int>(
//       'now_question', aliasedName, false,
//       type: DriftSqlType.int, requiredDuringInsert: true);
//   @override
//   List<GeneratedColumn> get $columns => [id, year, unsolvedList, nowQuestion];
//   @override
//   String get aliasedName => _alias ?? 'study_states';
//   @override
//   String get actualTableName => 'study_states';
//   @override
//   VerificationContext validateIntegrity(Insertable<StudyState> instance,
//       {bool isInserting = false}) {
//     final context = VerificationContext();
//     final data = instance.toColumns(true);
//     if (data.containsKey('id')) {
//       context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
//     }
//     if (data.containsKey('year')) {
//       context.handle(
//           _yearMeta, year.isAcceptableOrUnknown(data['year']!, _yearMeta));
//     } else if (isInserting) {
//       context.missing(_yearMeta);
//     }
//     if (data.containsKey('unsolved_list')) {
//       context.handle(
//           _unsolvedListMeta,
//           unsolvedList.isAcceptableOrUnknown(
//               data['unsolved_list']!, _unsolvedListMeta));
//     } else if (isInserting) {
//       context.missing(_unsolvedListMeta);
//     }
//     if (data.containsKey('now_question')) {
//       context.handle(
//           _nowQuestionMeta,
//           nowQuestion.isAcceptableOrUnknown(
//               data['now_question']!, _nowQuestionMeta));
//     } else if (isInserting) {
//       context.missing(_nowQuestionMeta);
//     }
//     return context;
//   }

//   @override
//   Set<GeneratedColumn> get $primaryKey => {id};
//   @override
//   StudyState map(Map<String, dynamic> data, {String? tablePrefix}) {
//     final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
//     return StudyState(
//       id: attachedDatabase.typeMapping
//           .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
//       year: attachedDatabase.typeMapping
//           .read(DriftSqlType.int, data['${effectivePrefix}year'])!,
//       unsolvedList: attachedDatabase.typeMapping
//           .read(DriftSqlType.string, data['${effectivePrefix}unsolved_list'])!,
//       nowQuestion: attachedDatabase.typeMapping
//           .read(DriftSqlType.int, data['${effectivePrefix}now_question'])!,
//     );
//   }

//   @override
//   $StudyStatesTable createAlias(String alias) {
//     return $StudyStatesTable(attachedDatabase, alias);
//   }
// }

// abstract class _$StateDatabase extends GeneratedDatabase {
//   _$StateDatabase(QueryExecutor e) : super(e);
//   late final $StudyStatesTable studyStates = $StudyStatesTable(this);
//   @override
//   Iterable<TableInfo<Table, Object?>> get allTables =>
//       allSchemaEntities.whereType<TableInfo<Table, Object?>>();
//   @override
//   List<DatabaseSchemaEntity> get allSchemaEntities => [studyStates];
// }
