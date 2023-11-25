import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ConferenceRoomRecord extends FirestoreRecord {
  ConferenceRoomRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "users" field.
  List<DocumentReference>? _users;
  List<DocumentReference> get users => _users ?? const [];
  bool hasUsers() => _users != null;

  // "room_id" field.
  int? _roomId;
  int get roomId => _roomId ?? 0;
  bool hasRoomId() => _roomId != null;

  void _initializeFields() {
    _date = snapshotData['date'] as DateTime?;
    _users = getDataList(snapshotData['users']);
    _roomId = castToType<int>(snapshotData['room_id']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('conference_room');

  static Stream<ConferenceRoomRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ConferenceRoomRecord.fromSnapshot(s));

  static Future<ConferenceRoomRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ConferenceRoomRecord.fromSnapshot(s));

  static ConferenceRoomRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ConferenceRoomRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ConferenceRoomRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ConferenceRoomRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ConferenceRoomRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ConferenceRoomRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createConferenceRoomRecordData({
  DateTime? date,
  int? roomId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'date': date,
      'room_id': roomId,
    }.withoutNulls,
  );

  return firestoreData;
}

class ConferenceRoomRecordDocumentEquality
    implements Equality<ConferenceRoomRecord> {
  const ConferenceRoomRecordDocumentEquality();

  @override
  bool equals(ConferenceRoomRecord? e1, ConferenceRoomRecord? e2) {
    const listEquality = ListEquality();
    return e1?.date == e2?.date &&
        listEquality.equals(e1?.users, e2?.users) &&
        e1?.roomId == e2?.roomId;
  }

  @override
  int hash(ConferenceRoomRecord? e) =>
      const ListEquality().hash([e?.date, e?.users, e?.roomId]);

  @override
  bool isValidKey(Object? o) => o is ConferenceRoomRecord;
}
