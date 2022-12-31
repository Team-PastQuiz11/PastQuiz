// // GENERATED CODE - DO NOT MODIFY BY HAND

// part of 'userRecords.dart';

// // ignore_for_file: type=lint
// class UserRecord extends DataClass implements Insertable<UserRecord> {
//   final int id;
//   final int year;
//   final int questionNumber;
//   final bool isCorrect;
//   const UserRecord(
//       {required this.id,
//       required this.year,
//       required this.questionNumber,
//       required this.isCorrect});
//   @override
//   Map<String, Expression> toColumns(bool nullToAbsent) {
//     final map = <String, Expression>{};
//     map['id'] = Variable<int>(id);
//     map['year'] = Variable<int>(year);
//     map['question_number'] = Variable<int>(questionNumber);
//     map['is_correct'] = Variable<bool>(isCorrect);
//     return map;
//   }

//   UserRecordsCompanion toCompanion(bool nullToAbsent) {
//     return UserRecordsCompanion(
//       id: Value(id),
//       year: Value(year),
//       questionNumber: Value(questionNumber),
//       isCorrect: Value(isCorrect),
//     );
//   }

//   factory UserRecord.fromJson(Map<String, dynamic> json,
//       {ValueSerializer? serializer}) {
//     serializer ??= driftRuntimeOptions.defaultSerializer;
//     return UserRecord(
//       id: serializer.fromJson<int>(json['id']),
//       year: serializer.fromJson<int>(json['year']),
//       questionNumber: serializer.fromJson<int>(json['questionNumber']),
//       isCorrect: serializer.fromJson<bool>(json['isCorrect']),
//     );
//   }
//   @override
//   Map<String, dynamic> toJson({ValueSerializer? serializer}) {
//     serializer ??= driftRuntimeOptions.defaultSerializer;
//     return <String, dynamic>{
//       'id': serializer.toJson<int>(id),
//       'year': serializer.toJson<int>(year),
//       'questionNumber': serializer.toJson<int>(questionNumber),
//       'isCorrect': serializer.toJson<bool>(isCorrect),
//     };
//   }

//   UserRecord copyWith(
//           {int? id, int? year, int? questionNumber, bool? isCorrect}) =>
//       UserRecord(
//         id: id ?? this.id,
//         year: year ?? this.year,
//         questionNumber: questionNumber ?? this.questionNumber,
//         isCorrect: isCorrect ?? this.isCorrect,
//       );
//   @override
//   String toString() {
//     return (StringBuffer('UserRecord(')
//           ..write('id: $id, ')
//           ..write('year: $year, ')
//           ..write('questionNumber: $questionNumber, ')
//           ..write('isCorrect: $isCorrect')
//           ..write(')'))
//         .toString();
//   }

//   @override
//   int get hashCode => Object.hash(id, year, questionNumber, isCorrect);
//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//       (other is UserRecord &&
//           other.id == this.id &&
//           other.year == this.year &&
//           other.questionNumber == this.questionNumber &&
//           other.isCorrect == this.isCorrect);
// }

// class UserRecordsCompanion extends UpdateCompanion<UserRecord> {
//   final Value<int> id;
//   final Value<int> year;
//   final Value<int> questionNumber;
//   final Value<bool> isCorrect;
//   const UserRecordsCompanion({
//     this.id = const Value.absent(),
//     this.year = const Value.absent(),
//     this.questionNumber = const Value.absent(),
//     this.isCorrect = const Value.absent(),
//   });
//   UserRecordsCompanion.insert({
//     this.id = const Value.absent(),
//     required int year,
//     required int questionNumber,
//     required bool isCorrect,
//   })  : year = Value(year),
//         questionNumber = Value(questionNumber),
//         isCorrect = Value(isCorrect);
//   static Insertable<UserRecord> custom({
//     Expression<int>? id,
//     Expression<int>? year,
//     Expression<int>? questionNumber,
//     Expression<bool>? isCorrect,
//   }) {
//     return RawValuesInsertable({
//       if (id != null) 'id': id,
//       if (year != null) 'year': year,
//       if (questionNumber != null) 'question_number': questionNumber,
//       if (isCorrect != null) 'is_correct': isCorrect,
//     });
//   }

