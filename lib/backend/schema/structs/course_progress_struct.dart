// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CourseProgressStruct extends FFFirebaseStruct {
  CourseProgressStruct({
    DocumentReference? refCourse,
    List<DocumentReference>? refVideos,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _refCourse = refCourse,
        _refVideos = refVideos,
        super(firestoreUtilData);

  // "ref_course" field.
  DocumentReference? _refCourse;
  DocumentReference? get refCourse => _refCourse;
  set refCourse(DocumentReference? val) => _refCourse = val;
  bool hasRefCourse() => _refCourse != null;

  // "ref_videos" field.
  List<DocumentReference>? _refVideos;
  List<DocumentReference> get refVideos => _refVideos ?? const [];
  set refVideos(List<DocumentReference>? val) => _refVideos = val;
  void updateRefVideos(Function(List<DocumentReference>) updateFn) =>
      updateFn(_refVideos ??= []);
  bool hasRefVideos() => _refVideos != null;

  static CourseProgressStruct fromMap(Map<String, dynamic> data) =>
      CourseProgressStruct(
        refCourse: data['ref_course'] as DocumentReference?,
        refVideos: getDataList(data['ref_videos']),
      );

  static CourseProgressStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? CourseProgressStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'ref_course': _refCourse,
        'ref_videos': _refVideos,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'ref_course': serializeParam(
          _refCourse,
          ParamType.DocumentReference,
        ),
        'ref_videos': serializeParam(
          _refVideos,
          ParamType.DocumentReference,
          true,
        ),
      }.withoutNulls;

  static CourseProgressStruct fromSerializableMap(Map<String, dynamic> data) =>
      CourseProgressStruct(
        refCourse: deserializeParam(
          data['ref_course'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['course'],
        ),
        refVideos: deserializeParam<DocumentReference>(
          data['ref_videos'],
          ParamType.DocumentReference,
          true,
          collectionNamePath: ['course_video'],
        ),
      );

  @override
  String toString() => 'CourseProgressStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is CourseProgressStruct &&
        refCourse == other.refCourse &&
        listEquality.equals(refVideos, other.refVideos);
  }

  @override
  int get hashCode => const ListEquality().hash([refCourse, refVideos]);
}

CourseProgressStruct createCourseProgressStruct({
  DocumentReference? refCourse,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CourseProgressStruct(
      refCourse: refCourse,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CourseProgressStruct? updateCourseProgressStruct(
  CourseProgressStruct? courseProgress, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    courseProgress
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCourseProgressStructData(
  Map<String, dynamic> firestoreData,
  CourseProgressStruct? courseProgress,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (courseProgress == null) {
    return;
  }
  if (courseProgress.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && courseProgress.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final courseProgressData =
      getCourseProgressFirestoreData(courseProgress, forFieldValue);
  final nestedData =
      courseProgressData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = courseProgress.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCourseProgressFirestoreData(
  CourseProgressStruct? courseProgress, [
  bool forFieldValue = false,
]) {
  if (courseProgress == null) {
    return {};
  }
  final firestoreData = mapToFirestore(courseProgress.toMap());

  // Add any Firestore field values
  courseProgress.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCourseProgressListFirestoreData(
  List<CourseProgressStruct>? courseProgresss,
) =>
    courseProgresss
        ?.map((e) => getCourseProgressFirestoreData(e, true))
        .toList() ??
    [];
