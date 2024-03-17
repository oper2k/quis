// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CommentStruct extends FFFirebaseStruct {
  CommentStruct({
    String? text,
    DateTime? createdTime,
    DocumentReference? user,
    List<LikeDislikeStruct>? likeDislike,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _text = text,
        _createdTime = createdTime,
        _user = user,
        _likeDislike = likeDislike,
        super(firestoreUtilData);

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  set text(String? val) => _text = val;
  bool hasText() => _text != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  set createdTime(DateTime? val) => _createdTime = val;
  bool hasCreatedTime() => _createdTime != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  set user(DocumentReference? val) => _user = val;
  bool hasUser() => _user != null;

  // "like_dislike" field.
  List<LikeDislikeStruct>? _likeDislike;
  List<LikeDislikeStruct> get likeDislike => _likeDislike ?? const [];
  set likeDislike(List<LikeDislikeStruct>? val) => _likeDislike = val;
  void updateLikeDislike(Function(List<LikeDislikeStruct>) updateFn) =>
      updateFn(_likeDislike ??= []);
  bool hasLikeDislike() => _likeDislike != null;

  static CommentStruct fromMap(Map<String, dynamic> data) => CommentStruct(
        text: data['text'] as String?,
        createdTime: data['created_time'] as DateTime?,
        user: data['user'] as DocumentReference?,
        likeDislike: getStructList(
          data['like_dislike'],
          LikeDislikeStruct.fromMap,
        ),
      );

  static CommentStruct? maybeFromMap(dynamic data) =>
      data is Map ? CommentStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'text': _text,
        'created_time': _createdTime,
        'user': _user,
        'like_dislike': _likeDislike?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'text': serializeParam(
          _text,
          ParamType.String,
        ),
        'created_time': serializeParam(
          _createdTime,
          ParamType.DateTime,
        ),
        'user': serializeParam(
          _user,
          ParamType.DocumentReference,
        ),
        'like_dislike': serializeParam(
          _likeDislike,
          ParamType.DataStruct,
          true,
        ),
      }.withoutNulls;

  static CommentStruct fromSerializableMap(Map<String, dynamic> data) =>
      CommentStruct(
        text: deserializeParam(
          data['text'],
          ParamType.String,
          false,
        ),
        createdTime: deserializeParam(
          data['created_time'],
          ParamType.DateTime,
          false,
        ),
        user: deserializeParam(
          data['user'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['users'],
        ),
        likeDislike: deserializeStructParam<LikeDislikeStruct>(
          data['like_dislike'],
          ParamType.DataStruct,
          true,
          structBuilder: LikeDislikeStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'CommentStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is CommentStruct &&
        text == other.text &&
        createdTime == other.createdTime &&
        user == other.user &&
        listEquality.equals(likeDislike, other.likeDislike);
  }

  @override
  int get hashCode =>
      const ListEquality().hash([text, createdTime, user, likeDislike]);
}

CommentStruct createCommentStruct({
  String? text,
  DateTime? createdTime,
  DocumentReference? user,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CommentStruct(
      text: text,
      createdTime: createdTime,
      user: user,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CommentStruct? updateCommentStruct(
  CommentStruct? comment, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    comment
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCommentStructData(
  Map<String, dynamic> firestoreData,
  CommentStruct? comment,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (comment == null) {
    return;
  }
  if (comment.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && comment.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final commentData = getCommentFirestoreData(comment, forFieldValue);
  final nestedData = commentData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = comment.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCommentFirestoreData(
  CommentStruct? comment, [
  bool forFieldValue = false,
]) {
  if (comment == null) {
    return {};
  }
  final firestoreData = mapToFirestore(comment.toMap());

  // Add any Firestore field values
  comment.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCommentListFirestoreData(
  List<CommentStruct>? comments,
) =>
    comments?.map((e) => getCommentFirestoreData(e, true)).toList() ?? [];
