import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/components/avatar_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/walkthroughs/guide_home4.dart';
import 'dart:async';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/revenue_cat_util.dart' as revenue_cat;
import 'home_guide2_widget.dart' show HomeGuide2Widget;
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart'
    show TutorialCoachMark;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class HomeGuide2Model extends FlutterFlowModel<HomeGuide2Widget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  TutorialCoachMark? guideHome4Controller;
  // Model for avatar component.
  late AvatarModel avatarModel;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    avatarModel = createModel(context, () => AvatarModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    guideHome4Controller?.finish();
    avatarModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  TutorialCoachMark createPageWalkthrough(BuildContext context) =>
      TutorialCoachMark(
        targets: createWalkthroughTargets(context),
        onFinish: () async {
          logFirebaseEvent('HOME_GUIDE2_HomeGuide2_ON_WALKTHROUGH_CO');
          logFirebaseEvent('HomeGuide2_navigate_to');

          context.goNamed(
            'PracticeInterviewGuide',
            extra: <String, dynamic>{
              kTransitionInfoKey: TransitionInfo(
                hasTransition: true,
                transitionType: PageTransitionType.fade,
                duration: Duration(milliseconds: 0),
              ),
            },
          );
        },
        onSkip: () {
          logFirebaseEvent('HOME_GUIDE2_HomeGuide2_ON_WALKTHROUGH_SK');
          logFirebaseEvent('HomeGuide2_navigate_to');

          context.goNamed(
            'PracticeInterviewGuide',
            extra: <String, dynamic>{
              kTransitionInfoKey: TransitionInfo(
                hasTransition: true,
                transitionType: PageTransitionType.fade,
                duration: Duration(milliseconds: 0),
              ),
            },
          );

          return true;
        },
      );
}
