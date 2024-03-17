// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LikeDislikeStruct extends FFFirebaseStruct {
  LikeDislikeStruct({
    DocumentReference? user,
    bool? isLike,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _user = user,
        _isLike = isLike,
        super(firestoreUtilData);

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  set user(DocumentReference? val) => _user = val;
  bool hasUser() => _user != null;

  // "is_like" field.
  bool? _isLike;
  bool get isLike => _isLike ?? false;
  set isLike(bool? val) => _isLike = val;
  bool hasIsLike() => _isLike != null;

  static LikeDislikeStruct fromMap(Map<String, dynamic> data) =>
      LikeDislikeStruct(
        user: data['user'] as DocumentReference?,
        isLike: data['is_like'] as bool?,
      );

  static LikeDislikeStruct? maybeFromMap(dynamic data) => data is Map
      ? LikeDislikeStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'user': _user,
        'is_like': _isLike,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'user': serializeParam(
          _user,
          ParamType.DocumentReference,
        ),
        'is_like': serializeParam(
          _isLike,
          ParamType.bool,
        ),
      }.withoutNulls;

  static LikeDislikeStruct fromSerializableMap(Map<String, dynamic> data) =>
      LikeDislikeStruct(
        user: deserializeParam(
          data['user'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['users'],
        ),
        isLike: deserializeParam(
          data['is_like'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'LikeDislikeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is LikeDislikeStruct &&
        user == other.user &&
        isLike == other.isLike;
  }

  @override
  int get hashCode => const ListEquality().hash([user, isLike]);
}

LikeDislikeStruct createLikeDislikeStruct({
  DocumentReference? user,
  bool? isLike,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    LikeDislikeStruct(
      user: user,
      isLike: isLike,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

LikeDislikeStruct? updateLikeDislikeStruct(
  LikeDislikeStruct? likeDislike, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    likeDislike
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addLikeDislikeStructData(
  Map<String, dynamic> firestoreData,
  LikeDislikeStruct? likeDislike,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (likeDislike == null) {
    return;
  }
  if (likeDislike.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && likeDislike.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final likeDislikeData =
      getLikeDislikeFirestoreData(likeDislike, forFieldValue);
  final nestedData =
      likeDislikeData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = likeDislike.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getLikeDislikeFirestoreData(
  LikeDislikeStruct? likeDislike, [
  bool forFieldValue = false,
]) {
  if (likeDislike == null) {
    return {};
  }
  final firestoreData = mapToFirestore(likeDislike.toMap());

  // Add any Firestore field values
  likeDislike.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getLikeDislikeListFirestoreData(
  List<LikeDislikeStruct>? likeDislikes,
) =>
    likeDislikes?.map((e) => getLikeDislikeFirestoreData(e, true)).toList() ??
    [];
