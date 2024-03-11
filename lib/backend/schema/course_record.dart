import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CourseRecord extends FirestoreRecord {
  CourseRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "preview_video" field.
  VideoStruct? _previewVideo;
  VideoStruct get previewVideo => _previewVideo ?? VideoStruct();
  bool hasPreviewVideo() => _previewVideo != null;

  // "main_image" field.
  String? _mainImage;
  String get mainImage => _mainImage ?? '';
  bool hasMainImage() => _mainImage != null;

  // "rating" field.
  RatingStruct? _rating;
  RatingStruct get rating => _rating ?? RatingStruct();
  bool hasRating() => _rating != null;

  // "description" field.
  CourseDescriptionStruct? _description;
  CourseDescriptionStruct get description =>
      _description ?? CourseDescriptionStruct();
  bool hasDescription() => _description != null;

  // "faq" field.
  List<FaqStruct>? _faq;
  List<FaqStruct> get faq => _faq ?? const [];
  bool hasFaq() => _faq != null;

  // "preview_vimeo_video_url" field.
  String? _previewVimeoVideoUrl;
  String get previewVimeoVideoUrl => _previewVimeoVideoUrl ?? '';
  bool hasPreviewVimeoVideoUrl() => _previewVimeoVideoUrl != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _previewVideo = VideoStruct.maybeFromMap(snapshotData['preview_video']);
    _mainImage = snapshotData['main_image'] as String?;
    _rating = RatingStruct.maybeFromMap(snapshotData['rating']);
    _description =
        CourseDescriptionStruct.maybeFromMap(snapshotData['description']);
    _faq = getStructList(
      snapshotData['faq'],
      FaqStruct.fromMap,
    );
    _previewVimeoVideoUrl = snapshotData['preview_vimeo_video_url'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('course');

  static Stream<CourseRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CourseRecord.fromSnapshot(s));

  static Future<CourseRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CourseRecord.fromSnapshot(s));

  static CourseRecord fromSnapshot(DocumentSnapshot snapshot) => CourseRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CourseRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CourseRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CourseRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CourseRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCourseRecordData({
  String? name,
  VideoStruct? previewVideo,
  String? mainImage,
  RatingStruct? rating,
  CourseDescriptionStruct? description,
  String? previewVimeoVideoUrl,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'preview_video': VideoStruct().toMap(),
      'main_image': mainImage,
      'rating': RatingStruct().toMap(),
      'description': CourseDescriptionStruct().toMap(),
      'preview_vimeo_video_url': previewVimeoVideoUrl,
    }.withoutNulls,
  );

  // Handle nested data for "preview_video" field.
  addVideoStructData(firestoreData, previewVideo, 'preview_video');

  // Handle nested data for "rating" field.
  addRatingStructData(firestoreData, rating, 'rating');

  // Handle nested data for "description" field.
  addCourseDescriptionStructData(firestoreData, description, 'description');

  return firestoreData;
}

class CourseRecordDocumentEquality implements Equality<CourseRecord> {
  const CourseRecordDocumentEquality();

  @override
  bool equals(CourseRecord? e1, CourseRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.previewVideo == e2?.previewVideo &&
        e1?.mainImage == e2?.mainImage &&
        e1?.rating == e2?.rating &&
        e1?.description == e2?.description &&
        listEquality.equals(e1?.faq, e2?.faq) &&
        e1?.previewVimeoVideoUrl == e2?.previewVimeoVideoUrl;
  }

  @override
  int hash(CourseRecord? e) => const ListEquality().hash([
        e?.name,
        e?.previewVideo,
        e?.mainImage,
        e?.rating,
        e?.description,
        e?.faq,
        e?.previewVimeoVideoUrl
      ]);

  @override
  bool isValidKey(Object? o) => o is CourseRecord;
}
