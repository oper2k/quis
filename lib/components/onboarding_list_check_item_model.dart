import '/components/check_mark_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'onboarding_list_check_item_widget.dart'
    show OnboardingListCheckItemWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OnboardingListCheckItemModel
    extends FlutterFlowModel<OnboardingListCheckItemWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for checkMark component.
  late CheckMarkModel checkMarkModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    checkMarkModel = createModel(context, () => CheckMarkModel());
  }

  @override
  void dispose() {
    checkMarkModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
