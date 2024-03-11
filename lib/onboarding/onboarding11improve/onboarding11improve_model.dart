import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/onboarding/onboarding_list_item_description/onboarding_list_item_description_widget.dart';
import 'onboarding11improve_widget.dart' show Onboarding11improveWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Onboarding11improveModel
    extends FlutterFlowModel<Onboarding11improveWidget> {
  ///  Local state fields for this page.

  List<int> pickedimproveIndexList = [];
  void addToPickedimproveIndexList(int item) =>
      pickedimproveIndexList.add(item);
  void removeFromPickedimproveIndexList(int item) =>
      pickedimproveIndexList.remove(item);
  void removeAtIndexFromPickedimproveIndexList(int index) =>
      pickedimproveIndexList.removeAt(index);
  void insertAtIndexInPickedimproveIndexList(int index, int item) =>
      pickedimproveIndexList.insert(index, item);
  void updatePickedimproveIndexListAtIndex(int index, Function(int) updateFn) =>
      pickedimproveIndexList[index] = updateFn(pickedimproveIndexList[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Models for onboardingListItemDescription dynamic component.
  late FlutterFlowDynamicModels<OnboardingListItemDescriptionModel>
      onboardingListItemDescriptionModels;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    onboardingListItemDescriptionModels =
        FlutterFlowDynamicModels(() => OnboardingListItemDescriptionModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    onboardingListItemDescriptionModels.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
