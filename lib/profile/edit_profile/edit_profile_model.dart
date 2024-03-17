import '/backend/api_requests/api_calls.dart';
import '/components/avatar_widget.dart';
import '/components/pick_component_widget.dart';
import '/components/pseudo_drop_down_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'edit_profile_widget.dart' show EditProfileWidget;
import 'package:flutter/material.dart';

class EditProfileModel extends FlutterFlowModel<EditProfileWidget> {
  ///  Local state fields for this page.

  DocumentReference? groupRef;

  DocumentReference? roleRef;

  DocumentReference? goalRoleRef;

  int? expYears;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for avatar component.
  late AvatarModel avatarModel;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for firstNameField widget.
  FocusNode? firstNameFieldFocusNode;
  TextEditingController? firstNameFieldController;
  String? Function(BuildContext, String?)? firstNameFieldControllerValidator;
  // State field(s) for lastNameField widget.
  FocusNode? lastNameFieldFocusNode;
  TextEditingController? lastNameFieldController;
  String? Function(BuildContext, String?)? lastNameFieldControllerValidator;
  // Model for pseudoDropDown component.
  late PseudoDropDownModel pseudoDropDownModel;
  // Stores action output result for [Bottom Sheet - pickBottomSheet] action in pseudoDropDown widget.
  String? groupOutput;
  // Model for PickComponent component.
  late PickComponentModel pickComponentModel1;
  // Stores action output result for [Bottom Sheet - pickBottomSheet] action in PickComponent widget.
  String? roleOutput;
  // Model for PickComponent component.
  late PickComponentModel pickComponentModel2;
  // Stores action output result for [Bottom Sheet - pickBottomSheet] action in PickComponent widget.
  String? goalroleOutput;
  // Model for PickComponent component.
  late PickComponentModel pickComponentModel3;
  // Stores action output result for [Bottom Sheet - pickBottomSheet] action in PickComponent widget.
  String? expYearsOutput;
  // State field(s) for phoneField widget.
  FocusNode? phoneFieldFocusNode;
  TextEditingController? phoneFieldController;
  String? Function(BuildContext, String?)? phoneFieldControllerValidator;
  // State field(s) for linkedinField widget.
  FocusNode? linkedinFieldFocusNode;
  TextEditingController? linkedinFieldController;
  String? Function(BuildContext, String?)? linkedinFieldControllerValidator;
  // Stores action output result for [Backend Call - API (Create a contact)] action in Button widget.
  ApiCallResponse? apiResultsj66;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    avatarModel = createModel(context, () => AvatarModel());
    pseudoDropDownModel = createModel(context, () => PseudoDropDownModel());
    pickComponentModel1 = createModel(context, () => PickComponentModel());
    pickComponentModel2 = createModel(context, () => PickComponentModel());
    pickComponentModel3 = createModel(context, () => PickComponentModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    avatarModel.dispose();
    firstNameFieldFocusNode?.dispose();
    firstNameFieldController?.dispose();

    lastNameFieldFocusNode?.dispose();
    lastNameFieldController?.dispose();

    pseudoDropDownModel.dispose();
    pickComponentModel1.dispose();
    pickComponentModel2.dispose();
    pickComponentModel3.dispose();
    phoneFieldFocusNode?.dispose();
    phoneFieldController?.dispose();

    linkedinFieldFocusNode?.dispose();
    linkedinFieldController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
