import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/onboarding/onboarding_list_item_description/onboarding_list_item_description_widget.dart';
import 'onboarding06industry_widget.dart' show Onboarding06industryWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Onboarding06industryModel
    extends FlutterFlowModel<Onboarding06industryWidget> {
  ///  Local state fields for this page.

  DocumentReference? pickedGroup;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Models for onboardingListItemDescription dynamic component.
  late FlutterFlowDynamicModels<OnboardingListItemDescriptionModel>
      onboardingListItemDescriptionModels;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    onboardingListItemDescriptionModels =
        FlutterFlowDynamicModels(() => OnboardingListItemDescriptionModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    onboardingListItemDescriptionModels.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
