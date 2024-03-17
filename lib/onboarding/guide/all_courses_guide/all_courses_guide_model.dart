import '/components/courses_list_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'all_courses_guide_widget.dart' show AllCoursesGuideWidget;
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart'
    show TutorialCoachMark;
import 'package:flutter/material.dart';

class AllCoursesGuideModel extends FlutterFlowModel<AllCoursesGuideWidget> {
  ///  Local state fields for this page.

  bool isSearch = false;

  ///  State fields for stateful widgets in this page.

  TutorialCoachMark? quideCourses2Controller;
  final unfocusNode = FocusNode();
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
    quideCourses2Controller?.finish();
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    coursesListComponentModels1.dispose();
    coursesListComponentModels2.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
