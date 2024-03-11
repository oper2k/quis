// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserInRoomStruct extends FFFirebaseStruct {
  UserInRoomStruct({
    DocumentReference? refUser,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _refUser = refUser,
        super(firestoreUtilData);

  // "ref_user" field.
  DocumentReference? _refUser;
  DocumentReference? get refUser => _refUser;
  set refUser(DocumentReference? val) => _refUser = val;
  bool hasRefUser() => _refUser != null;

  static UserInRoomStruct fromMap(Map<String, dynamic> data) =>
      UserInRoomStruct(
        refUser: data['ref_user'] as DocumentReference?,
      );

  static UserInRoomStruct? maybeFromMap(dynamic data) => data is Map
      ? UserInRoomStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'ref_user': _refUser,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'ref_user': serializeParam(
          _refUser,
          ParamType.DocumentReference,
        ),
      }.withoutNulls;

  static UserInRoomStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserInRoomStruct(
        refUser: deserializeParam(
          data['ref_user'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['users'],
        ),
      );

  @override
  String toString() => 'UserInRoomStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UserInRoomStruct && refUser == other.refUser;
  }

  @override
  int get hashCode => const ListEquality().hash([refUser]);
}

UserInRoomStruct createUserInRoomStruct({
  DocumentReference? refUser,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    UserInRoomStruct(
      refUser: refUser,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

UserInRoomStruct? updateUserInRoomStruct(
  UserInRoomStruct? userInRoom, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    userInRoom
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addUserInRoomStructData(
  Map<String, dynamic> firestoreData,
  UserInRoomStruct? userInRoom,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (userInRoom == null) {
    return;
  }
  if (userInRoom.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && userInRoom.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final userInRoomData = getUserInRoomFirestoreData(userInRoom, forFieldValue);
  final nestedData = userInRoomData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = userInRoom.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getUserInRoomFirestoreData(
  UserInRoomStruct? userInRoom, [
  bool forFieldValue = false,
]) {
  if (userInRoom == null) {
    return {};
  }
  final firestoreData = mapToFirestore(userInRoom.toMap());

  // Add any Firestore field values
  userInRoom.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getUserInRoomListFirestoreData(
  List<UserInRoomStruct>? userInRooms,
) =>
    userInRooms?.map((e) => getUserInRoomFirestoreData(e, true)).toList() ?? [];
