import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/components/filter_element_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/latest_questions/questions_filter_bottom_sheet/questions_filter_bottom_sheet_widget.dart';
import '/walkthroughs/guide_questions3.dart';
import 'dart:async';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/revenue_cat_util.dart' as revenue_cat;
import 'latest_interview_questions_guide_widget.dart'
    show LatestInterviewQuestionsGuideWidget;
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart'
    show TutorialCoachMark;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class LatestInterviewQuestionsGuideModel
    extends FlutterFlowModel<LatestInterviewQuestionsGuideWidget> {
  ///  Local state fields for this page.

  List<String> filterList = [];
  void addToFilterList(String item) => filterList.add(item);
  void removeFromFilterList(String item) => filterList.remove(item);
  void removeAtIndexFromFilterList(int index) => filterList.removeAt(index);
  void insertAtIndexInFilterList(int index, String item) =>
      filterList.insert(index, item);
  void updateFilterListAtIndex(int index, Function(String) updateFn) =>
      filterList[index] = updateFn(filterList[index]);

  bool isSearch = false;

  bool isAll = true;

  ///  State fields for stateful widgets in this page.

  TutorialCoachMark? guideQuestions3Controller;
  final unfocusNode = FocusNode();
  // State field(s) for SearchField widget.
  FocusNode? searchFieldFocusNode;
  TextEditingController? searchFieldController;
  String? Function(BuildContext, String?)? searchFieldControllerValidator;
  // Stores action output result for [Bottom Sheet - QuestionsFilterBottomSheet] action in Container widget.
  List<String>? filterOutput;
  // Model for filterElement component.
  late FilterElementModel filterElementModel1;
  // Model for filterElement component.
  late FilterElementModel filterElementModel2;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    filterElementModel1 = createModel(context, () => FilterElementModel());
    filterElementModel2 = createModel(context, () => FilterElementModel());
  }

  @override
  void dispose() {
    guideQuestions3Controller?.finish();
    unfocusNode.dispose();
    searchFieldFocusNode?.dispose();
    searchFieldController?.dispose();

    filterElementModel1.dispose();
    filterElementModel2.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
