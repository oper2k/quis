import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CommentRecord extends FirestoreRecord {
  CommentRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
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

  // "ref_video" field.
  DocumentReference? _refVideo;
  DocumentReference? get refVideo => _refVideo;
  bool hasRefVideo() => _refVideo != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "like_dislike" field.
  List<LikeDislikeStruct>? _likeDislike;
  List<LikeDislikeStruct> get likeDislike => _likeDislike ?? const [];
  bool hasLikeDislike() => _likeDislike != null;

  void _initializeFields() {
    _user = snapshotData['user'] as DocumentReference?;
    _text = snapshotData['text'] as String?;
    _refVideo = snapshotData['ref_video'] as DocumentReference?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _likeDislike = getStructList(
      snapshotData['like_dislike'],
      LikeDislikeStruct.fromMap,
    );
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('comment');

  static Stream<CommentRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CommentRecord.fromSnapshot(s));

  static Future<CommentRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CommentRecord.fromSnapshot(s));

  static CommentRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CommentRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CommentRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CommentRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CommentRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CommentRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCommentRecordData({
  DocumentReference? user,
  String? text,
  DocumentReference? refVideo,
  DateTime? createdTime,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user': user,
      'text': text,
      'ref_video': refVideo,
      'created_time': createdTime,
    }.withoutNulls,
  );

  return firestoreData;
}

class CommentRecordDocumentEquality implements Equality<CommentRecord> {
  const CommentRecordDocumentEquality();

  @override
  bool equals(CommentRecord? e1, CommentRecord? e2) {
    const listEquality = ListEquality();
    return e1?.user == e2?.user &&
        e1?.text == e2?.text &&
        e1?.refVideo == e2?.refVideo &&
        e1?.createdTime == e2?.createdTime &&
        listEquality.equals(e1?.likeDislike, e2?.likeDislike);
  }

  @override
  int hash(CommentRecord? e) => const ListEquality()
      .hash([e?.user, e?.text, e?.refVideo, e?.createdTime, e?.likeDislike]);

  @override
  bool isValidKey(Object? o) => o is CommentRecord;
}
