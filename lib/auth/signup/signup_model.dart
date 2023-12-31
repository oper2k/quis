import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/check_mark_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'signup_widget.dart' show SignupWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SignupModel extends FlutterFlowModel<SignupWidget> {
  ///  Local state fields for this page.

  bool isEmailValid = false;

  bool isPassword1Valid = false;

  bool isPassword2Valid = false;

  bool isRef = false;

  bool isConsent = false;

  bool isConsentRed = false;

  bool isRefValid = true;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey2 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  // State field(s) for EmailField widget.
  FocusNode? emailFieldFocusNode;
  TextEditingController? emailFieldController;
  String? Function(BuildContext, String?)? emailFieldControllerValidator;
  // Model for checkMark component.
  late CheckMarkModel checkMarkModel1;
  // State field(s) for PasswordField1 widget.
  FocusNode? passwordField1FocusNode;
  TextEditingController? passwordField1Controller;
  late bool passwordField1Visibility;
  String? Function(BuildContext, String?)? passwordField1ControllerValidator;
  String? _passwordField1ControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 8) {
      return 'Requires at least 8 characters.';
    }

    return null;
  }

  // State field(s) for PasswordField2 widget.
  FocusNode? passwordField2FocusNode;
  TextEditingController? passwordField2Controller;
  late bool passwordField2Visibility;
  String? Function(BuildContext, String?)? passwordField2ControllerValidator;
  String? _passwordField2ControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 8) {
      return 'Requires at least 8 characters.';
    }

    return null;
  }

  // Model for checkMark component.
  late CheckMarkModel checkMarkModel2;
  // Model for checkMark component.
  late CheckMarkModel checkMarkModel3;
  // State field(s) for RefField widget.
  FocusNode? refFieldFocusNode;
  TextEditingController? refFieldController;
  String? Function(BuildContext, String?)? refFieldControllerValidator;
  String? _refFieldControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<UsersRecord>? refUserOutput;
  // Stores action output result for [Firestore Query - Query a collection] action in Google widget.
  List<UsersRecord>? refUserOutputGoogle;
  // Stores action output result for [Firestore Query - Query a collection] action in Apple widget.
  List<UsersRecord>? refUserOutputApple;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    checkMarkModel1 = createModel(context, () => CheckMarkModel());
    passwordField1Visibility = false;
    passwordField1ControllerValidator = _passwordField1ControllerValidator;
    passwordField2Visibility = false;
    passwordField2ControllerValidator = _passwordField2ControllerValidator;
    checkMarkModel2 = createModel(context, () => CheckMarkModel());
    checkMarkModel3 = createModel(context, () => CheckMarkModel());
    refFieldControllerValidator = _refFieldControllerValidator;
  }

  void dispose() {
    unfocusNode.dispose();
    emailFieldFocusNode?.dispose();
    emailFieldController?.dispose();

    checkMarkModel1.dispose();
    passwordField1FocusNode?.dispose();
    passwordField1Controller?.dispose();

    passwordField2FocusNode?.dispose();
    passwordField2Controller?.dispose();

    checkMarkModel2.dispose();
    checkMarkModel3.dispose();
    refFieldFocusNode?.dispose();
    refFieldController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
