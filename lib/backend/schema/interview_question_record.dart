import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class InterviewQuestionRecord extends FirestoreRecord {
  InterviewQuestionRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "author" field.
  DocumentReference? _author;
  DocumentReference? get author => _author;
  bool hasAuthor() => _author != null;

  // "company" field.
  String? _company;
  String get company => _company ?? '';
  bool hasCompany() => _company != null;

  // "stage" field.
  String? _stage;
  String get stage => _stage ?? '';
  bool hasStage() => _stage != null;

  // "question" field.
  String? _question;
  String get question => _question ?? '';
  bool hasQuestion() => _question != null;

  // "user_answer" field.
  String? _userAnswer;
  String get userAnswer => _userAnswer ?? '';
  bool hasUserAnswer() => _userAnswer != null;

  // "date_interview" field.
  DateTime? _dateInterview;
  DateTime? get dateInterview => _dateInterview;
  bool hasDateInterview() => _dateInterview != null;

  // "role" field.
  String? _role;
  String get role => _role ?? '';
  bool hasRole() => _role != null;

  // "round_passed" field.
  String? _roundPassed;
  String get roundPassed => _roundPassed ?? '';
  bool hasRoundPassed() => _roundPassed != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  void _initializeFields() {
    _author = snapshotData['author'] as DocumentReference?;
    _company = snapshotData['company'] as String?;
    _stage = snapshotData['stage'] as String?;
    _question = snapshotData['question'] as String?;
    _userAnswer = snapshotData['user_answer'] as String?;
    _dateInterview = snapshotData['date_interview'] as DateTime?;
    _role = snapshotData['role'] as String?;
    _roundPassed = snapshotData['round_passed'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('interview_question');

  static Stream<InterviewQuestionRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => InterviewQuestionRecord.fromSnapshot(s));

  static Future<InterviewQuestionRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => InterviewQuestionRecord.fromSnapshot(s));

  static InterviewQuestionRecord fromSnapshot(DocumentSnapshot snapshot) =>
      InterviewQuestionRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static InterviewQuestionRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      InterviewQuestionRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'InterviewQuestionRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is InterviewQuestionRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createInterviewQuestionRecordData({
  DocumentReference? author,
  String? company,
  String? stage,
  String? question,
  String? userAnswer,
  DateTime? dateInterview,
  String? role,
  String? roundPassed,
  DateTime? createdTime,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'author': author,
      'company': company,
      'stage': stage,
      'question': question,
      'user_answer': userAnswer,
      'date_interview': dateInterview,
      'role': role,
      'round_passed': roundPassed,
      'created_time': createdTime,
    }.withoutNulls,
  );

  return firestoreData;
}

class InterviewQuestionRecordDocumentEquality
    implements Equality<InterviewQuestionRecord> {
  const InterviewQuestionRecordDocumentEquality();

  @override
  bool equals(InterviewQuestionRecord? e1, InterviewQuestionRecord? e2) {
    return e1?.author == e2?.author &&
        e1?.company == e2?.company &&
        e1?.stage == e2?.stage &&
        e1?.question == e2?.question &&
        e1?.userAnswer == e2?.userAnswer &&
        e1?.dateInterview == e2?.dateInterview &&
        e1?.role == e2?.role &&
        e1?.roundPassed == e2?.roundPassed &&
        e1?.createdTime == e2?.createdTime;
  }

  @override
  int hash(InterviewQuestionRecord? e) => const ListEquality().hash([
        e?.author,
        e?.company,
        e?.stage,
        e?.question,
        e?.userAnswer,
        e?.dateInterview,
        e?.role,
        e?.roundPassed,
        e?.createdTime
      ]);

  @override
  bool isValidKey(Object? o) => o is InterviewQuestionRecord;
}
