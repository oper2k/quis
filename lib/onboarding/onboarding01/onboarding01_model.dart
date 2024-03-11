import '/components/check_mark_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'onboarding01_widget.dart' show Onboarding01Widget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Onboarding01Model extends FlutterFlowModel<Onboarding01Widget> {
  ///  Local state fields for this page.

  bool isPravicyPolicyConsent = false;

  bool isTermsOfUseConsent = false;

  bool isPolicyRed = false;

  bool isTermsRed = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for checkMark component.
  late CheckMarkModel checkMarkModel1;
  // Model for checkMark component.
  late CheckMarkModel checkMarkModel2;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    checkMarkModel1 = createModel(context, () => CheckMarkModel());
    checkMarkModel2 = createModel(context, () => CheckMarkModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    checkMarkModel1.dispose();
    checkMarkModel2.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
