import '/flutter_flow/flutter_flow_util.dart';
import 'onboarding09experience_years_widget.dart'
    show Onboarding09experienceYearsWidget;
import 'package:flutter/material.dart';

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
