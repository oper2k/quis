// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VideoTextGuideStruct extends FFFirebaseStruct {
  VideoTextGuideStruct({
    String? title,
    String? textHtml,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _title = title,
        _textHtml = textHtml,
        super(firestoreUtilData);

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;
  bool hasTitle() => _title != null;

  // "text_html" field.
  String? _textHtml;
  String get textHtml => _textHtml ?? '';
  set textHtml(String? val) => _textHtml = val;
  bool hasTextHtml() => _textHtml != null;

  static VideoTextGuideStruct fromMap(Map<String, dynamic> data) =>
      VideoTextGuideStruct(
        title: data['title'] as String?,
        textHtml: data['text_html'] as String?,
      );

  static VideoTextGuideStruct? maybeFromMap(dynamic data) => data is Map
      ? VideoTextGuideStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'title': _title,
        'text_html': _textHtml,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'text_html': serializeParam(
          _textHtml,
          ParamType.String,
        ),
      }.withoutNulls;

  static VideoTextGuideStruct fromSerializableMap(Map<String, dynamic> data) =>
      VideoTextGuideStruct(
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        textHtml: deserializeParam(
          data['text_html'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'VideoTextGuideStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is VideoTextGuideStruct &&
        title == other.title &&
        textHtml == other.textHtml;
  }

  @override
  int get hashCode => const ListEquality().hash([title, textHtml]);
}

VideoTextGuideStruct createVideoTextGuideStruct({
  String? title,
  String? textHtml,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    VideoTextGuideStruct(
      title: title,
      textHtml: textHtml,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

VideoTextGuideStruct? updateVideoTextGuideStruct(
  VideoTextGuideStruct? videoTextGuide, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    videoTextGuide
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addVideoTextGuideStructData(
  Map<String, dynamic> firestoreData,
  VideoTextGuideStruct? videoTextGuide,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (videoTextGuide == null) {
    return;
  }
  if (videoTextGuide.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && videoTextGuide.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final videoTextGuideData =
      getVideoTextGuideFirestoreData(videoTextGuide, forFieldValue);
  final nestedData =
      videoTextGuideData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = videoTextGuide.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getVideoTextGuideFirestoreData(
  VideoTextGuideStruct? videoTextGuide, [
  bool forFieldValue = false,
]) {
  if (videoTextGuide == null) {
    return {};
  }
  final firestoreData = mapToFirestore(videoTextGuide.toMap());

  // Add any Firestore field values
  videoTextGuide.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getVideoTextGuideListFirestoreData(
  List<VideoTextGuideStruct>? videoTextGuides,
) =>
    videoTextGuides
        ?.map((e) => getVideoTextGuideFirestoreData(e, true))
        .toList() ??
    [];
