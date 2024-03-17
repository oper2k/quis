import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class InterviewParticipantsOfDayRecord extends FirestoreRecord {
  InterviewParticipantsOfDayRecord._(
    super.reference,
    super.data,
  ) {
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

  // "joined_users" field.
  List<DocumentReference>? _joinedUsers;
  List<DocumentReference> get joinedUsers => _joinedUsers ?? const [];
  bool hasJoinedUsers() => _joinedUsers != null;

  // "is_checked" field.
  bool? _isChecked;
  bool get isChecked => _isChecked ?? false;
  bool hasIsChecked() => _isChecked != null;

  void _initializeFields() {
    _date = snapshotData['date'] as DateTime?;
    _participants = getStructList(
      snapshotData['participants'],
      InterviewParticipantStruct.fromMap,
    );
    _takenUsers = getDataList(snapshotData['taken_users']);
    _joinedUsers = getDataList(snapshotData['joined_users']);
    _isChecked = snapshotData['is_checked'] as bool?;
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
  bool? isChecked,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'date': date,
      'is_checked': isChecked,
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
        listEquality.equals(e1?.takenUsers, e2?.takenUsers) &&
        listEquality.equals(e1?.joinedUsers, e2?.joinedUsers) &&
        e1?.isChecked == e2?.isChecked;
  }

  @override
  int hash(InterviewParticipantsOfDayRecord? e) => const ListEquality().hash(
      [e?.date, e?.participants, e?.takenUsers, e?.joinedUsers, e?.isChecked]);

  @override
  bool isValidKey(Object? o) => o is InterviewParticipantsOfDayRecord;
}
