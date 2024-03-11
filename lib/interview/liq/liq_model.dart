import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/like_profile_avatar_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/interview/match_dialog/match_dialog_widget.dart';
import 'liq_widget.dart' show LiqWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

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
