import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'onboarding10role_widget.dart' show Onboarding10roleWidget;
import 'package:flutter/material.dart';

class Onboarding10roleModel extends FlutterFlowModel<Onboarding10roleWidget> {
  ///  Local state fields for this page.

  RoleRecord? pickedRole;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in Onboarding10role widget.
  List<RoleRecord>? roleQueryOutput;
  // Stores action output result for [Bottom Sheet - pickBottomSheet] action in Onboarding10role widget.
  String? roleOutputinit;
  // Stores action output result for [Bottom Sheet - pickBottomSheet] action in Container widget.
  String? roleOutput;

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
