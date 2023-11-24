import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "ref_user" field.
  DocumentReference? _refUser;
  DocumentReference? get refUser => _refUser;
  bool hasRefUser() => _refUser != null;

  // "ref_code" field.
  String? _refCode;
  String get refCode => _refCode ?? '';
  bool hasRefCode() => _refCode != null;

  // "is_email_page_viewed" field.
  bool? _isEmailPageViewed;
  bool get isEmailPageViewed => _isEmailPageViewed ?? false;
  bool hasIsEmailPageViewed() => _isEmailPageViewed != null;

  // "karma" field.
  double? _karma;
  double get karma => _karma ?? 0.0;
  bool hasKarma() => _karma != null;

  // "linkedin_link" field.
  String? _linkedinLink;
  String get linkedinLink => _linkedinLink ?? '';
  bool hasLinkedinLink() => _linkedinLink != null;

  // "first_name" field.
  String? _firstName;
  String get firstName => _firstName ?? '';
  bool hasFirstName() => _firstName != null;

  // "last_name" field.
  String? _lastName;
  String get lastName => _lastName ?? '';
  bool hasLastName() => _lastName != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "group" field.
  DocumentReference? _group;
  DocumentReference? get group => _group;
  bool hasGroup() => _group != null;

  // "career_profile" field.
  CareerProfileStruct? _careerProfile;
  CareerProfileStruct get careerProfile =>
      _careerProfile ?? CareerProfileStruct();
  bool hasCareerProfile() => _careerProfile != null;

  // "rank" field.
  int? _rank;
  int get rank => _rank ?? 0;
  bool hasRank() => _rank != null;

  // "favorite_videos" field.
  List<DocumentReference>? _favoriteVideos;
  List<DocumentReference> get favoriteVideos => _favoriteVideos ?? const [];
  bool hasFavoriteVideos() => _favoriteVideos != null;

  // "is_profile_completed" field.
  bool? _isProfileCompleted;
  bool get isProfileCompleted => _isProfileCompleted ?? false;
  bool hasIsProfileCompleted() => _isProfileCompleted != null;

  // "course_progress" field.
  CourseProgressStruct? _courseProgress;
  CourseProgressStruct get courseProgress =>
      _courseProgress ?? CourseProgressStruct();
  bool hasCourseProgress() => _courseProgress != null;

  // "liked_questions" field.
  List<DocumentReference>? _likedQuestions;
  List<DocumentReference> get likedQuestions => _likedQuestions ?? const [];
  bool hasLikedQuestions() => _likedQuestions != null;

  // "liked_users" field.
  List<DocumentReference>? _likedUsers;
  List<DocumentReference> get likedUsers => _likedUsers ?? const [];
  bool hasLikedUsers() => _likedUsers != null;

  // "disliked_users" field.
  List<DocumentReference>? _dislikedUsers;
  List<DocumentReference> get dislikedUsers => _dislikedUsers ?? const [];
  bool hasDislikedUsers() => _dislikedUsers != null;

  // "liked_by" field.
  List<DocumentReference>? _likedBy;
  List<DocumentReference> get likedBy => _likedBy ?? const [];
  bool hasLikedBy() => _likedBy != null;

  // "disliked_by" field.
  List<DocumentReference>? _dislikedBy;
  List<DocumentReference> get dislikedBy => _dislikedBy ?? const [];
  bool hasDislikedBy() => _dislikedBy != null;

  // "favorite_questions" field.
  List<DocumentReference>? _favoriteQuestions;
  List<DocumentReference> get favoriteQuestions =>
      _favoriteQuestions ?? const [];
  bool hasFavoriteQuestions() => _favoriteQuestions != null;

  // "endorsement" field.
  int? _endorsement;
  int get endorsement => _endorsement ?? 0;
  bool hasEndorsement() => _endorsement != null;

  // "interview_sessions" field.
  int? _interviewSessions;
  int get interviewSessions => _interviewSessions ?? 0;
  bool hasInterviewSessions() => _interviewSessions != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _refUser = snapshotData['ref_user'] as DocumentReference?;
    _refCode = snapshotData['ref_code'] as String?;
    _isEmailPageViewed = snapshotData['is_email_page_viewed'] as bool?;
    _karma = castToType<double>(snapshotData['karma']);
    _linkedinLink = snapshotData['linkedin_link'] as String?;
    _firstName = snapshotData['first_name'] as String?;
    _lastName = snapshotData['last_name'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _group = snapshotData['group'] as DocumentReference?;
    _careerProfile =
        CareerProfileStruct.maybeFromMap(snapshotData['career_profile']);
    _rank = castToType<int>(snapshotData['rank']);
    _favoriteVideos = getDataList(snapshotData['favorite_videos']);
    _isProfileCompleted = snapshotData['is_profile_completed'] as bool?;
    _courseProgress =
        CourseProgressStruct.maybeFromMap(snapshotData['course_progress']);
    _likedQuestions = getDataList(snapshotData['liked_questions']);
    _likedUsers = getDataList(snapshotData['liked_users']);
    _dislikedUsers = getDataList(snapshotData['disliked_users']);
    _likedBy = getDataList(snapshotData['liked_by']);
    _dislikedBy = getDataList(snapshotData['disliked_by']);
    _favoriteQuestions = getDataList(snapshotData['favorite_questions']);
    _endorsement = castToType<int>(snapshotData['endorsement']);
    _interviewSessions = castToType<int>(snapshotData['interview_sessions']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  DocumentReference? refUser,
  String? refCode,
  bool? isEmailPageViewed,
  double? karma,
  String? linkedinLink,
  String? firstName,
  String? lastName,
  String? displayName,
  DocumentReference? group,
  CareerProfileStruct? careerProfile,
  int? rank,
  bool? isProfileCompleted,
  CourseProgressStruct? courseProgress,
  int? endorsement,
  int? interviewSessions,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'ref_user': refUser,
      'ref_code': refCode,
      'is_email_page_viewed': isEmailPageViewed,
      'karma': karma,
      'linkedin_link': linkedinLink,
      'first_name': firstName,
      'last_name': lastName,
      'display_name': displayName,
      'group': group,
      'career_profile': CareerProfileStruct().toMap(),
      'rank': rank,
      'is_profile_completed': isProfileCompleted,
      'course_progress': CourseProgressStruct().toMap(),
      'endorsement': endorsement,
      'interview_sessions': interviewSessions,
    }.withoutNulls,
  );

  // Handle nested data for "career_profile" field.
  addCareerProfileStructData(firestoreData, careerProfile, 'career_profile');

  // Handle nested data for "course_progress" field.
  addCourseProgressStructData(firestoreData, courseProgress, 'course_progress');

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.refUser == e2?.refUser &&
        e1?.refCode == e2?.refCode &&
        e1?.isEmailPageViewed == e2?.isEmailPageViewed &&
        e1?.karma == e2?.karma &&
        e1?.linkedinLink == e2?.linkedinLink &&
        e1?.firstName == e2?.firstName &&
        e1?.lastName == e2?.lastName &&
        e1?.displayName == e2?.displayName &&
        e1?.group == e2?.group &&
        e1?.careerProfile == e2?.careerProfile &&
        e1?.rank == e2?.rank &&
        listEquality.equals(e1?.favoriteVideos, e2?.favoriteVideos) &&
        e1?.isProfileCompleted == e2?.isProfileCompleted &&
        e1?.courseProgress == e2?.courseProgress &&
        listEquality.equals(e1?.likedQuestions, e2?.likedQuestions) &&
        listEquality.equals(e1?.likedUsers, e2?.likedUsers) &&
        listEquality.equals(e1?.dislikedUsers, e2?.dislikedUsers) &&
        listEquality.equals(e1?.likedBy, e2?.likedBy) &&
        listEquality.equals(e1?.dislikedBy, e2?.dislikedBy) &&
        listEquality.equals(e1?.favoriteQuestions, e2?.favoriteQuestions) &&
        e1?.endorsement == e2?.endorsement &&
        e1?.interviewSessions == e2?.interviewSessions;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.refUser,
        e?.refCode,
        e?.isEmailPageViewed,
        e?.karma,
        e?.linkedinLink,
        e?.firstName,
        e?.lastName,
        e?.displayName,
        e?.group,
        e?.careerProfile,
        e?.rank,
        e?.favoriteVideos,
        e?.isProfileCompleted,
        e?.courseProgress,
        e?.likedQuestions,
        e?.likedUsers,
        e?.dislikedUsers,
        e?.likedBy,
        e?.dislikedBy,
        e?.favoriteQuestions,
        e?.endorsement,
        e?.interviewSessions
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
