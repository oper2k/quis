import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/onboarding/minus_element/minus_element_widget.dart';
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'onboarding19_o_n_b_c_o_m_p_l_e_t_e_d_widget.dart'
    show Onboarding19ONBCOMPLETEDWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Onboarding19ONBCOMPLETEDModel
    extends FlutterFlowModel<Onboarding19ONBCOMPLETEDWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for minusElement component.
  late MinusElementModel minusElementModel1;
  // Model for minusElement component.
  late MinusElementModel minusElementModel2;
  // Model for minusElement component.
  late MinusElementModel minusElementModel3;
  // Model for minusElement component.
  late MinusElementModel minusElementModel4;
  // Model for minusElement component.
  late MinusElementModel minusElementModel5;
  // Model for minusElement component.
  late MinusElementModel minusElementModel6;
  // Model for minusElement component.
  late MinusElementModel minusElementModel7;
  // Model for minusElement component.
  late MinusElementModel minusElementModel8;
  // Stores action output result for [Backend Call - API (Create a contact)] action in Button widget.
  ApiCallResponse? apiResultsj6;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    minusElementModel1 = createModel(context, () => MinusElementModel());
    minusElementModel2 = createModel(context, () => MinusElementModel());
    minusElementModel3 = createModel(context, () => MinusElementModel());
    minusElementModel4 = createModel(context, () => MinusElementModel());
    minusElementModel5 = createModel(context, () => MinusElementModel());
    minusElementModel6 = createModel(context, () => MinusElementModel());
    minusElementModel7 = createModel(context, () => MinusElementModel());
    minusElementModel8 = createModel(context, () => MinusElementModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    minusElementModel1.dispose();
    minusElementModel2.dispose();
    minusElementModel3.dispose();
    minusElementModel4.dispose();
    minusElementModel5.dispose();
    minusElementModel6.dispose();
    minusElementModel7.dispose();
    minusElementModel8.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
