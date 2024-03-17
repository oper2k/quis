import '/backend/backend.dart';
import '/components/like_profile_avatar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'liq_widget.dart' show LiqWidget;
import 'package:flutter/material.dart';

class LiqModel extends FlutterFlowModel<LiqWidget> {
  ///  Local state fields for this page.

  bool? isLike;

  bool checker = true;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  UsersRecord? userRefItemPreviousSnapshot;
  // Model for likeProfileAvatar component.
  late LikeProfileAvatarModel likeProfileAvatarModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    likeProfileAvatarModel =
        createModel(context, () => LikeProfileAvatarModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    likeProfileAvatarModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
