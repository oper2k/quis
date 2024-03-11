import '/backend/backend.dart';
import '/components/courses_list_component_widget.dart';
import '/courses/missed_industry/missed_industry_widget.dart';
import '/courses/missed_industry_thankyou/missed_industry_thankyou_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/walkthroughs/quide_courses2.dart';
import 'dart:async';
import '/flutter_flow/custom_functions.dart' as functions;
import 'all_courses_guide_widget.dart' show AllCoursesGuideWidget;
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart'
    show TutorialCoachMark;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class AllCoursesGuideModel extends FlutterFlowModel<AllCoursesGuideWidget> {
  ///  Local state fields for this page.

  bool isSearch = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  TutorialCoachMark? quideCourses2Controller;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Models for coursesListComponent dynamic component.
  late FlutterFlowDynamicModels<CoursesListComponentModel>
      coursesListComponentModels1;
  // Models for coursesListComponent dynamic component.
  late FlutterFlowDynamicModels<CoursesListComponentModel>
      coursesListComponentModels2;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in Container widget.
  String? missedIndustryOutput;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    coursesListComponentModels1 =
        FlutterFlowDynamicModels(() => CoursesListComponentModel());
    coursesListComponentModels2 =
        FlutterFlowDynamicModels(() => CoursesListComponentModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    quideCourses2Controller?.finish();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    coursesListComponentModels1.dispose();
    coursesListComponentModels2.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  TutorialCoachMark createPageWalkthrough(BuildContext context) =>
      TutorialCoachMark(
        targets: createWalkthroughTargets(context),
        onSkip: () {
          return true;
        },
      );
}
