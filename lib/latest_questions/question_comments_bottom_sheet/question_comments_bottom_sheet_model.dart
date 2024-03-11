import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/components/avatar_widget.dart';
import '/components/karma_plus_dialog_widget.dart';
import '/components/message_element_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'question_comments_bottom_sheet_widget.dart'
    show QuestionCommentsBottomSheetWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class QuestionCommentsBottomSheetModel
    extends FlutterFlowModel<QuestionCommentsBottomSheetWidget> {
  ///  State fields for stateful widgets in this component.

  // Models for messageElement dynamic component.
  late FlutterFlowDynamicModels<MessageElementModel> messageElementModels;
  // Model for avatar component.
  late AvatarModel avatarModel2;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    messageElementModels =
        FlutterFlowDynamicModels(() => MessageElementModel());
    avatarModel2 = createModel(context, () => AvatarModel());
  }

  @override
  void dispose() {
    messageElementModels.dispose();
    avatarModel2.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
