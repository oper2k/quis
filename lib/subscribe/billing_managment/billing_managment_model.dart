import '/components/menu_item_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/revenue_cat_util.dart' as revenue_cat;
import 'billing_managment_widget.dart' show BillingManagmentWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BillingManagmentModel extends FlutterFlowModel<BillingManagmentWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for MenuItem component.
  late MenuItemModel menuItemModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    menuItemModel = createModel(context, () => MenuItemModel());
  }

  void dispose() {
    unfocusNode.dispose();
    menuItemModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
