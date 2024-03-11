import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CourseVideoRecord extends FirestoreRecord {
  CourseVideoRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "course" field.
  DocumentReference? _course;
  DocumentReference? get course => _course;
  bool hasCourse() => _course != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "rating" field.
  RatingStruct? _rating;
  RatingStruct get rating => _rating ?? RatingStruct();
  bool hasRating() => _rating != null;

  // "sort" field.
  int? _sort;
  int get sort => _sort ?? 0;
  bool hasSort() => _sort != null;

  // "text_guides" field.
  List<VideoTextGuideStruct>? _textGuides;
  List<VideoTextGuideStruct> get textGuides => _textGuides ?? const [];
  bool hasTextGuides() => _textGuides != null;

  // "like_dislike" field.
  List<LikeDislikeStruct>? _likeDislike;
  List<LikeDislikeStruct> get likeDislike => _likeDislike ?? const [];
  bool hasLikeDislike() => _likeDislike != null;

  // "views" field.
  int? _views;
  int get views => _views ?? 0;
  bool hasViews() => _views != null;

  // "image_path" field.
  String? _imagePath;
  String get imagePath => _imagePath ?? '';
  bool hasImagePath() => _imagePath != null;

  // "is_expert_video_of_day" field.
  bool? _isExpertVideoOfDay;
  bool get isExpertVideoOfDay => _isExpertVideoOfDay ?? false;
  bool hasIsExpertVideoOfDay() => _isExpertVideoOfDay != null;

  // "vimeo_video_url" field.
  String? _vimeoVideoUrl;
  String get vimeoVideoUrl => _vimeoVideoUrl ?? '';
  bool hasVimeoVideoUrl() => _vimeoVideoUrl != null;

  // "image_for_video_of_day" field.
  String? _imageForVideoOfDay;
  String get imageForVideoOfDay => _imageForVideoOfDay ?? '';
  bool hasImageForVideoOfDay() => _imageForVideoOfDay != null;

  // "course_title" field.
  String? _courseTitle;
  String get courseTitle => _courseTitle ?? '';
  bool hasCourseTitle() => _courseTitle != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _type = snapshotData['type'] as String?;
    _course = snapshotData['course'] as DocumentReference?;
    _description = snapshotData['description'] as String?;
    _rating = RatingStruct.maybeFromMap(snapshotData['rating']);
    _sort = castToType<int>(snapshotData['sort']);
    _textGuides = getStructList(
      snapshotData['text_guides'],
      VideoTextGuideStruct.fromMap,
    );
    _likeDislike = getStructList(
      snapshotData['like_dislike'],
      LikeDislikeStruct.fromMap,
    );
    _views = castToType<int>(snapshotData['views']);
    _imagePath = snapshotData['image_path'] as String?;
    _isExpertVideoOfDay = snapshotData['is_expert_video_of_day'] as bool?;
    _vimeoVideoUrl = snapshotData['vimeo_video_url'] as String?;
    _imageForVideoOfDay = snapshotData['image_for_video_of_day'] as String?;
    _courseTitle = snapshotData['course_title'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('course_video');

  static Stream<CourseVideoRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CourseVideoRecord.fromSnapshot(s));

  static Future<CourseVideoRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CourseVideoRecord.fromSnapshot(s));

  static CourseVideoRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CourseVideoRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CourseVideoRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CourseVideoRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CourseVideoRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CourseVideoRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCourseVideoRecordData({
  String? name,
  String? type,
  DocumentReference? course,
  String? description,
  RatingStruct? rating,
  int? sort,
  int? views,
  String? imagePath,
  bool? isExpertVideoOfDay,
  String? vimeoVideoUrl,
  String? imageForVideoOfDay,
  String? courseTitle,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'type': type,
      'course': course,
      'description': description,
      'rating': RatingStruct().toMap(),
      'sort': sort,
      'views': views,
      'image_path': imagePath,
      'is_expert_video_of_day': isExpertVideoOfDay,
      'vimeo_video_url': vimeoVideoUrl,
      'image_for_video_of_day': imageForVideoOfDay,
      'course_title': courseTitle,
    }.withoutNulls,
  );

  // Handle nested data for "rating" field.
  addRatingStructData(firestoreData, rating, 'rating');

  return firestoreData;
}

class CourseVideoRecordDocumentEquality implements Equality<CourseVideoRecord> {
  const CourseVideoRecordDocumentEquality();

  @override
  bool equals(CourseVideoRecord? e1, CourseVideoRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.type == e2?.type &&
        e1?.course == e2?.course &&
        e1?.description == e2?.description &&
        e1?.rating == e2?.rating &&
        e1?.sort == e2?.sort &&
        listEquality.equals(e1?.textGuides, e2?.textGuides) &&
        listEquality.equals(e1?.likeDislike, e2?.likeDislike) &&
        e1?.views == e2?.views &&
        e1?.imagePath == e2?.imagePath &&
        e1?.isExpertVideoOfDay == e2?.isExpertVideoOfDay &&
        e1?.vimeoVideoUrl == e2?.vimeoVideoUrl &&
        e1?.imageForVideoOfDay == e2?.imageForVideoOfDay &&
        e1?.courseTitle == e2?.courseTitle;
  }

  @override
  int hash(CourseVideoRecord? e) => const ListEquality().hash([
        e?.name,
        e?.type,
        e?.course,
        e?.description,
        e?.rating,
        e?.sort,
        e?.textGuides,
        e?.likeDislike,
        e?.views,
        e?.imagePath,
        e?.isExpertVideoOfDay,
        e?.vimeoVideoUrl,
        e?.imageForVideoOfDay,
        e?.courseTitle
      ]);

  @override
  bool isValidKey(Object? o) => o is CourseVideoRecord;
}
