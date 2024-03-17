import '/components/check_mark_blue_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'questions_filter_bottom_sheet_widget.dart'
    show QuestionsFilterBottomSheetWidget;
import 'package:flutter/material.dart';

class QuestionsFilterBottomSheetModel
    extends FlutterFlowModel<QuestionsFilterBottomSheetWidget> {
  ///  Local state fields for this component.

  List<String> filterList = [];
  void addToFilterList(String item) => filterList.add(item);
  void removeFromFilterList(String item) => filterList.remove(item);
  void removeAtIndexFromFilterList(int index) => filterList.removeAt(index);
  void insertAtIndexInFilterList(int index, String item) =>
      filterList.insert(index, item);
  void updateFilterListAtIndex(int index, Function(String) updateFn) =>
      filterList[index] = updateFn(filterList[index]);

  ///  State fields for stateful widgets in this component.

  // Model for checkMarkBlue component.
  late CheckMarkBlueModel checkMarkBlueModel1;
  // Model for checkMarkBlue component.
  late CheckMarkBlueModel checkMarkBlueModel2;
  // Model for checkMarkBlue component.
  late CheckMarkBlueModel checkMarkBlueModel3;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    checkMarkBlueModel1 = createModel(context, () => CheckMarkBlueModel());
    checkMarkBlueModel2 = createModel(context, () => CheckMarkBlueModel());
    checkMarkBlueModel3 = createModel(context, () => CheckMarkBlueModel());
  }

  @override
  void dispose() {
    checkMarkBlueModel1.dispose();
    checkMarkBlueModel2.dispose();
    checkMarkBlueModel3.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
