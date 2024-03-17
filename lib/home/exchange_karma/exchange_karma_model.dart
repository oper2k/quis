import '/flutter_flow/flutter_flow_util.dart';
import 'exchange_karma_widget.dart' show ExchangeKarmaWidget;
import 'package:flutter/material.dart';

class ExchangeKarmaModel extends FlutterFlowModel<ExchangeKarmaWidget> {
  ///  Local state fields for this page.

  String? pickedService = '';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
