import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/latest_questions/calendar_element/calendar_element_widget.dart';
import '/latest_questions/question_answer_element/question_answer_element_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'new_question_widget.dart' show NewQuestionWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class NewQuestionModel extends FlutterFlowModel<NewQuestionWidget> {
  ///  Local state fields for this page.

  List<QuestionAnswerStruct> questionAnswerList = [];
  void addToQuestionAnswerList(QuestionAnswerStruct item) =>
      questionAnswerList.add(item);
  void removeFromQuestionAnswerList(QuestionAnswerStruct item) =>
      questionAnswerList.remove(item);
  void removeAtIndexFromQuestionAnswerList(int index) =>
      questionAnswerList.removeAt(index);
  void insertAtIndexInQuestionAnswerList(
          int index, QuestionAnswerStruct item) =>
      questionAnswerList.insert(index, item);
  void updateQuestionAnswerListAtIndex(
          int index, Function(QuestionAnswerStruct) updateFn) =>
      questionAnswerList[index] = updateFn(questionAnswerList[index]);

  DateTime? pickedMonth;

  DateTime? pickedDate;

  DateTime? currentMonth;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for CompanyField widget.
  FocusNode? companyFieldFocusNode;
  TextEditingController? companyFieldController;
  String? Function(BuildContext, String?)? companyFieldControllerValidator;
  // State field(s) for RoleDropDown widget.
  String? roleDropDownValue;
  FormFieldController<String>? roleDropDownValueController;
  // State field(s) for StageDropDown widget.
  String? stageDropDownValue;
  FormFieldController<String>? stageDropDownValueController;
  // State field(s) for passDropDown widget.
  String? passDropDownValue;
  FormFieldController<String>? passDropDownValueController;
  // Models for questionAnswerElement dynamic component.
  late FlutterFlowDynamicModels<QuestionAnswerElementModel>
      questionAnswerElementModels;
  // Models for calendarElement dynamic component.
  late FlutterFlowDynamicModels<CalendarElementModel> calendarElementModels;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    questionAnswerElementModels =
        FlutterFlowDynamicModels(() => QuestionAnswerElementModel());
    calendarElementModels =
        FlutterFlowDynamicModels(() => CalendarElementModel());
  }

  void dispose() {
    unfocusNode.dispose();
    companyFieldFocusNode?.dispose();
    companyFieldController?.dispose();

    questionAnswerElementModels.dispose();
    calendarElementModels.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
