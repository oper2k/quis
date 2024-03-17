import '/flutter_flow/flutter_flow_util.dart';
import '/latest_questions/question_comments_bottom_sheet/question_comments_bottom_sheet_widget.dart';
import 'question_widget.dart' show QuestionWidget;
import 'package:flutter/material.dart';

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
