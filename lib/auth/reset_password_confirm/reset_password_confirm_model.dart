import '/flutter_flow/flutter_flow_util.dart';
import 'reset_password_confirm_widget.dart' show ResetPasswordConfirmWidget;
import 'package:flutter/material.dart';

class ResetPasswordConfirmModel
    extends FlutterFlowModel<ResetPasswordConfirmWidget> {
  ///  Local state fields for this page.

  bool isEmailValid = false;

  bool isPassword1Valid = false;

  bool isPassword2Valid = false;

  bool isRef = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
