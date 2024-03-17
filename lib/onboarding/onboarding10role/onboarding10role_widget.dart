import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/pick_bottom_sheet_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'onboarding10role_model.dart';
export 'onboarding10role_model.dart';

class Onboarding10roleWidget extends StatefulWidget {
  const Onboarding10roleWidget({super.key});

  @override
  State<Onboarding10roleWidget> createState() => _Onboarding10roleWidgetState();
}

class _Onboarding10roleWidgetState extends State<Onboarding10roleWidget> {
  late Onboarding10roleModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Onboarding10roleModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'Onboarding10role'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('ONBOARDING10ROLE_Onboarding10role_ON_INI');
      logFirebaseEvent('Onboarding10role_firestore_query');
      _model.roleQueryOutput = await queryRoleRecordOnce();
      logFirebaseEvent('Onboarding10role_bottom_sheet');
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
                  stringList:
                      _model.roleQueryOutput!.map((e) => e.name).toList(),
                  title: 'Choose from the roles below',
                ),
              ),
            ),
          );
        },
      ).then((value) => safeSetState(() => _model.roleOutputinit = value));

      if (_model.roleOutputinit != null && _model.roleOutputinit != '') {
        logFirebaseEvent('Onboarding10role_update_page_state');
        setState(() {
          _model.pickedRole = _model.roleQueryOutput
              ?.where((e) => e.name == _model.roleOutputinit)
              .toList()
              ?.first;
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
    return StreamBuilder<List<RoleRecord>>(
      stream: queryRoleRecord(),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<RoleRecord> onboarding10roleRoleRecordList = snapshot.data!;
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
                      logFirebaseEvent(
                          'ONBOARDING10ROLE_Container_8qkfuocw_ON_T');
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
                        'Which role are you currently in?',
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context)
                            .displayMedium
                            .override(
                              fontFamily: 'Sofia Pro',
                              color: FlutterFlowTheme.of(context).primaryText,
                              fontWeight: FontWeight.w500,
                              useGoogleFonts: false,
                            ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 34.0, 0.0, 0.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent(
                              'ONBOARDING10ROLE_Container_pxqr4scf_ON_T');
                          logFirebaseEvent('Container_bottom_sheet');
                          await showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            enableDrag: false,
                            context: context,
                            builder: (context) {
                              return WebViewAware(
                                child: GestureDetector(
                                  onTap: () =>
                                      _model.unfocusNode.canRequestFocus
                                          ? FocusScope.of(context)
                                              .requestFocus(_model.unfocusNode)
                                          : FocusScope.of(context).unfocus(),
                                  child: Padding(
                                    padding: MediaQuery.viewInsetsOf(context),
                                    child: PickBottomSheetWidget(
                                      stringList: _model.roleQueryOutput!
                                          .map((e) => e.name)
                                          .toList(),
                                      title: 'Choose from the roles below',
                                    ),
                                  ),
                                ),
                              );
                            },
                          ).then((value) =>
                              safeSetState(() => _model.roleOutput = value));

                          if (_model.roleOutput != null &&
                              _model.roleOutput != '') {
                            logFirebaseEvent('Container_update_page_state');
                            setState(() {
                              _model.pickedRole = _model.roleQueryOutput
                                  ?.where((e) => e.name == _model.roleOutput)
                                  .toList()
                                  ?.first;
                            });
                          }

                          setState(() {});
                        },
                        child: Container(
                          width: double.infinity,
                          height: 56.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Text(
                              valueOrDefault<String>(
                                _model.pickedRole?.name,
                                'Choose your role',
                              ),
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
                    Spacer(),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                      child: FFButtonWidget(
                        onPressed: (_model.pickedRole == null)
                            ? null
                            : () async {
                                logFirebaseEvent(
                                    'ONBOARDING10ROLE_CONTINUE_BTN_ON_TAP');
                                logFirebaseEvent('Button_backend_call');

                                await currentUserReference!
                                    .update(createUsersRecordData(
                                  careerProfile: createCareerProfileStruct(
                                    role: _model.pickedRole?.reference,
                                    clearUnsetFields: false,
                                  ),
                                ));
                                logFirebaseEvent('Button_navigate_to');

                                context.pushNamed('Onboarding11improve');
                              },
                        text: 'Continue',
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 52.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle: FlutterFlowTheme.of(context)
                              .headlineLarge
                              .override(
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
      },
    );
  }
}
