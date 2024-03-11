import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/subscribe/pricing_option/pricing_option_widget.dart';
import '/flutter_flow/revenue_cat_util.dart' as revenue_cat;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'pricing_model.dart';
export 'pricing_model.dart';

class PricingWidget extends StatefulWidget {
  const PricingWidget({
    super.key,
    bool? isInOnboarding,
    required this.offers,
  }) : this.isInOnboarding = isInOnboarding ?? false;

  final bool isInOnboarding;
  final PaywallPrice? offers;

  @override
  State<PricingWidget> createState() => _PricingWidgetState();
}

class _PricingWidgetState extends State<PricingWidget>
    with TickerProviderStateMixin {
  late PricingModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'containerOnActionTriggerAnimation': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 300.ms,
          begin: Offset(0.0, 0.0),
          end: Offset(0.0, -200.0),
        ),
      ],
    ),
    'pricingOptionOnActionTriggerAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        VisibilityEffect(duration: 50.ms),
        ScaleEffect(
          curve: Curves.easeOut,
          delay: 50.ms,
          duration: 300.ms,
          begin: Offset(0.0, 0.0),
          end: Offset(1.0, 1.0),
        ),
        MoveEffect(
          curve: Curves.easeOut,
          delay: 50.ms,
          duration: 300.ms,
          begin: Offset(300.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 50.ms,
          duration: 200.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'pricingOptionOnActionTriggerAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        VisibilityEffect(duration: 100.ms),
        ScaleEffect(
          curve: Curves.easeOut,
          delay: 100.ms,
          duration: 300.ms,
          begin: Offset(0.0, 0.0),
          end: Offset(1.0, 1.0),
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 100.ms,
          duration: 300.ms,
          begin: Offset(-300.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 100.ms,
          duration: 200.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PricingModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Pricing'});
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
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
        backgroundColor: FlutterFlowTheme.of(context).secondary,
        body: Stack(
          children: [
            if (widget.offers == PaywallPrice.standard)
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    'assets/images/Quis_Grey_paywall.webp',
                    width: double.infinity,
                    height: 300.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            if (widget.offers != PaywallPrice.standard)
              Align(
                alignment: AlignmentDirectional(0.0, -1.02),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    'assets/images/paywall1.webp',
                    width: double.infinity,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Align(
                    alignment: AlignmentDirectional(-1.0, -1.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        logFirebaseEvent(
                            'PRICING_PAGE_Container_baw62k28_ON_TAP');
                        if (widget.isInOnboarding) {
                          logFirebaseEvent('Container_navigate_to');

                          context.pushNamed('Onboarding20afterPricing');
                        } else {
                          logFirebaseEvent('Container_navigate_back');
                          context.safePop();
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(),
                        child: Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Icon(
                            FFIcons.kcross,
                            color: FlutterFlowTheme.of(context).info,
                            size: 24.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Builder(
                    builder: (context) {
                      if (widget.offers == PaywallPrice.off25) {
                        return Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 10.0, 0.0, 0.0),
                          child: Text(
                            'You\'ve got an offer! \nSave 25% off, don\'t miss out!',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .displayMedium
                                .override(
                                  fontFamily: 'Sofia Pro',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  fontWeight: FontWeight.w500,
                                  useGoogleFonts: false,
                                ),
                          ),
                        );
                      } else if (widget.offers == PaywallPrice.off50) {
                        return Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 10.0, 0.0, 0.0),
                          child: Text(
                            'Your one-time offer!\n Save 50%!',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .displayMedium
                                .override(
                                  fontFamily: 'Sofia Pro',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  fontWeight: FontWeight.w500,
                                  useGoogleFonts: false,
                                ),
                          ),
                        );
                      } else {
                        return Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 10.0, 0.0, 0.0),
                          child: Text(
                            'Choose your plan',
                            style: FlutterFlowTheme.of(context)
                                .displayMedium
                                .override(
                                  fontFamily: 'Sofia Pro',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  useGoogleFonts: false,
                                ),
                          ),
                        );
                      }
                    },
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Icon(
                              FFIcons.kdoc1,
                              color: FlutterFlowTheme.of(context).info,
                              size: 20.0,
                            ),
                            Expanded(
                              child: Text(
                                'No Paywalls ',
                                style: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                      fontFamily: 'Sofia Pro',
                                      useGoogleFonts: false,
                                      lineHeight: 1.2,
                                    ),
                              ),
                            ),
                          ].divide(SizedBox(width: 14.0)),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              FFIcons.kocticonBook24,
                              color: FlutterFlowTheme.of(context).info,
                              size: 20.0,
                            ),
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Unlimited Access',
                                    style: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .override(
                                          fontFamily: 'Sofia Pro',
                                          useGoogleFonts: false,
                                          lineHeight: 1.2,
                                        ),
                                  ),
                                  Text(
                                    'Company Profiles, Expert Video Answers and the Latest Interview Questions',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Sofia Pro',
                                          color:
                                              FlutterFlowTheme.of(context).info,
                                          fontWeight: FontWeight.w300,
                                          fontStyle: FontStyle.italic,
                                          useGoogleFonts: false,
                                          lineHeight: 1.42,
                                        ),
                                  ),
                                ].divide(SizedBox(height: 8.0)),
                              ),
                            ),
                          ].divide(SizedBox(width: 14.0)),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              FFIcons.ksolarUserOutline,
                              color: FlutterFlowTheme.of(context).info,
                              size: 20.0,
                            ),
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Job Referral and CV Feedback',
                                    style: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .override(
                                          fontFamily: 'Sofia Pro',
                                          useGoogleFonts: false,
                                          lineHeight: 1.2,
                                        ),
                                  ),
                                  Text(
                                    'Your CV will be reviewed by us and seen by 300+ Referral Network who work in Aviation and F&B',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Sofia Pro',
                                          color:
                                              FlutterFlowTheme.of(context).info,
                                          fontWeight: FontWeight.w300,
                                          fontStyle: FontStyle.italic,
                                          useGoogleFonts: false,
                                          lineHeight: 1.42,
                                        ),
                                  ),
                                ].divide(SizedBox(height: 8.0)),
                              ),
                            ),
                          ].divide(SizedBox(width: 14.0)),
                        ),
                      ].divide(SizedBox(height: 10.0)),
                    ),
                  ),
                  Spacer(),
                  Container(
                    width: double.infinity,
                    height: 100.0,
                    child: CarouselSlider(
                      items: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            RatingBar.builder(
                              onRatingUpdate: (newValue) => setState(
                                  () => _model.ratingBarValue1 = newValue),
                              itemBuilder: (context, index) => Icon(
                                Icons.star_rounded,
                                color: FlutterFlowTheme.of(context).orange,
                              ),
                              direction: Axis.horizontal,
                              initialRating: _model.ratingBarValue1 ??= 5.0,
                              unratedColor:
                                  FlutterFlowTheme.of(context).accent3,
                              itemCount: 5,
                              itemSize: 20.0,
                              glowColor: FlutterFlowTheme.of(context).orange,
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 12.0, 0.0, 0.0),
                              child: Text(
                                '“Lorem ipsum dolor sit amet consectetur. Ullamcorper aliquet eu viverra massa commodo cum ullamcorper.”',
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context).titleSmall,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            RatingBar.builder(
                              onRatingUpdate: (newValue) => setState(
                                  () => _model.ratingBarValue2 = newValue),
                              itemBuilder: (context, index) => Icon(
                                Icons.star_rounded,
                                color: FlutterFlowTheme.of(context).orange,
                              ),
                              direction: Axis.horizontal,
                              initialRating: _model.ratingBarValue2 ??= 4.0,
                              unratedColor:
                                  FlutterFlowTheme.of(context).accent3,
                              itemCount: 5,
                              itemSize: 20.0,
                              glowColor: FlutterFlowTheme.of(context).orange,
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 12.0, 0.0, 0.0),
                              child: Text(
                                '“Lorem ipsum dolor sit amet consectetur. Ullamcorper aliquet eu viverra massa commodo cum ullamcorper.”',
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context).titleSmall,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            RatingBar.builder(
                              onRatingUpdate: (newValue) => setState(
                                  () => _model.ratingBarValue3 = newValue),
                              itemBuilder: (context, index) => Icon(
                                Icons.star_rounded,
                                color: FlutterFlowTheme.of(context).orange,
                              ),
                              direction: Axis.horizontal,
                              initialRating: _model.ratingBarValue3 ??= 3.0,
                              unratedColor:
                                  FlutterFlowTheme.of(context).accent3,
                              itemCount: 5,
                              itemSize: 20.0,
                              glowColor: FlutterFlowTheme.of(context).orange,
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 12.0, 0.0, 0.0),
                              child: Text(
                                '“Lorem ipsum dolor sit amet consectetur. Ullamcorper aliquet eu viverra massa commodo cum ullamcorper.”',
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context).titleSmall,
                              ),
                            ),
                          ],
                        ),
                      ],
                      carouselController: _model.carouselController ??=
                          CarouselController(),
                      options: CarouselOptions(
                        initialPage: 0,
                        viewportFraction: 1.0,
                        disableCenter: true,
                        enlargeCenterPage: true,
                        enlargeFactor: 0.3,
                        enableInfiniteScroll: true,
                        scrollDirection: Axis.horizontal,
                        autoPlay: true,
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        autoPlayInterval: Duration(milliseconds: (800 + 4000)),
                        autoPlayCurve: Curves.linear,
                        pauseAutoPlayInFiniteScroll: true,
                        onPageChanged: (index, _) =>
                            _model.carouselCurrentIndex = index,
                      ),
                    ),
                  ),
                  Spacer(flex: 3),
                ].addToStart(SizedBox(height: 40.0)),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(
                  0.0,
                  valueOrDefault<double>(
                    -0.000789 * MediaQuery.sizeOf(context).height + 1.92065,
                    0.0,
                  )),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primary,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(0.0),
                    bottomRight: Radius.circular(0.0),
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Builder(
                        builder: (context) {
                          if (widget.offers == PaywallPrice.off25) {
                            return InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent(
                                    'PRICING_pricingOption3months25off_ON_TAP');
                                logFirebaseEvent(
                                    'pricingOption3months25off_update_page_st');
                                setState(() {
                                  _model.pickedOption =
                                      PaywallPickedOption.month3;
                                });
                              },
                              child: wrapWithModel(
                                model: _model.pricingOption3months25offModel,
                                updateCallback: () => setState(() {}),
                                child: PricingOptionWidget(
                                  title: '3 Month - SAVE 25%',
                                  text: '18 USD/3 months (6 USD/mo)',
                                  isTrial: true,
                                  trialText: '7-DAY FREE TRIAL',
                                  isPicked: _model.pickedOption ==
                                      PaywallPickedOption.month3,
                                ),
                              ),
                            );
                          } else if (widget.offers == PaywallPrice.off50) {
                            return InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent(
                                    'PRICING_pricingOption3months50off_ON_TAP');
                                logFirebaseEvent(
                                    'pricingOption3months50off_update_page_st');
                                setState(() {
                                  _model.pickedOption =
                                      PaywallPickedOption.month3;
                                });
                              },
                              child: wrapWithModel(
                                model: _model.pricingOption3months50offModel,
                                updateCallback: () => setState(() {}),
                                child: PricingOptionWidget(
                                  title: '3 Month SAVE 50%',
                                  text: '12.5 USD/3 months (4.2 USD/mo)',
                                  isTrial: true,
                                  trialText: '7-DAY FREE TRIAL',
                                  isPicked: _model.pickedOption ==
                                      PaywallPickedOption.month3,
                                ),
                              ),
                            );
                          } else {
                            return InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent(
                                    'PRICING_pricingOption3monthsStandard_ON_');
                                logFirebaseEvent(
                                    'pricingOption3monthsStandard_update_page');
                                setState(() {
                                  _model.pickedOption =
                                      PaywallPickedOption.month3;
                                });
                              },
                              child: wrapWithModel(
                                model: _model.pricingOption3monthsStandardModel,
                                updateCallback: () => setState(() {}),
                                child: PricingOptionWidget(
                                  title: '3 Months',
                                  text: '24.99 USD/3 months (8.33 USD/mo) ',
                                  isTrial: true,
                                  trialText: '7-DAY FREE TRIAL',
                                  isPicked: _model.pickedOption ==
                                      PaywallPickedOption.month3,
                                ),
                              ),
                            );
                          }
                        },
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent(
                              'PRICING_PAGE_pricingOption1month_ON_TAP');
                          logFirebaseEvent(
                              'pricingOption1month_update_page_state');
                          setState(() {
                            _model.pickedOption = PaywallPickedOption.month1;
                          });
                        },
                        child: wrapWithModel(
                          model: _model.pricingOption1monthModel,
                          updateCallback: () => setState(() {}),
                          child: PricingOptionWidget(
                            title: '1 Month',
                            text: '9.99 USD/mo',
                            isTrial: false,
                            isPicked: _model.pickedOption ==
                                PaywallPickedOption.month1,
                          ),
                        ),
                      ).animateOnActionTrigger(
                        animationsMap[
                            'pricingOptionOnActionTriggerAnimation1']!,
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent(
                              'PRICING_PAGE_pricingOption1week_ON_TAP');
                          logFirebaseEvent(
                              'pricingOption1week_update_page_state');
                          setState(() {
                            _model.pickedOption = PaywallPickedOption.week1;
                          });
                        },
                        child: wrapWithModel(
                          model: _model.pricingOption1weekModel,
                          updateCallback: () => setState(() {}),
                          child: PricingOptionWidget(
                            title: '1 Week',
                            text: '4.99 USD/mo',
                            isTrial: false,
                            isPicked: _model.pickedOption ==
                                PaywallPickedOption.week1,
                          ),
                        ),
                      ).animateOnActionTrigger(
                        animationsMap[
                            'pricingOptionOnActionTriggerAnimation2']!,
                      ),
                    ]
                        .divide(SizedBox(height: 10.0))
                        .addToStart(SizedBox(height: 16.0))
                        .addToEnd(SizedBox(height: 40.0)),
                  ),
                ),
              ).animateOnActionTrigger(
                animationsMap['containerOnActionTriggerAnimation']!,
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0.0, 1.0),
              child: Container(
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primary,
                ),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 40.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      FFButtonWidget(
                        onPressed: () async {
                          logFirebaseEvent(
                              'PRICING_TRY_FREE_&_SUBSCRIBE_BTN_ON_TAP');
                          var _shouldSetState = false;
                          if (_model.pickedOption ==
                              PaywallPickedOption.month1) {
                            logFirebaseEvent('Button_revenue_cat');
                            _model.monthlysubscriptionOutput = await revenue_cat
                                .purchasePackage('monthlysubscription');
                            _shouldSetState = true;
                            if (!_model.monthlysubscriptionOutput!) {
                              logFirebaseEvent('Button_alert_dialog');
                              await showDialog(
                                context: context,
                                builder: (alertDialogContext) {
                                  return WebViewAware(
                                    child: AlertDialog(
                                      title: Text('Error'),
                                      content: Text('Payment failed'),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(alertDialogContext),
                                          child: Text('Ok'),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                              if (_shouldSetState) setState(() {});
                              return;
                            }
                          } else if (_model.pickedOption ==
                              PaywallPickedOption.week1) {
                            logFirebaseEvent('Button_revenue_cat');
                            _model.weeklysubscriptionOutput = await revenue_cat
                                .purchasePackage('yearlysubscription');
                            _shouldSetState = true;
                            if (!_model.weeklysubscriptionOutput!) {
                              logFirebaseEvent('Button_alert_dialog');
                              await showDialog(
                                context: context,
                                builder: (alertDialogContext) {
                                  return WebViewAware(
                                    child: AlertDialog(
                                      title: Text('Error'),
                                      content: Text('Payment failed'),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(alertDialogContext),
                                          child: Text('Ok'),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                              if (_shouldSetState) setState(() {});
                              return;
                            }
                          } else if (_model.pickedOption ==
                              PaywallPickedOption.month3) {
                            if (widget.offers == PaywallPrice.off25) {
                              logFirebaseEvent('Button_revenue_cat');
                              _model.months3Subscription25OffOutput =
                                  await revenue_cat.purchasePackage(
                                      '3MonthsSubscription25Off');
                              _shouldSetState = true;
                              if (!_model.months3Subscription25OffOutput!) {
                                logFirebaseEvent('Button_alert_dialog');
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return WebViewAware(
                                      child: AlertDialog(
                                        title: Text('Error'),
                                        content: Text('Payment failed'),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext),
                                            child: Text('Ok'),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                );
                                if (_shouldSetState) setState(() {});
                                return;
                              }
                            } else if (widget.offers == PaywallPrice.off50) {
                              logFirebaseEvent('Button_revenue_cat');
                              _model.months3Subscription50OffOutput =
                                  await revenue_cat.purchasePackage(
                                      '3MonthsSubscription50Off');
                              _shouldSetState = true;
                              if (!_model.months3Subscription50OffOutput!) {
                                logFirebaseEvent('Button_alert_dialog');
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return WebViewAware(
                                      child: AlertDialog(
                                        title: Text('Error'),
                                        content: Text('Payment failed'),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext),
                                            child: Text('Ok'),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                );
                                if (_shouldSetState) setState(() {});
                                return;
                              }
                            } else {
                              logFirebaseEvent('Button_revenue_cat');
                              _model.months3SubscriptionOutput =
                                  await revenue_cat.purchasePackage(
                                      '3MonthsSubscriptionStandard');
                              _shouldSetState = true;
                              if (!_model.months3SubscriptionOutput!) {
                                logFirebaseEvent('Button_alert_dialog');
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return WebViewAware(
                                      child: AlertDialog(
                                        title: Text('Error'),
                                        content: Text('Payment failed'),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext),
                                            child: Text('Ok'),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                );
                                if (_shouldSetState) setState(() {});
                                return;
                              }
                            }
                          } else {
                            if (_shouldSetState) setState(() {});
                            return;
                          }

                          logFirebaseEvent('Button_navigate_to');
                          if (Navigator.of(context).canPop()) {
                            context.pop();
                          }
                          context.pushNamed('ThankYouForSubscription');

                          if (_shouldSetState) setState(() {});
                        },
                        text: 'Try Free & Subscribe',
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 52.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).white,
                          textStyle: FlutterFlowTheme.of(context)
                              .headlineLarge
                              .override(
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
                      Row(
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
                                  'PRICING_PAGE_Container_9bupzj2o_ON_TAP');
                              if (_model.isOpen) {
                                logFirebaseEvent('Container_widget_animation');
                                if (animationsMap[
                                        'pricingOptionOnActionTriggerAnimation2'] !=
                                    null) {
                                  animationsMap[
                                          'pricingOptionOnActionTriggerAnimation2']!
                                      .controller
                                      .reverse();
                                }
                                logFirebaseEvent('Container_widget_animation');
                                if (animationsMap[
                                        'pricingOptionOnActionTriggerAnimation1'] !=
                                    null) {
                                  animationsMap[
                                          'pricingOptionOnActionTriggerAnimation1']!
                                      .controller
                                      .reverse();
                                }
                                logFirebaseEvent('Container_widget_animation');
                                if (animationsMap[
                                        'containerOnActionTriggerAnimation'] !=
                                    null) {
                                  animationsMap[
                                          'containerOnActionTriggerAnimation']!
                                      .controller
                                      .reverse();
                                }
                                logFirebaseEvent('Container_update_page_state');
                                setState(() {
                                  _model.isOpen = false;
                                });
                              } else {
                                logFirebaseEvent('Container_widget_animation');
                                if (animationsMap[
                                        'containerOnActionTriggerAnimation'] !=
                                    null) {
                                  animationsMap[
                                          'containerOnActionTriggerAnimation']!
                                      .controller
                                      .forward();
                                }
                                logFirebaseEvent('Container_widget_animation');
                                if (animationsMap[
                                        'pricingOptionOnActionTriggerAnimation1'] !=
                                    null) {
                                  animationsMap[
                                          'pricingOptionOnActionTriggerAnimation1']!
                                      .controller
                                      .forward();
                                }
                                logFirebaseEvent('Container_widget_animation');
                                if (animationsMap[
                                        'pricingOptionOnActionTriggerAnimation2'] !=
                                    null) {
                                  animationsMap[
                                          'pricingOptionOnActionTriggerAnimation2']!
                                      .controller
                                      .forward();
                                }
                                logFirebaseEvent('Container_update_page_state');
                                setState(() {
                                  _model.isOpen = true;
                                });
                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(),
                              child: Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Text(
                                  'All plans',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Sofia Pro',
                                        color:
                                            FlutterFlowTheme.of(context).white,
                                        useGoogleFonts: false,
                                      ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(),
                            child: Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Text(
                                'Terms of Use ',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Sofia Pro',
                                      color: FlutterFlowTheme.of(context).white,
                                      useGoogleFonts: false,
                                    ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
