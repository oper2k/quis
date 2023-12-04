import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/message_element_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'add_ons_copy_widget.dart' show AddOnsCopyWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class AddOnsCopyModel extends FlutterFlowModel<AddOnsCopyWidget> {
  ///  Local state fields for this page.

  ServiceStruct? pickedAddon;
  void updatePickedAddonStruct(Function(ServiceStruct) updateFn) =>
      updateFn(pickedAddon ??= ServiceStruct());

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for messageElement component.
  late MessageElementModel messageElementModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    messageElementModel = createModel(context, () => MessageElementModel());
  }

  void dispose() {
    unfocusNode.dispose();
    messageElementModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
