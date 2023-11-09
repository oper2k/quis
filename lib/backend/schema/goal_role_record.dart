import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GoalRoleRecord extends FirestoreRecord {
  GoalRoleRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('goal_role');

  static Stream<GoalRoleRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => GoalRoleRecord.fromSnapshot(s));

  static Future<GoalRoleRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => GoalRoleRecord.fromSnapshot(s));

  static GoalRoleRecord fromSnapshot(DocumentSnapshot snapshot) =>
      GoalRoleRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static GoalRoleRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      GoalRoleRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'GoalRoleRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is GoalRoleRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createGoalRoleRecordData({
  String? name,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
    }.withoutNulls,
  );

  return firestoreData;
}

class GoalRoleRecordDocumentEquality implements Equality<GoalRoleRecord> {
  const GoalRoleRecordDocumentEquality();

  @override
  bool equals(GoalRoleRecord? e1, GoalRoleRecord? e2) {
    return e1?.name == e2?.name;
  }

  @override
  int hash(GoalRoleRecord? e) => const ListEquality().hash([e?.name]);

  @override
  bool isValidKey(Object? o) => o is GoalRoleRecord;
}
