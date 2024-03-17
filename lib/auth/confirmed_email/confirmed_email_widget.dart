import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'confirmed_email_model.dart';
export 'confirmed_email_model.dart';

class ConfirmedEmailWidget extends StatefulWidget {
  const ConfirmedEmailWidget({super.key});

  @override
  State<ConfirmedEmailWidget> createState() => _ConfirmedEmailWidgetState();
}

class _ConfirmedEmailWidgetState extends State<ConfirmedEmailWidget> {
  late ConfirmedEmailModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ConfirmedEmailModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'ConfirmedEmail'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('CONFIRMED_EMAIL_ConfirmedEmail_ON_INIT_S');
      logFirebaseEvent('ConfirmedEmail_backend_call');

      await currentUserReference!.update(createUsersRecordData(
        isEmailPageViewed: true,
      ));
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
        backgroundColor: FlutterFlowTheme.of(context).white,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).white,
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 40.0,
                height: 40.0,
                decoration: const BoxDecoration(),
                alignment: const AlignmentDirectional(-1.0, 0.0),
              ),
              Text(
                'Sign up',
                style: FlutterFlowTheme.of(context).headlineLarge,
              ),
              Container(
                width: 40.0,
                height: 40.0,
                decoration: const BoxDecoration(),
              ),
            ],
          ),
          actions: const [],
          centerTitle: false,
          toolbarHeight: 40.0,
          elevation: 0.0,
        ),
        body: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 42.0, 0.0, 0.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(0.0),
                  child: Image.asset(
                    'assets/images/Hands_of_people_holding_balloons_among_confetti_1.webp',
                    width: 229.0,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                  child: Text(
                    'Email address confirmed!',
                    style: FlutterFlowTheme.of(context).headlineLarge,
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                  child: Text(
                    'Next you can select a plan, create your profile\nand enjoy using this App.',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).headlineSmall,
                  ),
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    logFirebaseEvent('CONFIRMED_EMAIL_GET_STARTED_BTN_ON_TAP');
                    logFirebaseEvent('Button_backend_call');

                    await currentUserReference!.update(createUsersRecordData(
                      isEmailPageViewed: true,
                    ));
                    logFirebaseEvent('Button_navigate_to');

                    context.goNamed('Home');
                  },
                  text: 'Get Started',
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
                              color: FlutterFlowTheme.of(context).white,
                              useGoogleFonts: false,
                            ),
                    elevation: 0.0,
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                      width: 0.0,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ].addToEnd(const SizedBox(height: 50.0)),
          ),
        ),
      ),
    );
  }
}
