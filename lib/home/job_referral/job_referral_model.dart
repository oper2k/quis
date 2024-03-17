import '/backend/backend.dart';
import '/components/pseudo_drop_down_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'job_referral_widget.dart' show JobReferralWidget;
import 'package:flutter/material.dart';

class JobReferralModel extends FlutterFlowModel<JobReferralWidget> {
  ///  Local state fields for this page.

  ServiceStruct? activeService;
  void updateActiveServiceStruct(Function(ServiceStruct) updateFn) =>
      updateFn(activeService ??= ServiceStruct());

  int quantity = 1;

  bool isCVvalidated = true;

  GroupRecord? pickedIndustry;

  RoleRecord? pickedRole;

  bool isRoleGroupValidated = true;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Bottom Sheet - pickBottomSheet] action in Container widget.
  String? groupOutput;
  // Model for pseudoDropDown component.
  late PseudoDropDownModel pseudoDropDownModel1;
  // Stores action output result for [Bottom Sheet - pickBottomSheet] action in Container widget.
  String? roleOutput;
  // Model for pseudoDropDown component.
  late PseudoDropDownModel pseudoDropDownModel2;
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

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

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

  // Stores action output result for [Action Block - payByKarma] action in Button widget.
  bool? payByKarmaOutput;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    pseudoDropDownModel1 = createModel(context, () => PseudoDropDownModel());
    pseudoDropDownModel2 = createModel(context, () => PseudoDropDownModel());
    textController1Validator = _textController1Validator;
    textController2Validator = _textController2Validator;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    pseudoDropDownModel1.dispose();
    pseudoDropDownModel2.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
