import '/components/onboarding_list_check_item_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'onboarding08_model.dart';
export 'onboarding08_model.dart';

class Onboarding08Widget extends StatefulWidget {
  const Onboarding08Widget({super.key});

  @override
  State<Onboarding08Widget> createState() => _Onboarding08WidgetState();
}

class _Onboarding08WidgetState extends State<Onboarding08Widget> {
  late Onboarding08Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Onboarding08Model());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'Onboarding08'});
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
                  logFirebaseEvent('ONBOARDING08_Container_p00b608u_ON_TAP');
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
              mainAxisSize: MainAxisSize.min,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(0.0),
                  child: Image.asset(
                    'assets/images/NEWOnb06.webp',
                    width: 200.0,
                    fit: BoxFit.contain,
                  ),
                ),
                const Spacer(),
                Text(
                  'Got it!',
                  style: FlutterFlowTheme.of(context).displayMedium.override(
                        fontFamily: 'Sofia Pro',
                        color: FlutterFlowTheme.of(context).blueLink,
                        fontWeight: FontWeight.w500,
                        useGoogleFonts: false,
                      ),
                ),
                const Spacer(),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    wrapWithModel(
                      model: _model.onboardingListCheckItemModel1,
                      updateCallback: () => setState(() {}),
                      child: const OnboardingListCheckItemWidget(
                        text:
                            'Learn everything about signals HR use to evaluate job candidates',
                      ),
                    ),
                    wrapWithModel(
                      model: _model.onboardingListCheckItemModel2,
                      updateCallback: () => setState(() {}),
                      child: const OnboardingListCheckItemWidget(
                        text: 'Get to know what Recruters will ask you',
                      ),
                    ),
                    wrapWithModel(
                      model: _model.onboardingListCheckItemModel3,
                      updateCallback: () => setState(() {}),
                      child: const OnboardingListCheckItemWidget(
                        text: 'Practice and polish yours answers',
                      ),
                    ),
                    wrapWithModel(
                      model: _model.onboardingListCheckItemModel4,
                      updateCallback: () => setState(() {}),
                      child: const OnboardingListCheckItemWidget(
                        text: 'Boost confidence and negotiating skills',
                      ),
                    ),
                    wrapWithModel(
                      model: _model.onboardingListCheckItemModel5,
                      updateCallback: () => setState(() {}),
                      child: const OnboardingListCheckItemWidget(
                        text: 'Get CV feedback from team of Experts',
                      ),
                    ),
                    wrapWithModel(
                      model: _model.onboardingListCheckItemModel6,
                      updateCallback: () => setState(() {}),
                      child: const OnboardingListCheckItemWidget(
                        text: 'Get Recommended by a large referral network',
                      ),
                    ),
                  ].divide(const SizedBox(height: 20.0)),
                ),
                const Spacer(flex: 2),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      logFirebaseEvent('ONBOARDING08_PAGE_CONTINUE_BTN_ON_TAP');
                      logFirebaseEvent('Button_navigate_to');

                      context.pushNamed('Onboarding09experienceYears');
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
