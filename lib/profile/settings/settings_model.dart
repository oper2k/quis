import '/components/menu_item_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'settings_widget.dart' show SettingsWidget;
import 'package:flutter/material.dart';

class SettingsModel extends FlutterFlowModel<SettingsWidget> {
  ///  Local state fields for this page.

  bool isButtonPressed = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for MenuItem component.
  late MenuItemModel menuItemModel1;
  // Model for MenuItem component.
  late MenuItemModel menuItemModel2;
  // Model for MenuItem component.
  late MenuItemModel menuItemModel3;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in MenuItem widget.
  bool? deleteOutput;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    menuItemModel1 = createModel(context, () => MenuItemModel());
    menuItemModel2 = createModel(context, () => MenuItemModel());
    menuItemModel3 = createModel(context, () => MenuItemModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    menuItemModel1.dispose();
    menuItemModel2.dispose();
    menuItemModel3.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
