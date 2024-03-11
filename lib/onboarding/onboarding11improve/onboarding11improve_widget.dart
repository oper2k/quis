import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/onboarding/onboarding_list_item_description/onboarding_list_item_description_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'onboarding11improve_model.dart';
export 'onboarding11improve_model.dart';

class Onboarding11improveWidget extends StatefulWidget {
  const Onboarding11improveWidget({super.key});

  @override
  State<Onboarding11improveWidget> createState() =>
      _Onboarding11improveWidgetState();
}

class _Onboarding11improveWidgetState extends State<Onboarding11improveWidget> {
  late Onboarding11improveModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Onboarding11improveModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'Onboarding11improve'});
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  logFirebaseEvent('ONBOARDING11IMPROVE_Container_kqwuy2df_O');
                  logFirebaseEvent('Container_navigate_back');
                  context.safePop();
                },
                child: Container(
                  width: 40.0,
                  height: 40.0,
                  decoration: BoxDecoration(),
                  alignment: AlignmentDirectional(-1.0, 0.0),
                  child: Icon(
                    FFIcons.karrowBack,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    size: 30.0,
                  ),
                ),
              ),
            ],
          ),
          actions: [],
          centerTitle: false,
          toolbarHeight: 40.0,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(30.0, 10.0, 30.0, 0.0),
                  child: Text(
                    'Is there anything you feel you need to improve?',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).displayMedium.override(
                          fontFamily: 'Sofia Pro',
                          color: FlutterFlowTheme.of(context).primaryText,
                          fontWeight: FontWeight.w500,
                          useGoogleFonts: false,
                        ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(30.0, 32.0, 30.0, 0.0),
                  child: Text(
                    'Choose all that apply',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).headlineMedium,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                  child: Builder(
                    builder: (context) {
                      final improvementItem =
                          FFAppState().improvementList.toList();
                      return Column(
                        mainAxisSize: MainAxisSize.max,
                        children: List.generate(improvementItem.length,
                            (improvementItemIndex) {
                          final improvementItemItem =
                              improvementItem[improvementItemIndex];
                          return InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'ONBOARDING11IMPROVE_Container_j878ez1j_O');
                              if (!_model.pickedimproveIndexList
                                  .contains(improvementItemIndex)) {
                                logFirebaseEvent(
                                    'onboardingListItemDescription_update_pag');
                                setState(() {
                                  _model.addToPickedimproveIndexList(
                                      improvementItemIndex);
                                });
                              } else {
                                logFirebaseEvent(
                                    'onboardingListItemDescription_update_pag');
                                setState(() {
                                  _model.removeFromPickedimproveIndexList(
                                      improvementItemIndex);
                                });
                              }
                            },
                            child: wrapWithModel(
                              model: _model.onboardingListItemDescriptionModels
                                  .getModel(
                                improvementItemIndex.toString(),
                                improvementItemIndex,
                              ),
                              updateCallback: () => setState(() {}),
                              child: OnboardingListItemDescriptionWidget(
                                key: Key(
                                  'Keyj87_${improvementItemIndex.toString()}',
                                ),
                                title: improvementItemItem.title,
                                description: improvementItemItem.description,
                                image: null,
                                isPicked: _model.pickedimproveIndexList
                                    .contains(improvementItemIndex),
                              ),
                            ),
                          );
                        }).divide(SizedBox(height: 12.0)),
                      );
                    },
                  ),
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      logFirebaseEvent(
                          'ONBOARDING11IMPROVE_CONTINUE_BTN_ON_TAP');
                      logFirebaseEvent('Button_navigate_to');

                      context.pushNamed('Onboarding12referral');
                    },
                    text: 'Continue',
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 52.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle:
                          FlutterFlowTheme.of(context).headlineLarge.override(
                                fontFamily: 'Sofia Pro',
                                color: FlutterFlowTheme.of(context).info,
                                useGoogleFonts: false,
                              ),
                      elevation: 0.0,
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 0.0,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
