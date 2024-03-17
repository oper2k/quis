import '/flutter_flow/flutter_flow_util.dart';
import 'reset_password_old_widget.dart' show ResetPasswordOldWidget;
import 'package:flutter/material.dart';

class ResetPasswordOldModel extends FlutterFlowModel<ResetPasswordOldWidget> {
  ///  Local state fields for this page.

  bool isEmailValid = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for EmailField widget.
  FocusNode? emailFieldFocusNode;
  TextEditingController? emailFieldController;
  String? Function(BuildContext, String?)? emailFieldControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    emailFieldFocusNode?.dispose();
    emailFieldController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
