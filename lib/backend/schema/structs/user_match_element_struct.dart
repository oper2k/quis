// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserMatchElementStruct extends FFFirebaseStruct {
  UserMatchElementStruct({
    DocumentReference? refUser,
    bool? isLike,
    DocumentReference? refMainUser,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _refUser = refUser,
        _isLike = isLike,
        _refMainUser = refMainUser,
        super(firestoreUtilData);

  // "ref_user" field.
  DocumentReference? _refUser;
  DocumentReference? get refUser => _refUser;
  set refUser(DocumentReference? val) => _refUser = val;
  bool hasRefUser() => _refUser != null;

  // "is_like" field.
  bool? _isLike;
  bool get isLike => _isLike ?? false;
  set isLike(bool? val) => _isLike = val;
  bool hasIsLike() => _isLike != null;

  // "ref_main_user" field.
  DocumentReference? _refMainUser;
  DocumentReference? get refMainUser => _refMainUser;
  set refMainUser(DocumentReference? val) => _refMainUser = val;
  bool hasRefMainUser() => _refMainUser != null;

  static UserMatchElementStruct fromMap(Map<String, dynamic> data) =>
      UserMatchElementStruct(
        refUser: data['ref_user'] as DocumentReference?,
        isLike: data['is_like'] as bool?,
        refMainUser: data['ref_main_user'] as DocumentReference?,
      );

  static UserMatchElementStruct? maybeFromMap(dynamic data) => data is Map
      ? UserMatchElementStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'ref_user': _refUser,
        'is_like': _isLike,
        'ref_main_user': _refMainUser,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'ref_user': serializeParam(
          _refUser,
          ParamType.DocumentReference,
        ),
        'is_like': serializeParam(
          _isLike,
          ParamType.bool,
        ),
        'ref_main_user': serializeParam(
          _refMainUser,
          ParamType.DocumentReference,
        ),
      }.withoutNulls;

  static UserMatchElementStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      UserMatchElementStruct(
        refUser: deserializeParam(
          data['ref_user'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['users'],
        ),
        isLike: deserializeParam(
          data['is_like'],
          ParamType.bool,
          false,
        ),
        refMainUser: deserializeParam(
          data['ref_main_user'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['users'],
        ),
      );

  @override
  String toString() => 'UserMatchElementStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UserMatchElementStruct &&
        refUser == other.refUser &&
        isLike == other.isLike &&
        refMainUser == other.refMainUser;
  }

  @override
  int get hashCode => const ListEquality().hash([refUser, isLike, refMainUser]);
}

UserMatchElementStruct createUserMatchElementStruct({
  DocumentReference? refUser,
  bool? isLike,
  DocumentReference? refMainUser,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    UserMatchElementStruct(
      refUser: refUser,
      isLike: isLike,
      refMainUser: refMainUser,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

UserMatchElementStruct? updateUserMatchElementStruct(
  UserMatchElementStruct? userMatchElement, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    userMatchElement
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addUserMatchElementStructData(
  Map<String, dynamic> firestoreData,
  UserMatchElementStruct? userMatchElement,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (userMatchElement == null) {
    return;
  }
  if (userMatchElement.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && userMatchElement.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final userMatchElementData =
      getUserMatchElementFirestoreData(userMatchElement, forFieldValue);
  final nestedData =
      userMatchElementData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = userMatchElement.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getUserMatchElementFirestoreData(
  UserMatchElementStruct? userMatchElement, [
  bool forFieldValue = false,
]) {
  if (userMatchElement == null) {
    return {};
  }
  final firestoreData = mapToFirestore(userMatchElement.toMap());

  // Add any Firestore field values
  userMatchElement.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getUserMatchElementListFirestoreData(
  List<UserMatchElementStruct>? userMatchElements,
) =>
    userMatchElements
        ?.map((e) => getUserMatchElementFirestoreData(e, true))
        .toList() ??
    [];
