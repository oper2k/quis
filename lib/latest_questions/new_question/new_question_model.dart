import '/backend/backend.dart';
import '/components/pseudo_drop_down_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/latest_questions/calendar_element/calendar_element_widget.dart';
import '/latest_questions/question_answer_element/question_answer_element_widget.dart';
import 'new_question_widget.dart' show NewQuestionWidget;
import 'package:flutter/material.dart';

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

  DocumentReference? roleRef;

  bool isRoleValidated = true;

  String? pickedStage = '';

  String? pickedRound = '';

  bool isStageValid = true;

  bool isRoundValid = true;

  bool isDateValid = true;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for CompanyField widget.
  FocusNode? companyFieldFocusNode;
  TextEditingController? companyFieldController;
  String? Function(BuildContext, String?)? companyFieldControllerValidator;
  String? _companyFieldControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // Stores action output result for [Bottom Sheet - pickBottomSheet] action in Container widget.
  String? roleOutput;
  // Model for pseudoDropDown component.
  late PseudoDropDownModel pseudoDropDownModel1;
  // Stores action output result for [Bottom Sheet - pickBottomSheet] action in Container widget.
  String? stageOutput;
  // Model for pseudoDropDown component.
  late PseudoDropDownModel pseudoDropDownModel2;
  // Stores action output result for [Bottom Sheet - pickBottomSheet] action in Container widget.
  String? roundOutput;
  // Model for pseudoDropDown component.
  late PseudoDropDownModel pseudoDropDownModel3;
  // Models for questionAnswerElement dynamic component.
  late FlutterFlowDynamicModels<QuestionAnswerElementModel>
      questionAnswerElementModels;
  // Models for calendarElement dynamic component.
  late FlutterFlowDynamicModels<CalendarElementModel> calendarElementModels;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    companyFieldControllerValidator = _companyFieldControllerValidator;
    pseudoDropDownModel1 = createModel(context, () => PseudoDropDownModel());
    pseudoDropDownModel2 = createModel(context, () => PseudoDropDownModel());
    pseudoDropDownModel3 = createModel(context, () => PseudoDropDownModel());
    questionAnswerElementModels =
        FlutterFlowDynamicModels(() => QuestionAnswerElementModel());
    calendarElementModels =
        FlutterFlowDynamicModels(() => CalendarElementModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    companyFieldFocusNode?.dispose();
    companyFieldController?.dispose();

    pseudoDropDownModel1.dispose();
    pseudoDropDownModel2.dispose();
    pseudoDropDownModel3.dispose();
    questionAnswerElementModels.dispose();
    calendarElementModels.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
