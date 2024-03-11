import '/components/onboarding_list_check_item_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'onboarding08_widget.dart' show Onboarding08Widget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Onboarding08Model extends FlutterFlowModel<Onboarding08Widget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for onboardingListCheckItem component.
  late OnboardingListCheckItemModel onboardingListCheckItemModel1;
  // Model for onboardingListCheckItem component.
  late OnboardingListCheckItemModel onboardingListCheckItemModel2;
  // Model for onboardingListCheckItem component.
  late OnboardingListCheckItemModel onboardingListCheckItemModel3;
  // Model for onboardingListCheckItem component.
  late OnboardingListCheckItemModel onboardingListCheckItemModel4;
  // Model for onboardingListCheckItem component.
  late OnboardingListCheckItemModel onboardingListCheckItemModel5;
  // Model for onboardingListCheckItem component.
  late OnboardingListCheckItemModel onboardingListCheckItemModel6;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    onboardingListCheckItemModel1 =
        createModel(context, () => OnboardingListCheckItemModel());
    onboardingListCheckItemModel2 =
        createModel(context, () => OnboardingListCheckItemModel());
    onboardingListCheckItemModel3 =
        createModel(context, () => OnboardingListCheckItemModel());
    onboardingListCheckItemModel4 =
        createModel(context, () => OnboardingListCheckItemModel());
    onboardingListCheckItemModel5 =
        createModel(context, () => OnboardingListCheckItemModel());
    onboardingListCheckItemModel6 =
        createModel(context, () => OnboardingListCheckItemModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    onboardingListCheckItemModel1.dispose();
    onboardingListCheckItemModel2.dispose();
    onboardingListCheckItemModel3.dispose();
    onboardingListCheckItemModel4.dispose();
    onboardingListCheckItemModel5.dispose();
    onboardingListCheckItemModel6.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
