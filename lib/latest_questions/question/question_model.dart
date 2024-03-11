import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/latest_questions/question_comments_bottom_sheet/question_comments_bottom_sheet_widget.dart';
import 'question_widget.dart' show QuestionWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

class QuestionModel extends FlutterFlowModel<QuestionWidget> {
  ///  Local state fields for this page.

  bool isFavorite = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for QuestionCommentsBottomSheet component.
  late QuestionCommentsBottomSheetModel questionCommentsBottomSheetModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    questionCommentsBottomSheetModel =
        createModel(context, () => QuestionCommentsBottomSheetModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    questionCommentsBottomSheetModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
