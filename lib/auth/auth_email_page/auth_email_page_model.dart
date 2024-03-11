import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'auth_email_page_widget.dart' show AuthEmailPageWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AuthEmailPageModel extends FlutterFlowModel<AuthEmailPageWidget> {
  ///  Local state fields for this page.

  String? signUpPassword;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for suEmailField widget.
  FocusNode? suEmailFieldFocusNode;
  TextEditingController? suEmailFieldController;
  String? Function(BuildContext, String?)? suEmailFieldControllerValidator;
  // State field(s) for suPasswordField widget.
  FocusNode? suPasswordFieldFocusNode;
  TextEditingController? suPasswordFieldController;
  late bool suPasswordFieldVisibility;
  String? Function(BuildContext, String?)? suPasswordFieldControllerValidator;
  // State field(s) for liEmailField widget.
  FocusNode? liEmailFieldFocusNode;
  TextEditingController? liEmailFieldController;
  String? Function(BuildContext, String?)? liEmailFieldControllerValidator;
  // State field(s) for liPasswordField widget.
  FocusNode? liPasswordFieldFocusNode;
  TextEditingController? liPasswordFieldController;
  late bool liPasswordFieldVisibility;
  String? Function(BuildContext, String?)? liPasswordFieldControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    suPasswordFieldVisibility = false;
    liPasswordFieldVisibility = false;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    tabBarController?.dispose();
    suEmailFieldFocusNode?.dispose();
    suEmailFieldController?.dispose();

    suPasswordFieldFocusNode?.dispose();
    suPasswordFieldController?.dispose();

    liEmailFieldFocusNode?.dispose();
    liEmailFieldController?.dispose();

    liPasswordFieldFocusNode?.dispose();
    liPasswordFieldController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
