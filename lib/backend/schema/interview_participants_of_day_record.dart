import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class InterviewParticipantsOfDayRecord extends FirestoreRecord {
  InterviewParticipantsOfDayRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "participants" field.
  List<InterviewParticipantStruct>? _participants;
  List<InterviewParticipantStruct> get participants =>
      _participants ?? const [];
  bool hasParticipants() => _participants != null;

  // "taken_users" field.
  List<DocumentReference>? _takenUsers;
  List<DocumentReference> get takenUsers => _takenUsers ?? const [];
  bool hasTakenUsers() => _takenUsers != null;

  void _initializeFields() {
    _date = snapshotData['date'] as DateTime?;
    _participants = getStructList(
      snapshotData['participants'],
      InterviewParticipantStruct.fromMap,
    );
    _takenUsers = getDataList(snapshotData['taken_users']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('interview_participants_of_day');

  static Stream<InterviewParticipantsOfDayRecord> getDocument(
          DocumentReference ref) =>
      ref
          .snapshots()
          .map((s) => InterviewParticipantsOfDayRecord.fromSnapshot(s));

  static Future<InterviewParticipantsOfDayRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => InterviewParticipantsOfDayRecord.fromSnapshot(s));

  static InterviewParticipantsOfDayRecord fromSnapshot(
          DocumentSnapshot snapshot) =>
      InterviewParticipantsOfDayRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static InterviewParticipantsOfDayRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      InterviewParticipantsOfDayRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'InterviewParticipantsOfDayRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is InterviewParticipantsOfDayRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createInterviewParticipantsOfDayRecordData({
  DateTime? date,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'date': date,
    }.withoutNulls,
  );

  return firestoreData;
}

class InterviewParticipantsOfDayRecordDocumentEquality
    implements Equality<InterviewParticipantsOfDayRecord> {
  const InterviewParticipantsOfDayRecordDocumentEquality();

  @override
  bool equals(InterviewParticipantsOfDayRecord? e1,
      InterviewParticipantsOfDayRecord? e2) {
    const listEquality = ListEquality();
    return e1?.date == e2?.date &&
        listEquality.equals(e1?.participants, e2?.participants) &&
        listEquality.equals(e1?.takenUsers, e2?.takenUsers);
  }

  @override
  int hash(InterviewParticipantsOfDayRecord? e) =>
      const ListEquality().hash([e?.date, e?.participants, e?.takenUsers]);

  @override
  bool isValidKey(Object? o) => o is InterviewParticipantsOfDayRecord;
}
