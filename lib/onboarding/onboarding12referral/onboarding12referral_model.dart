import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'onboarding12referral_widget.dart' show Onboarding12referralWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class Onboarding12referralModel
    extends FlutterFlowModel<Onboarding12referralWidget> {
  ///  Local state fields for this page.

  bool isRefValid = false;

  bool isFieldRed = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for refField widget.
  FocusNode? refFieldFocusNode;
  TextEditingController? refFieldController;
  String? Function(BuildContext, String?)? refFieldControllerValidator;
  String? _refFieldControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 6) {
      return 'Requires at least 6 characters.';
    }

    return null;
  }

  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<UsersRecord>? refUserOutput;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    refFieldControllerValidator = _refFieldControllerValidator;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    refFieldFocusNode?.dispose();
    refFieldController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
