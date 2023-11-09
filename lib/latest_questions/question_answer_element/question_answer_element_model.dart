import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'question_answer_element_widget.dart' show QuestionAnswerElementWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class QuestionAnswerElementModel
    extends FlutterFlowModel<QuestionAnswerElementWidget> {
  ///  Local state fields for this component.

  String questionState = '';

  String answerState = '';

  ///  State fields for stateful widgets in this component.

  // State field(s) for QuestionField widget.
  FocusNode? questionFieldFocusNode;
  TextEditingController? questionFieldController;
  String? Function(BuildContext, String?)? questionFieldControllerValidator;
  // State field(s) for AnswerField widget.
  FocusNode? answerFieldFocusNode;
  TextEditingController? answerFieldController;
  String? Function(BuildContext, String?)? answerFieldControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    questionFieldFocusNode?.dispose();
    questionFieldController?.dispose();

    answerFieldFocusNode?.dispose();
    answerFieldController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
