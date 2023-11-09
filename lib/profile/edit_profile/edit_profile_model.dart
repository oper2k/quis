import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/avatar_widget.dart';
import '/components/karma_plus_dialog_widget.dart';
import '/components/pick_bottom_sheet_widget.dart';
import '/components/pick_component_widget.dart';
import '/components/pseudo_drop_down_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:async';
import '/flutter_flow/custom_functions.dart' as functions;
import 'edit_profile_widget.dart' show EditProfileWidget;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    avatarModel = createModel(context, () => AvatarModel());
    pseudoDropDownModel = createModel(context, () => PseudoDropDownModel());
    pickComponentModel1 = createModel(context, () => PickComponentModel());
    pickComponentModel2 = createModel(context, () => PickComponentModel());
    pickComponentModel3 = createModel(context, () => PickComponentModel());
  }

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
