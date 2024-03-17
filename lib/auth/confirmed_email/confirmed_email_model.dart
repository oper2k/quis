import '/flutter_flow/flutter_flow_util.dart';
import 'confirmed_email_widget.dart' show ConfirmedEmailWidget;
import 'package:flutter/material.dart';

class ConfirmedEmailModel extends FlutterFlowModel<ConfirmedEmailWidget> {
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
