import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/feedback_pick_element_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'interview_feedback_widget.dart' show InterviewFeedbackWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class InterviewFeedbackModel extends FlutterFlowModel<InterviewFeedbackWidget> {
  ///  Local state fields for this page.

  bool? satisfactionInterview;

  String? partner = '';

  bool? structure;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for feedbackPickElement component.
  late FeedbackPickElementModel feedbackPickElementModel1;
  // Model for feedbackPickElement component.
  late FeedbackPickElementModel feedbackPickElementModel2;
  // Model for feedbackPickElement component.
  late FeedbackPickElementModel feedbackPickElementModel3;
  // Model for feedbackPickElement component.
  late FeedbackPickElementModel feedbackPickElementModel4;
  // Model for feedbackPickElement component.
  late FeedbackPickElementModel feedbackPickElementModel5;
  // Model for feedbackPickElement component.
  late FeedbackPickElementModel feedbackPickElementModel6;
  // Model for feedbackPickElement component.
  late FeedbackPickElementModel feedbackPickElementModel7;
  // Model for feedbackPickElement component.
  late FeedbackPickElementModel feedbackPickElementModel8;
  // Model for feedbackPickElement component.
  late FeedbackPickElementModel feedbackPickElementModel9;
  // Model for feedbackPickElement component.
  late FeedbackPickElementModel feedbackPickElementModel10;
  // State field(s) for improveUserField widget.
  FocusNode? improveUserFieldFocusNode;
  TextEditingController? improveUserFieldController;
  String? Function(BuildContext, String?)? improveUserFieldControllerValidator;
  // State field(s) for scaleField widget.
  FocusNode? scaleFieldFocusNode;
  TextEditingController? scaleFieldController;
  String? Function(BuildContext, String?)? scaleFieldControllerValidator;
  // State field(s) for improvequisField widget.
  FocusNode? improvequisFieldFocusNode;
  TextEditingController? improvequisFieldController;
  String? Function(BuildContext, String?)? improvequisFieldControllerValidator;
  // State field(s) for appFeedbackField widget.
  FocusNode? appFeedbackFieldFocusNode;
  TextEditingController? appFeedbackFieldController;
  String? Function(BuildContext, String?)? appFeedbackFieldControllerValidator;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  UsersRecord? userOutput;
  // Stores action output result for [Backend Call - API (Send an email)] action in Button widget.
  ApiCallResponse? apiResult3fr;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    feedbackPickElementModel1 =
        createModel(context, () => FeedbackPickElementModel());
    feedbackPickElementModel2 =
        createModel(context, () => FeedbackPickElementModel());
    feedbackPickElementModel3 =
        createModel(context, () => FeedbackPickElementModel());
    feedbackPickElementModel4 =
        createModel(context, () => FeedbackPickElementModel());
    feedbackPickElementModel5 =
        createModel(context, () => FeedbackPickElementModel());
    feedbackPickElementModel6 =
        createModel(context, () => FeedbackPickElementModel());
    feedbackPickElementModel7 =
        createModel(context, () => FeedbackPickElementModel());
    feedbackPickElementModel8 =
        createModel(context, () => FeedbackPickElementModel());
    feedbackPickElementModel9 =
        createModel(context, () => FeedbackPickElementModel());
    feedbackPickElementModel10 =
        createModel(context, () => FeedbackPickElementModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    feedbackPickElementModel1.dispose();
    feedbackPickElementModel2.dispose();
    feedbackPickElementModel3.dispose();
    feedbackPickElementModel4.dispose();
    feedbackPickElementModel5.dispose();
    feedbackPickElementModel6.dispose();
    feedbackPickElementModel7.dispose();
    feedbackPickElementModel8.dispose();
    feedbackPickElementModel9.dispose();
    feedbackPickElementModel10.dispose();
    improveUserFieldFocusNode?.dispose();
    improveUserFieldController?.dispose();

    scaleFieldFocusNode?.dispose();
    scaleFieldController?.dispose();

    improvequisFieldFocusNode?.dispose();
    improvequisFieldController?.dispose();

    appFeedbackFieldFocusNode?.dispose();
    appFeedbackFieldController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
