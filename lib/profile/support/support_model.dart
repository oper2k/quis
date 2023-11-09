import '/backend/backend.dart';
import '/components/pick_bottom_sheet_widget.dart';
import '/components/pseudo_drop_down_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/profile/support_letter_dialog/support_letter_dialog_widget.dart';
import 'support_widget.dart' show SupportWidget;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class SupportModel extends FlutterFlowModel<SupportWidget> {
  ///  Local state fields for this page.

  String? pickedTopic = '';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Bottom Sheet - pickBottomSheet] action in Container widget.
  String? topicOutput;
  // Model for pseudoDropDown component.
  late PseudoDropDownModel pseudoDropDownModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  String? _textControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    pseudoDropDownModel = createModel(context, () => PseudoDropDownModel());
    textControllerValidator = _textControllerValidator;
  }

  void dispose() {
    unfocusNode.dispose();
    pseudoDropDownModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
