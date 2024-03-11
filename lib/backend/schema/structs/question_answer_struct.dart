// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class QuestionAnswerStruct extends FFFirebaseStruct {
  QuestionAnswerStruct({
    int? index,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _index = index,
        super(firestoreUtilData);

  // "index" field.
  int? _index;
  int get index => _index ?? 0;
  set index(int? val) => _index = val;
  void incrementIndex(int amount) => _index = index + amount;
  bool hasIndex() => _index != null;

  static QuestionAnswerStruct fromMap(Map<String, dynamic> data) =>
      QuestionAnswerStruct(
        index: castToType<int>(data['index']),
      );

  static QuestionAnswerStruct? maybeFromMap(dynamic data) => data is Map
      ? QuestionAnswerStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'index': _index,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'index': serializeParam(
          _index,
          ParamType.int,
        ),
      }.withoutNulls;

  static QuestionAnswerStruct fromSerializableMap(Map<String, dynamic> data) =>
      QuestionAnswerStruct(
        index: deserializeParam(
          data['index'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'QuestionAnswerStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is QuestionAnswerStruct && index == other.index;
  }

  @override
  int get hashCode => const ListEquality().hash([index]);
}

QuestionAnswerStruct createQuestionAnswerStruct({
  int? index,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    QuestionAnswerStruct(
      index: index,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

QuestionAnswerStruct? updateQuestionAnswerStruct(
  QuestionAnswerStruct? questionAnswer, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    questionAnswer
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addQuestionAnswerStructData(
  Map<String, dynamic> firestoreData,
  QuestionAnswerStruct? questionAnswer,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (questionAnswer == null) {
    return;
  }
  if (questionAnswer.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && questionAnswer.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final questionAnswerData =
      getQuestionAnswerFirestoreData(questionAnswer, forFieldValue);
  final nestedData =
      questionAnswerData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = questionAnswer.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getQuestionAnswerFirestoreData(
  QuestionAnswerStruct? questionAnswer, [
  bool forFieldValue = false,
]) {
  if (questionAnswer == null) {
    return {};
  }
  final firestoreData = mapToFirestore(questionAnswer.toMap());

  // Add any Firestore field values
  questionAnswer.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getQuestionAnswerListFirestoreData(
  List<QuestionAnswerStruct>? questionAnswers,
) =>
    questionAnswers
        ?.map((e) => getQuestionAnswerFirestoreData(e, true))
        .toList() ??
    [];
