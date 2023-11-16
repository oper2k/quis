import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/karma_plus_dialog_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'thank_you_for_subscription_model.dart';
export 'thank_you_for_subscription_model.dart';

class ThankYouForSubscriptionWidget extends StatefulWidget {
  const ThankYouForSubscriptionWidget({Key? key}) : super(key: key);

  @override
  _ThankYouForSubscriptionWidgetState createState() =>
      _ThankYouForSubscriptionWidgetState();
}

class _ThankYouForSubscriptionWidgetState
    extends State<ThankYouForSubscriptionWidget> {
  late ThankYouForSubscriptionModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ThankYouForSubscriptionModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await currentUserReference!.update({
        ...mapToFirestore(
          {
            'karma': FieldValue.increment(2.0),
          },
        ),
      });
      await showAlignedDialog(
        context: context,
        isGlobal: true,
        avoidOverflow: false,
        targetAnchor:
            AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
        followerAnchor:
            AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
        builder: (dialogContext) {
          return Material(
            color: Colors.transparent,
            child: WebViewAware(
                child: GestureDetector(
              onTap: () => _model.unfocusNode.canRequestFocus
                  ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                  : FocusScope.of(context).unfocus(),
              child: KarmaPlusDialogWidget(
                karmaPoints: 2.0,
              ),
            )),
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
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

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
                  alignment: AlignmentDirectional(1.00, -1.00),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
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
                    'Thanks for joining Quis! \n',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).headlineLarge,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 33.0, 0.0, 0.0),
                  child: Text(
                    'We\'re so excited to help you land your dream job.',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).headlineSmall.override(
                          fontFamily: 'Sofia Pro',
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
