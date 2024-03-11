// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LikedUserItemStruct extends FFFirebaseStruct {
  LikedUserItemStruct({
    DocumentReference? refUser,
    DateTime? date,
    String? top,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _refUser = refUser,
        _date = date,
        _top = top,
        super(firestoreUtilData);

  // "ref_user" field.
  DocumentReference? _refUser;
  DocumentReference? get refUser => _refUser;
  set refUser(DocumentReference? val) => _refUser = val;
  bool hasRefUser() => _refUser != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  set date(DateTime? val) => _date = val;
  bool hasDate() => _date != null;

  // "top" field.
  String? _top;
  String get top => _top ?? '';
  set top(String? val) => _top = val;
  bool hasTop() => _top != null;

  static LikedUserItemStruct fromMap(Map<String, dynamic> data) =>
      LikedUserItemStruct(
        refUser: data['ref_user'] as DocumentReference?,
        date: data['date'] as DateTime?,
        top: data['top'] as String?,
      );

  static LikedUserItemStruct? maybeFromMap(dynamic data) => data is Map
      ? LikedUserItemStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'ref_user': _refUser,
        'date': _date,
        'top': _top,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'ref_user': serializeParam(
          _refUser,
          ParamType.DocumentReference,
        ),
        'date': serializeParam(
          _date,
          ParamType.DateTime,
        ),
        'top': serializeParam(
          _top,
          ParamType.String,
        ),
      }.withoutNulls;

  static LikedUserItemStruct fromSerializableMap(Map<String, dynamic> data) =>
      LikedUserItemStruct(
        refUser: deserializeParam(
          data['ref_user'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['users'],
        ),
        date: deserializeParam(
          data['date'],
          ParamType.DateTime,
          false,
        ),
        top: deserializeParam(
          data['top'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'LikedUserItemStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is LikedUserItemStruct &&
        refUser == other.refUser &&
        date == other.date &&
        top == other.top;
  }

  @override
  int get hashCode => const ListEquality().hash([refUser, date, top]);
}

LikedUserItemStruct createLikedUserItemStruct({
  DocumentReference? refUser,
  DateTime? date,
  String? top,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    LikedUserItemStruct(
      refUser: refUser,
      date: date,
      top: top,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

LikedUserItemStruct? updateLikedUserItemStruct(
  LikedUserItemStruct? likedUserItem, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    likedUserItem
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addLikedUserItemStructData(
  Map<String, dynamic> firestoreData,
  LikedUserItemStruct? likedUserItem,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (likedUserItem == null) {
    return;
  }
  if (likedUserItem.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && likedUserItem.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final likedUserItemData =
      getLikedUserItemFirestoreData(likedUserItem, forFieldValue);
  final nestedData =
      likedUserItemData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = likedUserItem.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getLikedUserItemFirestoreData(
  LikedUserItemStruct? likedUserItem, [
  bool forFieldValue = false,
]) {
  if (likedUserItem == null) {
    return {};
  }
  final firestoreData = mapToFirestore(likedUserItem.toMap());

  // Add any Firestore field values
  likedUserItem.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getLikedUserItemListFirestoreData(
  List<LikedUserItemStruct>? likedUserItems,
) =>
    likedUserItems
        ?.map((e) => getLikedUserItemFirestoreData(e, true))
        .toList() ??
    [];
