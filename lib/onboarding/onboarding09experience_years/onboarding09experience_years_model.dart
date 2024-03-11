import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/pick_bottom_sheet_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'onboarding09experience_years_widget.dart'
    show Onboarding09experienceYearsWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class Onboarding09experienceYearsModel
    extends FlutterFlowModel<Onboarding09experienceYearsWidget> {
  ///  Local state fields for this page.

  int pickedYear = 0;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Bottom Sheet - pickBottomSheet] action in Onboarding09experienceYears widget.
  String? expYearsOutputinit;
  // Stores action output result for [Bottom Sheet - pickBottomSheet] action in Container widget.
  String? expYearsOutput;

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
