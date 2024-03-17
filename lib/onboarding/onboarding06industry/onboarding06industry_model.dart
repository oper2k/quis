import '/flutter_flow/flutter_flow_util.dart';
import '/onboarding/onboarding_list_item_description/onboarding_list_item_description_widget.dart';
import 'onboarding06industry_widget.dart' show Onboarding06industryWidget;
import 'package:flutter/material.dart';

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