//   UserRecordsCompanion copyWith(
//       {Value<int>? id,
//       Value<int>? year,
//       Value<int>? questionNumber,
//       Value<bool>? isCorrect}) {
//     return UserRecordsCompanion(
//       id: id ?? this.id,
//       year: year ?? this.year,
//       questionNumber: questionNumber ?? this.questionNumber,
//       isCorrect: isCorrect ?? this.isCorrect,
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
//     if (questionNumber.present) {
//       map['question_number'] = Variable<int>(questionNumber.value);
//     }
//     if (isCorrect.present) {
//       map['is_correct'] = Variable<bool>(isCorrect.value);
//     }
//     return map;
//   }

//   @override
//   String toString() {
//     return (StringBuffer('UserRecordsCompanion(')
//           ..write('id: $id, ')
//           ..write('year: $year, ')
//           ..write('questionNumber: $questionNumber, ')
//           ..write('isCorrect: $isCorrect')
//           ..write(')'))
//         .toString();
//   }
// }

// class $UserRecordsTable extends UserRecords
//     with TableInfo<$UserRecordsTable, UserRecord> {
//   @override
//   final GeneratedDatabase attachedDatabase;
//   final String? _alias;
//   $UserRecordsTable(this.attachedDatabase, [this._alias]);
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
//   static const VerificationMeta _questionNumberMeta =
//       const VerificationMeta('questionNumber');
//   @override
//   late final GeneratedColumn<int> questionNumber = GeneratedColumn<int>(
//       'question_number', aliasedName, false,
//       type: DriftSqlType.int, requiredDuringInsert: true);
//   static const VerificationMeta _isCorrectMeta =
//       const VerificationMeta('isCorrect');
//   @override
//   late final GeneratedColumn<bool> isCorrect =
//       GeneratedColumn<bool>('is_correct', aliasedName, false,
//           type: DriftSqlType.bool,
//           requiredDuringInsert: true,
//           defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
//             SqlDialect.sqlite: 'CHECK ("is_correct" IN (0, 1))',
//             SqlDialect.mysql: '',
//             SqlDialect.postgres: '',
//           }));
//   @override
//   List<GeneratedColumn> get $columns => [id, year, questionNumber, isCorrect];
//   @override
//   String get aliasedName => _alias ?? 'user_records';
//   @override
//   String get actualTableName => 'user_records';
//   @override
//   VerificationContext validateIntegrity(Insertable<UserRecord> instance,
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
//     if (data.containsKey('question_number')) {
//       context.handle(
//           _questionNumberMeta,
//           questionNumber.isAcceptableOrUnknown(
//               data['question_number']!, _questionNumberMeta));
//     } else if (isInserting) {
//       context.missing(_questionNumberMeta);
//     }
//     if (data.containsKey('is_correct')) {
//       context.handle(_isCorrectMeta,
//           isCorrect.isAcceptableOrUnknown(data['is_correct']!, _isCorrectMeta));
//     } else if (isInserting) {
//       context.missing(_isCorrectMeta);
//     }
//     return context;
//   }

//   @override
//   Set<GeneratedColumn> get $primaryKey => {id};
//   @override
//   UserRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
//     final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
//     return UserRecord(
//       id: attachedDatabase.typeMapping
//           .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
//       year: attachedDatabase.typeMapping
//           .read(DriftSqlType.int, data['${effectivePrefix}year'])!,
//       questionNumber: attachedDatabase.typeMapping
//           .read(DriftSqlType.int, data['${effectivePrefix}question_number'])!,
//       isCorrect: attachedDatabase.typeMapping
//           .read(DriftSqlType.bool, data['${effectivePrefix}is_correct'])!,
//     );
//   }

//   @override
//   $UserRecordsTable createAlias(String alias) {
//     return $UserRecordsTable(attachedDatabase, alias);
//   }
// }

// abstract class _$UserDatabase extends GeneratedDatabase {
//   _$UserDatabase(QueryExecutor e) : super(e);
//   late final $UserRecordsTable userRecords = $UserRecordsTable(this);
//   @override
//   Iterable<TableInfo<Table, Object?>> get allTables =>
//       allSchemaEntities.whereType<TableInfo<Table, Object?>>();
//   @override
//   List<DatabaseSchemaEntity> get allSchemaEntities => [userRecords];
// }
