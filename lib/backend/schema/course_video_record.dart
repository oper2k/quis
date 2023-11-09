import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

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

  // "video" field.
  VideoStruct? _video;
  VideoStruct get video => _video ?? VideoStruct();
  bool hasVideo() => _video != null;

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

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _video = VideoStruct.maybeFromMap(snapshotData['video']);
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
  VideoStruct? video,
  String? type,
  DocumentReference? course,
  String? description,
  RatingStruct? rating,
  int? sort,
  int? views,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'video': VideoStruct().toMap(),
      'type': type,
      'course': course,
      'description': description,
      'rating': RatingStruct().toMap(),
      'sort': sort,
      'views': views,
    }.withoutNulls,
  );

  // Handle nested data for "video" field.
  addVideoStructData(firestoreData, video, 'video');

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
        e1?.video == e2?.video &&
        e1?.type == e2?.type &&
        e1?.course == e2?.course &&
        e1?.description == e2?.description &&
        e1?.rating == e2?.rating &&
        e1?.sort == e2?.sort &&
        listEquality.equals(e1?.textGuides, e2?.textGuides) &&
        listEquality.equals(e1?.likeDislike, e2?.likeDislike) &&
        e1?.views == e2?.views;
  }

  @override
  int hash(CourseVideoRecord? e) => const ListEquality().hash([
        e?.name,
        e?.video,
        e?.type,
        e?.course,
        e?.description,
        e?.rating,
        e?.sort,
        e?.textGuides,
        e?.likeDislike,
        e?.views
      ]);

  @override
  bool isValidKey(Object? o) => o is CourseVideoRecord;
}
