import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/pseudo_drop_down_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'add_ons_widget.dart' show AddOnsWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class AddOnsModel extends FlutterFlowModel<AddOnsWidget> {
  ///  Local state fields for this page.

  ServiceStruct? pickedAddon;
  void updatePickedAddonStruct(Function(ServiceStruct) updateFn) =>
      updateFn(pickedAddon ??= ServiceStruct());

  bool isServiceValidated = true;

  bool isCVValidated = true;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Bottom Sheet - pickBottomSheet] action in Container widget.
  String? serviceOutput;
  // Model for pseudoDropDown component.
  late PseudoDropDownModel pseudoDropDownModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  String? _textControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // Stores action output result for [Backend Call - API (Send an email)] action in Button widget.
  ApiCallResponse? apiResult8hg;
  // Stores action output result for [Backend Call - API (Send an email)] action in Button widget.
  ApiCallResponse? apiResult8hge;
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

  // State field(s) for Expandable widget.
  late ExpandableController expandableController10;

  // State field(s) for Expandable widget.
  late ExpandableController expandableController11;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    pseudoDropDownModel = createModel(context, () => PseudoDropDownModel());
    textControllerValidator = _textControllerValidator;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    pseudoDropDownModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    expandableController1.dispose();
    expandableController2.dispose();
    expandableController3.dispose();
    expandableController4.dispose();
    expandableController5.dispose();
    expandableController6.dispose();
    expandableController7.dispose();
    expandableController8.dispose();
    expandableController9.dispose();
    expandableController10.dispose();
    expandableController11.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
