import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/onboarding/onboarding_list_item_practice_time/onboarding_list_item_practice_time_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'onboarding14practice_goal_model.dart';
export 'onboarding14practice_goal_model.dart';

class Onboarding14practiceGoalWidget extends StatefulWidget {
  const Onboarding14practiceGoalWidget({super.key});

  @override
  State<Onboarding14practiceGoalWidget> createState() =>
      _Onboarding14practiceGoalWidgetState();
}

class _Onboarding14practiceGoalWidgetState
    extends State<Onboarding14practiceGoalWidget> {
  late Onboarding14practiceGoalModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Onboarding14practiceGoalModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'Onboarding14practiceGoal'});
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                  logFirebaseEvent('ONBOARDING14PRACTICE_GOAL_Container_i0x6');
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
                    'What\'s your weekly interview practice goal?',
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
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent(
                              'ONBOARDING14PRACTICE_GOAL_Container_afq2');
                          logFirebaseEvent(
                              'onboardingListItemPracticeTime_update_pa');
                          setState(() {
                            _model.pickedTime = '1';
                          });
                        },
                        child: wrapWithModel(
                          model: _model.onboardingListItemPracticeTimeModel1,
                          updateCallback: () => setState(() {}),
                          child: OnboardingListItemPracticeTimeWidget(
                            textLeft: '1 time/week ',
                            textRight: 'Casual',
                            isPicked: _model.pickedTime == '1',
                          ),
                        ),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent(
                              'ONBOARDING14PRACTICE_GOAL_Container_zoi7');
                          logFirebaseEvent(
                              'onboardingListItemPracticeTime_update_pa');
                          setState(() {
                            _model.pickedTime = '3';
                          });
                        },
                        child: wrapWithModel(
                          model: _model.onboardingListItemPracticeTimeModel2,
                          updateCallback: () => setState(() {}),
                          child: OnboardingListItemPracticeTimeWidget(
                            textLeft: '3 time/week ',
                            textRight: 'Regular',
                            isPicked: _model.pickedTime == '3',
                          ),
                        ),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent(
                              'ONBOARDING14PRACTICE_GOAL_Container_ksd2');
                          logFirebaseEvent(
                              'onboardingListItemPracticeTime_update_pa');
                          setState(() {
                            _model.pickedTime = '5';
                          });
                        },
                        child: wrapWithModel(
                          model: _model.onboardingListItemPracticeTimeModel3,
                          updateCallback: () => setState(() {}),
                          child: OnboardingListItemPracticeTimeWidget(
                            textLeft: '5 time/week ',
                            textRight: 'Serious',
                            isPicked: _model.pickedTime == '5',
                          ),
                        ),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent(
                              'ONBOARDING14PRACTICE_GOAL_Container_r74u');
                          logFirebaseEvent(
                              'onboardingListItemPracticeTime_update_pa');
                          setState(() {
                            _model.pickedTime = '7';
                          });
                        },
                        child: wrapWithModel(
                          model: _model.onboardingListItemPracticeTimeModel4,
                          updateCallback: () => setState(() {}),
                          child: OnboardingListItemPracticeTimeWidget(
                            textLeft: '7 time/week ',
                            textRight: 'Intense',
                            isPicked: _model.pickedTime == '7',
                          ),
                        ),
                      ),
                    ].divide(SizedBox(height: 9.0)),
                  ),
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                  child: FFButtonWidget(
                    onPressed:
                        (_model.pickedTime == null || _model.pickedTime == '')
                            ? null
                            : () async {
                                logFirebaseEvent(
                                    'ONBOARDING14PRACTICE_GOAL_I’M_COMMITED_B');
                                logFirebaseEvent('Button_navigate_to');

                                context.pushNamed('Onboarding15');
                              },
                    text: 'I’m commited',
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
                      disabledColor: FlutterFlowTheme.of(context).secondary,
                      disabledTextColor: FlutterFlowTheme.of(context).white,
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
