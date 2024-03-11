import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/revenue_cat_util.dart' as revenue_cat;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'onboarding20after_pricing_model.dart';
export 'onboarding20after_pricing_model.dart';

class Onboarding20afterPricingWidget extends StatefulWidget {
  const Onboarding20afterPricingWidget({super.key});

  @override
  State<Onboarding20afterPricingWidget> createState() =>
      _Onboarding20afterPricingWidgetState();
}

class _Onboarding20afterPricingWidgetState
    extends State<Onboarding20afterPricingWidget> {
  late Onboarding20afterPricingModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Onboarding20afterPricingModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'Onboarding20afterPricing'});
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
        backgroundColor: FlutterFlowTheme.of(context).primary,
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Spacer(),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(0.0),
                    child: Image.asset(
                      'assets/images/Onb17.webp',
                      width: 300.0,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Text(
                  'You are all set!',
                  style: FlutterFlowTheme.of(context).displayMedium.override(
                        fontFamily: 'Sofia Pro',
                        color: FlutterFlowTheme.of(context).info,
                        useGoogleFonts: false,
                      ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 18.0, 0.0, 0.0),
                  child: Text(
                    'Let’s start with a couple of questions to help us personalize your experience',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).titleMedium,
                  ),
                ),
                Spacer(flex: 2),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      logFirebaseEvent(
                          'ONBOARDING20AFTER_PRICING_OKAY,_LET’S_GO');
                      if (revenue_cat.activeEntitlementIds
                          .contains(FFAppState().entitlementID)) {
                        logFirebaseEvent('Button_navigate_to');

                        context.pushNamed('Home');
                      } else {
                        logFirebaseEvent('Button_navigate_to');

                        context.pushNamed('Onboarding21gift');
                      }
                    },
                    text: 'Okay, let’s go!',
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 52.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).white,
                      textStyle:
                          FlutterFlowTheme.of(context).headlineLarge.override(
                                fontFamily: 'Sofia Pro',
                                color: FlutterFlowTheme.of(context).primary,
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
