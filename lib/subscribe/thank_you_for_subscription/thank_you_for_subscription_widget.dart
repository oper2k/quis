import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/karma_plus_dialog_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'thank_you_for_subscription_model.dart';
export 'thank_you_for_subscription_model.dart';

class ThankYouForSubscriptionWidget extends StatefulWidget {
  const ThankYouForSubscriptionWidget({
    super.key,
    bool? isInOnboarding,
  }) : isInOnboarding = isInOnboarding ?? false;

  final bool isInOnboarding;

  @override
  State<ThankYouForSubscriptionWidget> createState() =>
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

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'ThankYouForSubscription'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('THANK_YOU_FOR_SUBSCRIPTION_ThankYouForSu');
      logFirebaseEvent('ThankYouForSubscription_backend_call');

      await currentUserReference!.update({
        ...mapToFirestore(
          {
            'karma': FieldValue.increment(2.0),
          },
        ),
      });
      logFirebaseEvent('ThankYouForSubscription_alert_dialog');
      await showDialog(
        context: context,
        builder: (dialogContext) {
          return Dialog(
            elevation: 0,
            insetPadding: EdgeInsets.zero,
            backgroundColor: Colors.transparent,
            alignment: const AlignmentDirectional(0.0, 0.0)
                .resolve(Directionality.of(context)),
            child: WebViewAware(
              child: GestureDetector(
                onTap: () => _model.unfocusNode.canRequestFocus
                    ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                    : FocusScope.of(context).unfocus(),
                child: const KarmaPlusDialogWidget(
                  karmaPoints: 2.0,
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
            padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                  alignment: const AlignmentDirectional(1.0, -1.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      logFirebaseEvent(
                          'THANK_YOU_FOR_SUBSCRIPTION_Container_d00');
                      if (widget.isInOnboarding) {
                        logFirebaseEvent('Container_navigate_to');

                        context.goNamed('Onboarding20afterPricing');
                      } else {
                        logFirebaseEvent('Container_navigate_to');

                        context.goNamed('MyProfile');
                      }
                    },
                    child: Container(
                      decoration: const BoxDecoration(),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
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
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
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
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 33.0, 0.0, 0.0),
                  child: Text(
                    'Thanks for joining Quis! \n',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).headlineLarge,
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 33.0, 0.0, 0.0),
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
                  .addToStart(const SizedBox(height: 50.0))
                  .addToEnd(const SizedBox(height: 50.0)),
            ),
          ),
        ),
      ),
    );
  }
}
