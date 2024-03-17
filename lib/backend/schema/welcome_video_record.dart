import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class WelcomeVideoRecord extends FirestoreRecord {
  WelcomeVideoRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "announcements_title" field.
  String? _announcementsTitle;
  String get announcementsTitle => _announcementsTitle ?? '';
  bool hasAnnouncementsTitle() => _announcementsTitle != null;

  // "announcements_text" field.
  String? _announcementsText;
  String get announcementsText => _announcementsText ?? '';
  bool hasAnnouncementsText() => _announcementsText != null;

  // "vimeo_video" field.
  VimeoVideoStruct? _vimeoVideo;
  VimeoVideoStruct get vimeoVideo => _vimeoVideo ?? VimeoVideoStruct();
  bool hasVimeoVideo() => _vimeoVideo != null;

  void _initializeFields() {
    _announcementsTitle = snapshotData['announcements_title'] as String?;
    _announcementsText = snapshotData['announcements_text'] as String?;
    _vimeoVideo = VimeoVideoStruct.maybeFromMap(snapshotData['vimeo_video']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('welcome_video');

  static Stream<WelcomeVideoRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => WelcomeVideoRecord.fromSnapshot(s));

  static Future<WelcomeVideoRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => WelcomeVideoRecord.fromSnapshot(s));

  static WelcomeVideoRecord fromSnapshot(DocumentSnapshot snapshot) =>
      WelcomeVideoRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static WelcomeVideoRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      WelcomeVideoRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'WelcomeVideoRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is WelcomeVideoRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createWelcomeVideoRecordData({
  String? announcementsTitle,
  String? announcementsText,
  VimeoVideoStruct? vimeoVideo,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'announcements_title': announcementsTitle,
      'announcements_text': announcementsText,
      'vimeo_video': VimeoVideoStruct().toMap(),
    }.withoutNulls,
  );

  // Handle nested data for "vimeo_video" field.
  addVimeoVideoStructData(firestoreData, vimeoVideo, 'vimeo_video');

  return firestoreData;
}

class WelcomeVideoRecordDocumentEquality
    implements Equality<WelcomeVideoRecord> {
  const WelcomeVideoRecordDocumentEquality();

  @override
  bool equals(WelcomeVideoRecord? e1, WelcomeVideoRecord? e2) {
    return e1?.announcementsTitle == e2?.announcementsTitle &&
        e1?.announcementsText == e2?.announcementsText &&
        e1?.vimeoVideo == e2?.vimeoVideo;
  }

  @override
  int hash(WelcomeVideoRecord? e) => const ListEquality()
      .hash([e?.announcementsTitle, e?.announcementsText, e?.vimeoVideo]);

  @override
  bool isValidKey(Object? o) => o is WelcomeVideoRecord;
}
