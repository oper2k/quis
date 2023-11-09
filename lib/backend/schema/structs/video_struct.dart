// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VideoStruct extends FFFirebaseStruct {
  VideoStruct({
    String? videoPath,
    String? imagePath,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _videoPath = videoPath,
        _imagePath = imagePath,
        super(firestoreUtilData);

  // "video_path" field.
  String? _videoPath;
  String get videoPath => _videoPath ?? '';
  set videoPath(String? val) => _videoPath = val;
  bool hasVideoPath() => _videoPath != null;

  // "image_path" field.
  String? _imagePath;
  String get imagePath => _imagePath ?? '';
  set imagePath(String? val) => _imagePath = val;
  bool hasImagePath() => _imagePath != null;

  static VideoStruct fromMap(Map<String, dynamic> data) => VideoStruct(
        videoPath: data['video_path'] as String?,
        imagePath: data['image_path'] as String?,
      );

  static VideoStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? VideoStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'video_path': _videoPath,
        'image_path': _imagePath,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'video_path': serializeParam(
          _videoPath,
          ParamType.String,
        ),
        'image_path': serializeParam(
          _imagePath,
          ParamType.String,
        ),
      }.withoutNulls;

  static VideoStruct fromSerializableMap(Map<String, dynamic> data) =>
      VideoStruct(
        videoPath: deserializeParam(
          data['video_path'],
          ParamType.String,
          false,
        ),
        imagePath: deserializeParam(
          data['image_path'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'VideoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is VideoStruct &&
        videoPath == other.videoPath &&
        imagePath == other.imagePath;
  }

  @override
  int get hashCode => const ListEquality().hash([videoPath, imagePath]);
}

VideoStruct createVideoStruct({
  String? videoPath,
  String? imagePath,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    VideoStruct(
      videoPath: videoPath,
      imagePath: imagePath,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

VideoStruct? updateVideoStruct(
  VideoStruct? video, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    video
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addVideoStructData(
  Map<String, dynamic> firestoreData,
  VideoStruct? video,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (video == null) {
    return;
  }
  if (video.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && video.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final videoData = getVideoFirestoreData(video, forFieldValue);
  final nestedData = videoData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = video.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getVideoFirestoreData(
  VideoStruct? video, [
  bool forFieldValue = false,
]) {
  if (video == null) {
    return {};
  }
  final firestoreData = mapToFirestore(video.toMap());

  // Add any Firestore field values
  video.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getVideoListFirestoreData(
  List<VideoStruct>? videos,
) =>
    videos?.map((e) => getVideoFirestoreData(e, true)).toList() ?? [];
