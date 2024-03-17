import '/components/menu_item_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'billing_managment_widget.dart' show BillingManagmentWidget;
import 'package:flutter/material.dart';

class BillingManagmentModel extends FlutterFlowModel<BillingManagmentWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for MenuItem component.
  late MenuItemModel menuItemModel1;
  // Model for MenuItem component.
  late MenuItemModel menuItemModel2;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    menuItemModel1 = createModel(context, () => MenuItemModel());
    menuItemModel2 = createModel(context, () => MenuItemModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    menuItemModel1.dispose();
    menuItemModel2.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
