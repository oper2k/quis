import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/karma_plus_dialog_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'thank_you_for_question_model.dart';
export 'thank_you_for_question_model.dart';

class ThankYouForQuestionWidget extends StatefulWidget {
  const ThankYouForQuestionWidget({super.key});

  @override
  State<ThankYouForQuestionWidget> createState() =>
      _ThankYouForQuestionWidgetState();
}

class _ThankYouForQuestionWidgetState extends State<ThankYouForQuestionWidget> {
  late ThankYouForQuestionModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ThankYouForQuestionModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'ThankYouForQuestion'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('THANK_YOU_FOR_QUESTION_ThankYouForQuesti');
      logFirebaseEvent('ThankYouForQuestion_backend_call');

      await currentUserReference!.update({
        ...mapToFirestore(
          {
            'karma': FieldValue.increment(0.5),
          },
        ),
      });
      logFirebaseEvent('ThankYouForQuestion_alert_dialog');
      await showDialog(
        context: context,
        builder: (dialogContext) {
          return Dialog(
            elevation: 0,
            insetPadding: EdgeInsets.zero,
            backgroundColor: Colors.transparent,
            alignment: AlignmentDirectional(0.0, 0.0)
                .resolve(Directionality.of(context)),
            child: WebViewAware(
              child: GestureDetector(
                onTap: () => _model.unfocusNode.canRequestFocus
                    ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                    : FocusScope.of(context).unfocus(),
                child: KarmaPlusDialogWidget(
                  karmaPoints: 0.5,
                ),
              ),
            ),
          );
        },
      ).then((value) => setState(() {}));
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) => GestureDetector(
        onTap: () => _model.unfocusNode.canRequestFocus
            ? FocusScope.of(context).requestFocus(_model.unfocusNode)
            : FocusScope.of(context).unfocus(),
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          body: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                  alignment: AlignmentDirectional(1.0, -1.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      logFirebaseEvent(
                          'THANK_YOU_FOR_QUESTION_Container_hmd3n14');
                      logFirebaseEvent('Container_navigate_to');

                      context.pushNamed('LatestInterviewQuestions');
                    },
                    child: Container(
                      decoration: BoxDecoration(),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            10.0, 10.0, 0.0, 10.0),
                        child: Icon(
                          FFIcons.kxmark,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 24.0,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(0.0),
                    child: Image.asset(
                      'assets/images/thx.webp',
                      height: 300.0,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 33.0, 0.0, 0.0),
                  child: Text(
                    'Thank you!!!',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).headlineLarge,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 33.0, 0.0, 0.0),
                  child: Text(
                    ' We appreciate your contribution to our community! ',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).headlineMedium.override(
                          fontFamily: 'Sofia Pro',
                          color: FlutterFlowTheme.of(context).accent3,
                          useGoogleFonts: false,
                          lineHeight: 1.16,
                        ),
                  ),
                ),
              ]
                  .addToStart(SizedBox(height: 50.0))
                  .addToEnd(SizedBox(height: 50.0)),
            ),
          ),
        ),
      ),
    );
  }
}
