import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/pick_bottom_sheet_widget.dart';
import '/components/pseudo_drop_down_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/home/deducted_karma/deducted_karma_widget.dart';
import 'mock_interview_widget.dart' show MockInterviewWidget;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class MockInterviewModel extends FlutterFlowModel<MockInterviewWidget> {
  ///  Local state fields for this page.

  ServiceStruct? activeService;
  void updateActiveServiceStruct(Function(ServiceStruct) updateFn) =>
      updateFn(activeService ??= ServiceStruct());

  int quantity = 1;

  bool isServicePicked = true;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Bottom Sheet - pickBottomSheet] action in Container widget.
  String? serviceOutput;
  // Model for pseudoDropDown component.
  late PseudoDropDownModel pseudoDropDownModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  String? _textController1Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  String? _textController2Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for Expandable widget.
  late ExpandableController expandableController1;

  // State field(s) for Expandable widget.
  late ExpandableController expandableController2;

  // State field(s) for Expandable widget.
  late ExpandableController expandableController3;

  // State field(s) for Expandable widget.
  late ExpandableController expandableController4;

  // State field(s) for Expandable widget.
  late ExpandableController expandableController5;

  // State field(s) for Expandable widget.
  late ExpandableController expandableController6;

  // State field(s) for Expandable widget.
  late ExpandableController expandableController7;

  // State field(s) for Expandable widget.
  late ExpandableController expandableController8;

  // State field(s) for Expandable widget.
  late ExpandableController expandableController9;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    pseudoDropDownModel = createModel(context, () => PseudoDropDownModel());
    textController1Validator = _textController1Validator;
    textController2Validator = _textController2Validator;
  }

  void dispose() {
    unfocusNode.dispose();
    pseudoDropDownModel.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    expandableController1.dispose();
    expandableController2.dispose();
    expandableController3.dispose();
    expandableController4.dispose();
    expandableController5.dispose();
    expandableController6.dispose();
    expandableController7.dispose();
    expandableController8.dispose();
    expandableController9.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
