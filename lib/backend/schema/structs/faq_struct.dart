// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FaqStruct extends FFFirebaseStruct {
  FaqStruct({
    String? question,
    String? answer,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _question = question,
        _answer = answer,
        super(firestoreUtilData);

  // "question" field.
  String? _question;
  String get question => _question ?? '';
  set question(String? val) => _question = val;
  bool hasQuestion() => _question != null;

  // "answer" field.
  String? _answer;
  String get answer => _answer ?? '';
  set answer(String? val) => _answer = val;
  bool hasAnswer() => _answer != null;

  static FaqStruct fromMap(Map<String, dynamic> data) => FaqStruct(
        question: data['question'] as String?,
        answer: data['answer'] as String?,
      );

  static FaqStruct? maybeFromMap(dynamic data) =>
      data is Map ? FaqStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'question': _question,
        'answer': _answer,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'question': serializeParam(
          _question,
          ParamType.String,
        ),
        'answer': serializeParam(
          _answer,
          ParamType.String,
        ),
      }.withoutNulls;

  static FaqStruct fromSerializableMap(Map<String, dynamic> data) => FaqStruct(
        question: deserializeParam(
          data['question'],
          ParamType.String,
          false,
        ),
        answer: deserializeParam(
          data['answer'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'FaqStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is FaqStruct &&
        question == other.question &&
        answer == other.answer;
  }

  @override
  int get hashCode => const ListEquality().hash([question, answer]);
}

FaqStruct createFaqStruct({
  String? question,
  String? answer,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    FaqStruct(
      question: question,
      answer: answer,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

FaqStruct? updateFaqStruct(
  FaqStruct? faq, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    faq
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addFaqStructData(
  Map<String, dynamic> firestoreData,
  FaqStruct? faq,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (faq == null) {
    return;
  }
  if (faq.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue && faq.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final faqData = getFaqFirestoreData(faq, forFieldValue);
  final nestedData = faqData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = faq.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getFaqFirestoreData(
  FaqStruct? faq, [
  bool forFieldValue = false,
]) {
  if (faq == null) {
    return {};
  }
  final firestoreData = mapToFirestore(faq.toMap());

  // Add any Firestore field values
  faq.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getFaqListFirestoreData(
  List<FaqStruct>? faqs,
) =>
    faqs?.map((e) => getFaqFirestoreData(e, true)).toList() ?? [];
