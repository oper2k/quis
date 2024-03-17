import '/components/check_mark_blue_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'feedback_pick_element_widget.dart' show FeedbackPickElementWidget;
import 'package:flutter/material.dart';

class FeedbackPickElementModel
    extends FlutterFlowModel<FeedbackPickElementWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for checkMarkBlue component.
  late CheckMarkBlueModel checkMarkBlueModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    checkMarkBlueModel = createModel(context, () => CheckMarkBlueModel());
  }

  @override
  void dispose() {
    checkMarkBlueModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
