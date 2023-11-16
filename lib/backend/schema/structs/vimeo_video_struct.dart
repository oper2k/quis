// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VimeoVideoStruct extends FFFirebaseStruct {
  VimeoVideoStruct({
    String? imagePath,
    String? vimeoVideoUrl,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _imagePath = imagePath,
        _vimeoVideoUrl = vimeoVideoUrl,
        super(firestoreUtilData);

  // "image_path" field.
  String? _imagePath;
  String get imagePath => _imagePath ?? '';
  set imagePath(String? val) => _imagePath = val;
  bool hasImagePath() => _imagePath != null;

  // "vimeo_video_url" field.
  String? _vimeoVideoUrl;
  String get vimeoVideoUrl => _vimeoVideoUrl ?? '';
  set vimeoVideoUrl(String? val) => _vimeoVideoUrl = val;
  bool hasVimeoVideoUrl() => _vimeoVideoUrl != null;

  static VimeoVideoStruct fromMap(Map<String, dynamic> data) =>
      VimeoVideoStruct(
        imagePath: data['image_path'] as String?,
        vimeoVideoUrl: data['vimeo_video_url'] as String?,
      );

  static VimeoVideoStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? VimeoVideoStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'image_path': _imagePath,
        'vimeo_video_url': _vimeoVideoUrl,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'image_path': serializeParam(
          _imagePath,
          ParamType.String,
        ),
        'vimeo_video_url': serializeParam(
          _vimeoVideoUrl,
          ParamType.String,
        ),
      }.withoutNulls;

  static VimeoVideoStruct fromSerializableMap(Map<String, dynamic> data) =>
      VimeoVideoStruct(
        imagePath: deserializeParam(
          data['image_path'],
          ParamType.String,
          false,
        ),
        vimeoVideoUrl: deserializeParam(
          data['vimeo_video_url'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'VimeoVideoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is VimeoVideoStruct &&
        imagePath == other.imagePath &&
        vimeoVideoUrl == other.vimeoVideoUrl;
  }

  @override
  int get hashCode => const ListEquality().hash([imagePath, vimeoVideoUrl]);
}

VimeoVideoStruct createVimeoVideoStruct({
  String? imagePath,
  String? vimeoVideoUrl,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    VimeoVideoStruct(
      imagePath: imagePath,
      vimeoVideoUrl: vimeoVideoUrl,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

VimeoVideoStruct? updateVimeoVideoStruct(
  VimeoVideoStruct? vimeoVideo, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    vimeoVideo
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addVimeoVideoStructData(
  Map<String, dynamic> firestoreData,
  VimeoVideoStruct? vimeoVideo,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (vimeoVideo == null) {
    return;
  }
  if (vimeoVideo.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && vimeoVideo.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final vimeoVideoData = getVimeoVideoFirestoreData(vimeoVideo, forFieldValue);
  final nestedData = vimeoVideoData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = vimeoVideo.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getVimeoVideoFirestoreData(
  VimeoVideoStruct? vimeoVideo, [
  bool forFieldValue = false,
]) {
  if (vimeoVideo == null) {
    return {};
  }
  final firestoreData = mapToFirestore(vimeoVideo.toMap());

  // Add any Firestore field values
  vimeoVideo.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getVimeoVideoListFirestoreData(
  List<VimeoVideoStruct>? vimeoVideos,
) =>
    vimeoVideos?.map((e) => getVimeoVideoFirestoreData(e, true)).toList() ?? [];
