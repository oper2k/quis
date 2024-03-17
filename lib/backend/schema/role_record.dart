import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RoleRecord extends FirestoreRecord {
  RoleRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "group" field.
  DocumentReference? _group;
  DocumentReference? get group => _group;
  bool hasGroup() => _group != null;

  // "sort" field.
  int? _sort;
  int get sort => _sort ?? 0;
  bool hasSort() => _sort != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _group = snapshotData['group'] as DocumentReference?;
    _sort = castToType<int>(snapshotData['sort']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('role');

  static Stream<RoleRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RoleRecord.fromSnapshot(s));

  static Future<RoleRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RoleRecord.fromSnapshot(s));

  static RoleRecord fromSnapshot(DocumentSnapshot snapshot) => RoleRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RoleRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RoleRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RoleRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RoleRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRoleRecordData({
  String? name,
  DocumentReference? group,
  int? sort,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'group': group,
      'sort': sort,
    }.withoutNulls,
  );

  return firestoreData;
}

class RoleRecordDocumentEquality implements Equality<RoleRecord> {
  const RoleRecordDocumentEquality();

  @override
  bool equals(RoleRecord? e1, RoleRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.group == e2?.group &&
        e1?.sort == e2?.sort;
  }

  @override
  int hash(RoleRecord? e) =>
      const ListEquality().hash([e?.name, e?.group, e?.sort]);

  @override
  bool isValidKey(Object? o) => o is RoleRecord;
}
