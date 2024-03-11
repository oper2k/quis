import '/components/onboarding_list_check_item_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'onboarding05_widget.dart' show Onboarding05Widget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Onboarding05Model extends FlutterFlowModel<Onboarding05Widget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for onboardingListCheckItem component.
  late OnboardingListCheckItemModel onboardingListCheckItemModel1;
  // Model for onboardingListCheckItem component.
  late OnboardingListCheckItemModel onboardingListCheckItemModel2;
  // Model for onboardingListCheckItem component.
  late OnboardingListCheckItemModel onboardingListCheckItemModel3;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    onboardingListCheckItemModel1 =
        createModel(context, () => OnboardingListCheckItemModel());
    onboardingListCheckItemModel2 =
        createModel(context, () => OnboardingListCheckItemModel());
    onboardingListCheckItemModel3 =
        createModel(context, () => OnboardingListCheckItemModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    onboardingListCheckItemModel1.dispose();
    onboardingListCheckItemModel2.dispose();
    onboardingListCheckItemModel3.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
