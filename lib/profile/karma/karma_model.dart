import '/auth/firebase_auth/auth_util.dart';
import '/components/menu_item_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'karma_widget.dart' show KarmaWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class KarmaModel extends FlutterFlowModel<KarmaWidget> {
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
