import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/pick_bottom_sheet_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'onboarding09experience_years_model.dart';
export 'onboarding09experience_years_model.dart';

class Onboarding09experienceYearsWidget extends StatefulWidget {
  const Onboarding09experienceYearsWidget({super.key});

  @override
  State<Onboarding09experienceYearsWidget> createState() =>
      _Onboarding09experienceYearsWidgetState();
}

class _Onboarding09experienceYearsWidgetState
    extends State<Onboarding09experienceYearsWidget> {
  late Onboarding09experienceYearsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Onboarding09experienceYearsModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'Onboarding09experienceYears'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('ONBOARDING09EXPERIENCE_YEARS_Onboarding0');
      logFirebaseEvent('Onboarding09experienceYears_update_page_');
      setState(() {
        _model.pickedYear = currentUserDocument!.careerProfile.expYears;
      });
      logFirebaseEvent('Onboarding09experienceYears_bottom_sheet');
      await showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        enableDrag: false,
        context: context,
        builder: (context) {
          return WebViewAware(
            child: GestureDetector(
              onTap: () => _model.unfocusNode.canRequestFocus
                  ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                  : FocusScope.of(context).unfocus(),
              child: Padding(
                padding: MediaQuery.viewInsetsOf(context),
                child: PickBottomSheetWidget(
                  stringList: functions.generateExpYears(20),
                  title: 'Please pick a number',
                ),
              ),
            ),
          );
        },
      ).then((value) => safeSetState(() => _model.expYearsOutputinit = value));

      if (_model.expYearsOutputinit != null &&
          _model.expYearsOutputinit != '') {
        logFirebaseEvent('Onboarding09experienceYears_update_page_');
        setState(() {
          _model.pickedYear = int.parse((_model.expYearsOutputinit!));
        });
      }
    });
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
                  logFirebaseEvent('ONBOARDING09EXPERIENCE_YEARS_Container_z');
                  logFirebaseEvent('Container_navigate_back');
                  context.safePop();
                },
                child: Container(
                  width: 40.0,
                  height: 40.0,
                  decoration: const BoxDecoration(),
                  alignment: const AlignmentDirectional(-1.0, 0.0),
                  child: Icon(
                    FFIcons.karrowBack,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    size: 30.0,
                  ),
                ),
              ),
            ],
          ),
          actions: const [],
          centerTitle: false,
          toolbarHeight: 40.0,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(30.0, 10.0, 30.0, 0.0),
                  child: Text(
                    'How many years of experience do you have?',
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
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 34.0, 0.0, 0.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      logFirebaseEvent(
                          'ONBOARDING09EXPERIENCE_YEARS_Container_j');
                      logFirebaseEvent('Container_bottom_sheet');
                      await showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        enableDrag: false,
                        context: context,
                        builder: (context) {
                          return WebViewAware(
                            child: GestureDetector(
                              onTap: () => _model.unfocusNode.canRequestFocus
                                  ? FocusScope.of(context)
                                      .requestFocus(_model.unfocusNode)
                                  : FocusScope.of(context).unfocus(),
                              child: Padding(
                                padding: MediaQuery.viewInsetsOf(context),
                                child: PickBottomSheetWidget(
                                  stringList: functions.generateExpYears(20),
                                  title: 'Please pick a number',
                                ),
                              ),
                            ),
                          );
                        },
                      ).then((value) =>
                          safeSetState(() => _model.expYearsOutput = value));

                      if (_model.expYearsOutput != null &&
                          _model.expYearsOutput != '') {
                        logFirebaseEvent('Container_update_page_state');
                        setState(() {
                          _model.pickedYear =
                              int.parse((_model.expYearsOutput!));
                        });
                      }

                      setState(() {});
                    },
                    child: Container(
                      width: double.infinity,
                      height: 56.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: Text(
                          _model.pickedYear.toString(),
                          style: FlutterFlowTheme.of(context)
                              .headlineLarge
                              .override(
                                fontFamily: 'Sofia Pro',
                                useGoogleFonts: false,
                                lineHeight: 1.16,
                              ),
                        ),
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                  child: FFButtonWidget(
                    onPressed: (_model.pickedYear == null)
                        ? null
                        : () async {
                            logFirebaseEvent(
                                'ONBOARDING09EXPERIENCE_YEARS_CONTINUE_BT');
                            logFirebaseEvent('Button_backend_call');

                            await currentUserReference!
                                .update(createUsersRecordData(
                              careerProfile: createCareerProfileStruct(
                                expYears: _model.pickedYear,
                                clearUnsetFields: false,
                              ),
                            ));
                            logFirebaseEvent('Button_navigate_to');

                            context.pushNamed('Onboarding10role');
                          },
                    text: 'Continue',
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 52.0,
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      iconPadding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle:
                          FlutterFlowTheme.of(context).headlineLarge.override(
                                fontFamily: 'Sofia Pro',
                                color: FlutterFlowTheme.of(context).info,
                                useGoogleFonts: false,
                              ),
                      elevation: 0.0,
                      borderSide: const BorderSide(
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
