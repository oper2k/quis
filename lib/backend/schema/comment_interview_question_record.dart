import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class CommentInterviewQuestionRecord extends FirestoreRecord {
  CommentInterviewQuestionRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  bool hasText() => _text != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "like_dislike" field.
  List<LikeDislikeStruct>? _likeDislike;
  List<LikeDislikeStruct> get likeDislike => _likeDislike ?? const [];
  bool hasLikeDislike() => _likeDislike != null;

  // "ref_question" field.
  DocumentReference? _refQuestion;
  DocumentReference? get refQuestion => _refQuestion;
  bool hasRefQuestion() => _refQuestion != null;

  void _initializeFields() {
    _user = snapshotData['user'] as DocumentReference?;
    _text = snapshotData['text'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _likeDislike = getStructList(
      snapshotData['like_dislike'],
      LikeDislikeStruct.fromMap,
    );
    _refQuestion = snapshotData['ref_question'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('comment_interview_question');

  static Stream<CommentInterviewQuestionRecord> getDocument(
          DocumentReference ref) =>
      ref
          .snapshots()
          .map((s) => CommentInterviewQuestionRecord.fromSnapshot(s));

  static Future<CommentInterviewQuestionRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => CommentInterviewQuestionRecord.fromSnapshot(s));

  static CommentInterviewQuestionRecord fromSnapshot(
          DocumentSnapshot snapshot) =>
      CommentInterviewQuestionRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CommentInterviewQuestionRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CommentInterviewQuestionRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CommentInterviewQuestionRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CommentInterviewQuestionRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCommentInterviewQuestionRecordData({
  DocumentReference? user,
  String? text,
  DateTime? createdTime,
  DocumentReference? refQuestion,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user': user,
      'text': text,
      'created_time': createdTime,
      'ref_question': refQuestion,
    }.withoutNulls,
  );

  return firestoreData;
}

class CommentInterviewQuestionRecordDocumentEquality
    implements Equality<CommentInterviewQuestionRecord> {
  const CommentInterviewQuestionRecordDocumentEquality();

  @override
  bool equals(
      CommentInterviewQuestionRecord? e1, CommentInterviewQuestionRecord? e2) {
    const listEquality = ListEquality();
    return e1?.user == e2?.user &&
        e1?.text == e2?.text &&
        e1?.createdTime == e2?.createdTime &&
        listEquality.equals(e1?.likeDislike, e2?.likeDislike) &&
        e1?.refQuestion == e2?.refQuestion;
  }

  @override
  int hash(CommentInterviewQuestionRecord? e) => const ListEquality()
      .hash([e?.user, e?.text, e?.createdTime, e?.likeDislike, e?.refQuestion]);

  @override
  bool isValidKey(Object? o) => o is CommentInterviewQuestionRecord;
}
