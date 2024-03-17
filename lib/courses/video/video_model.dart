import '/backend/backend.dart';
import '/components/avatar_widget.dart';
import '/components/back_button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'video_widget.dart' show VideoWidget;
import 'package:flutter/material.dart';

class VideoModel extends FlutterFlowModel<VideoWidget> {
  ///  Local state fields for this page.

  bool isFavorite = false;

  bool? isLiked;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in Video widget.
  List<CourseVideoRecord>? courseVideosQuery;
  // Model for BackButton component.
  late BackButtonModel backButtonModel;
  // Model for avatar component.
  late AvatarModel avatarModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    backButtonModel = createModel(context, () => BackButtonModel());
    avatarModel = createModel(context, () => AvatarModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    backButtonModel.dispose();
    avatarModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
