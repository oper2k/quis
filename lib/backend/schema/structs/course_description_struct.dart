// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CourseDescriptionStruct extends FFFirebaseStruct {
  CourseDescriptionStruct({
    String? text,
    List<String>? included,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _text = text,
        _included = included,
        super(firestoreUtilData);

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  set text(String? val) => _text = val;
  bool hasText() => _text != null;

  // "included" field.
  List<String>? _included;
  List<String> get included => _included ?? const [];
  set included(List<String>? val) => _included = val;
  void updateIncluded(Function(List<String>) updateFn) =>
      updateFn(_included ??= []);
  bool hasIncluded() => _included != null;

  static CourseDescriptionStruct fromMap(Map<String, dynamic> data) =>
      CourseDescriptionStruct(
        text: data['text'] as String?,
        included: getDataList(data['included']),
      );

  static CourseDescriptionStruct? maybeFromMap(dynamic data) => data is Map
      ? CourseDescriptionStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'text': _text,
        'included': _included,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'text': serializeParam(
          _text,
          ParamType.String,
        ),
        'included': serializeParam(
          _included,
          ParamType.String,
          true,
        ),
      }.withoutNulls;

  static CourseDescriptionStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      CourseDescriptionStruct(
        text: deserializeParam(
          data['text'],
          ParamType.String,
          false,
        ),
        included: deserializeParam<String>(
          data['included'],
          ParamType.String,
          true,
        ),
      );

  @override
  String toString() => 'CourseDescriptionStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is CourseDescriptionStruct &&
        text == other.text &&
        listEquality.equals(included, other.included);
  }

  @override
  int get hashCode => const ListEquality().hash([text, included]);
}

CourseDescriptionStruct createCourseDescriptionStruct({
  String? text,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CourseDescriptionStruct(
      text: text,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CourseDescriptionStruct? updateCourseDescriptionStruct(
  CourseDescriptionStruct? courseDescription, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    courseDescription
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCourseDescriptionStructData(
  Map<String, dynamic> firestoreData,
  CourseDescriptionStruct? courseDescription,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (courseDescription == null) {
    return;
  }
  if (courseDescription.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && courseDescription.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final courseDescriptionData =
      getCourseDescriptionFirestoreData(courseDescription, forFieldValue);
  final nestedData =
      courseDescriptionData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = courseDescription.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCourseDescriptionFirestoreData(
  CourseDescriptionStruct? courseDescription, [
  bool forFieldValue = false,
]) {
  if (courseDescription == null) {
    return {};
  }
  final firestoreData = mapToFirestore(courseDescription.toMap());

  // Add any Firestore field values
  courseDescription.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCourseDescriptionListFirestoreData(
  List<CourseDescriptionStruct>? courseDescriptions,
) =>
    courseDescriptions
        ?.map((e) => getCourseDescriptionFirestoreData(e, true))
        .toList() ??
    [];
