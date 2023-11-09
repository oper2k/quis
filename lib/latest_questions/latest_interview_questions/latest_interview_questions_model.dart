import '/backend/backend.dart';
import '/components/filter_element_widget.dart';
import '/components/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/latest_questions/questions_filter_bottom_sheet/questions_filter_bottom_sheet_widget.dart';
import 'dart:ui';
import '/flutter_flow/revenue_cat_util.dart' as revenue_cat;
import 'latest_interview_questions_widget.dart'
    show LatestInterviewQuestionsWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class LatestInterviewQuestionsModel
    extends FlutterFlowModel<LatestInterviewQuestionsWidget> {
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

  final unfocusNode = FocusNode();
  // State field(s) for SearchField widget.
  FocusNode? searchFieldFocusNode;
  TextEditingController? searchFieldController;
  String? Function(BuildContext, String?)? searchFieldControllerValidator;
  // Model for filterElement component.
  late FilterElementModel filterElementModel1;
  // Model for filterElement component.
  late FilterElementModel filterElementModel2;
  // Model for navBar component.
  late NavBarModel navBarModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    filterElementModel1 = createModel(context, () => FilterElementModel());
    filterElementModel2 = createModel(context, () => FilterElementModel());
    navBarModel = createModel(context, () => NavBarModel());
  }

  void dispose() {
    unfocusNode.dispose();
    searchFieldFocusNode?.dispose();
    searchFieldController?.dispose();

    filterElementModel1.dispose();
    filterElementModel2.dispose();
    navBarModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
