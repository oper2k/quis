import '/backend/backend.dart';
import '/components/courses_list_component_widget.dart';
import '/components/nav_bar_widget.dart';
import '/courses/missed_industry/missed_industry_widget.dart';
import '/courses/missed_industry_thankyou/missed_industry_thankyou_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'all_courses_widget.dart' show AllCoursesWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class AllCoursesModel extends FlutterFlowModel<AllCoursesWidget> {
  ///  Local state fields for this page.

  bool isSearch = false;

  ///  State fields for stateful widgets in this page.

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
  // Model for navBar component.
  late NavBarModel navBarModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    coursesListComponentModels1 =
        FlutterFlowDynamicModels(() => CoursesListComponentModel());
    coursesListComponentModels2 =
        FlutterFlowDynamicModels(() => CoursesListComponentModel());
    navBarModel = createModel(context, () => NavBarModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    coursesListComponentModels1.dispose();
    coursesListComponentModels2.dispose();
    navBarModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
