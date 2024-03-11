import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/onboarding/onboarding_list_item_practice_time/onboarding_list_item_practice_time_widget.dart';
import 'onboarding14practice_goal_widget.dart'
    show Onboarding14practiceGoalWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Onboarding14practiceGoalModel
    extends FlutterFlowModel<Onboarding14practiceGoalWidget> {
  ///  Local state fields for this page.

  String? pickedTime;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for onboardingListItemPracticeTime component.
  late OnboardingListItemPracticeTimeModel onboardingListItemPracticeTimeModel1;
  // Model for onboardingListItemPracticeTime component.
  late OnboardingListItemPracticeTimeModel onboardingListItemPracticeTimeModel2;
  // Model for onboardingListItemPracticeTime component.
  late OnboardingListItemPracticeTimeModel onboardingListItemPracticeTimeModel3;
  // Model for onboardingListItemPracticeTime component.
  late OnboardingListItemPracticeTimeModel onboardingListItemPracticeTimeModel4;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    onboardingListItemPracticeTimeModel1 =
        createModel(context, () => OnboardingListItemPracticeTimeModel());
    onboardingListItemPracticeTimeModel2 =
        createModel(context, () => OnboardingListItemPracticeTimeModel());
    onboardingListItemPracticeTimeModel3 =
        createModel(context, () => OnboardingListItemPracticeTimeModel());
    onboardingListItemPracticeTimeModel4 =
        createModel(context, () => OnboardingListItemPracticeTimeModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    onboardingListItemPracticeTimeModel1.dispose();
    onboardingListItemPracticeTimeModel2.dispose();
    onboardingListItemPracticeTimeModel3.dispose();
    onboardingListItemPracticeTimeModel4.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
