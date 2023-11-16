import '/components/feature_list_item_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/revenue_cat_util.dart' as revenue_cat;
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'pricing_model.dart';
export 'pricing_model.dart';

class PricingWidget extends StatefulWidget {
  const PricingWidget({
    Key? key,
    bool? isFirst,
  })  : this.isFirst = isFirst ?? false,
        super(key: key);

  final bool isFirst;

  @override
  _PricingWidgetState createState() => _PricingWidgetState();
}

class _PricingWidgetState extends State<PricingWidget> {
  late PricingModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PricingModel());
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

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(0.0),
              child: Image.asset(
                'assets/images/Group_51453.webp',
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 40.0,
                        height: 40.0,
                        decoration: BoxDecoration(),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(0.0),
                        child: Image.asset(
                          'assets/images/QUIS_-_logo_1.webp',
                          width: 50.0,
                          fit: BoxFit.contain,
                        ),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          if (widget.isFirst) {
                            context.pushNamed('Home');
                          } else {
                            context.safePop();
                          }
                        },
                        child: Container(
                          width: 40.0,
                          height: 40.0,
                          decoration: BoxDecoration(),
                          alignment: AlignmentDirectional(1.00, 1.00),
                          child: Icon(
                            FFIcons.kcross,
                            color: FlutterFlowTheme.of(context).white,
                            size: 24.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                  child: Text(
                    'Please select your pricing plan',
                    style: FlutterFlowTheme.of(context).headlineLarge.override(
                          fontFamily: 'Sofia Pro',
                          color: FlutterFlowTheme.of(context).white,
                          useGoogleFonts: false,
                        ),
                  ),
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                  child: Container(
                    width: double.infinity,
                    height: MediaQuery.sizeOf(context).height * 0.65,
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 15.0),
                          child: PageView(
                            controller: _model.pageViewController ??=
                                PageController(initialPage: 0),
                            scrollDirection: Axis.horizontal,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    38.0, 0.0, 38.0, 5.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          FlutterFlowTheme.of(context)
                                              .gradient2,
                                          FlutterFlowTheme.of(context)
                                              .aquaBreeze
                                        ],
                                        stops: [0.0, 1.0],
                                        begin: AlignmentDirectional(0.0, 1.0),
                                        end: AlignmentDirectional(0, -1.0),
                                      ),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          1.5, 1.5, 1.5, 1.5),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              Color(0xFFA4E8E0),
                                              Color(0xFF8FBECF)
                                            ],
                                            stops: [0.0, 1.0],
                                            begin: AlignmentDirectional(
                                                -0.64, -1.0),
                                            end:
                                                AlignmentDirectional(0.64, 1.0),
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.5),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  17.0, 10.0, 17.0, 0.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 20.0, 0.0, 0.0),
                                                child: Text(
                                                  'Premium (Monthly)',
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .displayMedium
                                                      .override(
                                                        fontFamily: 'Sofia Pro',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        useGoogleFonts: false,
                                                      ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 10.0, 0.0, 0.0),
                                                child: Container(
                                                  height: 88.0,
                                                  child: Stack(
                                                    children: [
                                                      Container(
                                                        width: double.infinity,
                                                        height: 70.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondary,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      11.0,
                                                                      11.0,
                                                                      11.0,
                                                                      11.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Text(
                                                                '1,8 AED/Day',
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .displayLarge,
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            3.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  '55 AED billed monthly',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Sofia Pro',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .white,
                                                                        fontSize:
                                                                            13.0,
                                                                        useGoogleFonts:
                                                                            false,
                                                                      ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.00, 1.00),
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                          child: Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              gradient:
                                                                  LinearGradient(
                                                                colors: [
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .gradient2,
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .aquaBreeze
                                                                ],
                                                                stops: [
                                                                  0.0,
                                                                  1.0
                                                                ],
                                                                begin:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        1.0),
                                                                end:
                                                                    AlignmentDirectional(
                                                                        0,
                                                                        -1.0),
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10.0),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          1.5,
                                                                          1.5,
                                                                          1.5,
                                                                          1.5),
                                                              child: Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .aquaBreeze,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.5),
                                                                ),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          13.0,
                                                                          3.0,
                                                                          13.0,
                                                                          3.0),
                                                                  child: Text(
                                                                    'Recommended',
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .headlineMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Sofia Pro',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).white,
                                                                          useGoogleFonts:
                                                                              false,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 5.0, 0.0, 0.0),
                                                  child: ListView(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                      0,
                                                      0,
                                                      0,
                                                      10.0,
                                                    ),
                                                    primary: false,
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    children: [
                                                      wrapWithModel(
                                                        model: _model
                                                            .featureListItemModel1,
                                                        updateCallback: () =>
                                                            setState(() {}),
                                                        child:
                                                            FeatureListItemWidget(
                                                          colorIcon:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .secondary,
                                                          colorText:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                          text:
                                                              'Unlimited Interview Practice ',
                                                        ),
                                                      ),
                                                      wrapWithModel(
                                                        model: _model
                                                            .featureListItemModel2,
                                                        updateCallback: () =>
                                                            setState(() {}),
                                                        child:
                                                            FeatureListItemWidget(
                                                          colorIcon:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .secondary,
                                                          colorText:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                          text:
                                                              'Unlimited Access to Expert Video Answers',
                                                        ),
                                                      ),
                                                      wrapWithModel(
                                                        model: _model
                                                            .featureListItemModel3,
                                                        updateCallback: () =>
                                                            setState(() {}),
                                                        child:
                                                            FeatureListItemWidget(
                                                          colorIcon:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .secondary,
                                                          colorText:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                          text:
                                                              'Unlimited Access to Latest Interview Questions (Top Companies)',
                                                        ),
                                                      ),
                                                      wrapWithModel(
                                                        model: _model
                                                            .featureListItemModel4,
                                                        updateCallback: () =>
                                                            setState(() {}),
                                                        child:
                                                            FeatureListItemWidget(
                                                          colorIcon:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .secondary,
                                                          colorText:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                          text:
                                                              'Referral Bonus Program ',
                                                        ),
                                                      ),
                                                      wrapWithModel(
                                                        model: _model
                                                            .featureListItemModel5,
                                                        updateCallback: () =>
                                                            setState(() {}),
                                                        child:
                                                            FeatureListItemWidget(
                                                          colorIcon:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .secondary,
                                                          colorText:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                          text:
                                                              'Job Referrals and Recommendation',
                                                        ),
                                                      ),
                                                      wrapWithModel(
                                                        model: _model
                                                            .featureListItemModel6,
                                                        updateCallback: () =>
                                                            setState(() {}),
                                                        child:
                                                            FeatureListItemWidget(
                                                          colorIcon:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .secondary,
                                                          colorText:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                          text:
                                                              'Top Company Guides',
                                                        ),
                                                      ),
                                                      wrapWithModel(
                                                        model: _model
                                                            .featureListItemModel7,
                                                        updateCallback: () =>
                                                            setState(() {}),
                                                        child:
                                                            FeatureListItemWidget(
                                                          colorIcon:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .secondary,
                                                          colorText:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                          text:
                                                              'Customer Support',
                                                        ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(height: () {
                                                      if (MediaQuery.sizeOf(
                                                                  context)
                                                              .height <=
                                                          700.0) {
                                                        return 5.0;
                                                      } else if (MediaQuery
                                                                  .sizeOf(
                                                                      context)
                                                              .height >=
                                                          900.0) {
                                                        return 18.0;
                                                      } else {
                                                        return 12.0;
                                                      }
                                                    }())),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    38.0, 0.0, 38.0, 5.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          FlutterFlowTheme.of(context)
                                              .gradient2,
                                          FlutterFlowTheme.of(context)
                                              .aquaBreeze
                                        ],
                                        stops: [0.0, 1.0],
                                        begin: AlignmentDirectional(0.0, 1.0),
                                        end: AlignmentDirectional(0, -1.0),
                                      ),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          1.5, 1.5, 1.5, 1.5),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              Color(0xFF62D7CA),
                                              Color(0xFF3C8BAB)
                                            ],
                                            stops: [0.0, 1.0],
                                            begin: AlignmentDirectional(
                                                -0.64, -1.0),
                                            end:
                                                AlignmentDirectional(0.64, 1.0),
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.5),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  17.0, 10.0, 17.0, 0.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 20.0, 0.0, 0.0),
                                                child: Text(
                                                  'Premium (Yearly)',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .displayMedium
                                                      .override(
                                                        fontFamily: 'Sofia Pro',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .white,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        useGoogleFonts: false,
                                                      ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 10.0, 0.0, 0.0),
                                                child: Container(
                                                  height: 88.0,
                                                  child: Stack(
                                                    children: [
                                                      Container(
                                                        width: double.infinity,
                                                        height: 70.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondary,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      11.0,
                                                                      11.0,
                                                                      11.0,
                                                                      11.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Text(
                                                                '1,1 AED/Day',
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .displayLarge,
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            3.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  '400 AED billed yearly',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Sofia Pro',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .white,
                                                                        fontSize:
                                                                            13.0,
                                                                        useGoogleFonts:
                                                                            false,
                                                                      ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.00, 1.00),
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                          child: Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              gradient:
                                                                  LinearGradient(
                                                                colors: [
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .gradient2,
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .aquaBreeze
                                                                ],
                                                                stops: [
                                                                  0.0,
                                                                  1.0
                                                                ],
                                                                begin:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        1.0),
                                                                end:
                                                                    AlignmentDirectional(
                                                                        0,
                                                                        -1.0),
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10.0),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          1.5,
                                                                          1.5,
                                                                          1.5,
                                                                          1.5),
                                                              child: Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .aquaBreeze,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.5),
                                                                ),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          13.0,
                                                                          3.0,
                                                                          13.0,
                                                                          3.0),
                                                                  child: Text(
                                                                    'Save 40%',
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .headlineMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Sofia Pro',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).white,
                                                                          useGoogleFonts:
                                                                              false,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 5.0, 0.0, 0.0),
                                                  child: ListView(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                      0,
                                                      0,
                                                      0,
                                                      10.0,
                                                    ),
                                                    primary: false,
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    children: [
                                                      wrapWithModel(
                                                        model: _model
                                                            .featureListItemModel8,
                                                        updateCallback: () =>
                                                            setState(() {}),
                                                        child:
                                                            FeatureListItemWidget(
                                                          colorIcon:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .white,
                                                          colorText:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .white,
                                                          text:
                                                              'Unlimited Interview Practice ',
                                                        ),
                                                      ),
                                                      wrapWithModel(
                                                        model: _model
                                                            .featureListItemModel9,
                                                        updateCallback: () =>
                                                            setState(() {}),
                                                        child:
                                                            FeatureListItemWidget(
                                                          colorIcon:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .white,
                                                          colorText:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .white,
                                                          text:
                                                              'Unlimited Access to Expert Video Answers',
                                                        ),
                                                      ),
                                                      wrapWithModel(
                                                        model: _model
                                                            .featureListItemModel10,
                                                        updateCallback: () =>
                                                            setState(() {}),
                                                        child:
                                                            FeatureListItemWidget(
                                                          colorIcon:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .white,
                                                          colorText:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .white,
                                                          text:
                                                              'Unlimited Access to Latest Interview Questions (Top Companies)',
                                                        ),
                                                      ),
                                                      wrapWithModel(
                                                        model: _model
                                                            .featureListItemModel11,
                                                        updateCallback: () =>
                                                            setState(() {}),
                                                        child:
                                                            FeatureListItemWidget(
                                                          colorIcon:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .white,
                                                          colorText:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .white,
                                                          text:
                                                              'Referral Bonus Program ',
                                                        ),
                                                      ),
                                                      wrapWithModel(
                                                        model: _model
                                                            .featureListItemModel12,
                                                        updateCallback: () =>
                                                            setState(() {}),
                                                        child:
                                                            FeatureListItemWidget(
                                                          colorIcon:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .white,
                                                          colorText:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .white,
                                                          text:
                                                              'Job Referrals and Recommendation',
                                                        ),
                                                      ),
                                                      wrapWithModel(
                                                        model: _model
                                                            .featureListItemModel13,
                                                        updateCallback: () =>
                                                            setState(() {}),
                                                        child:
                                                            FeatureListItemWidget(
                                                          colorIcon:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .white,
                                                          colorText:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .white,
                                                          text:
                                                              'Top Company Guides',
                                                        ),
                                                      ),
                                                      wrapWithModel(
                                                        model: _model
                                                            .featureListItemModel14,
                                                        updateCallback: () =>
                                                            setState(() {}),
                                                        child:
                                                            FeatureListItemWidget(
                                                          colorIcon:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .white,
                                                          colorText:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .white,
                                                          text:
                                                              'Customer Support',
                                                        ),
                                                      ),
                                                      wrapWithModel(
                                                        model: _model
                                                            .featureListItemModel15,
                                                        updateCallback: () =>
                                                            setState(() {}),
                                                        child:
                                                            FeatureListItemWidget(
                                                          colorIcon:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .white,
                                                          colorText:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .white,
                                                          text:
                                                              '12 Month Unlimited Access',
                                                        ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(height: () {
                                                      if (MediaQuery.sizeOf(
                                                                  context)
                                                              .height <=
                                                          700.0) {
                                                        return 5.0;
                                                      } else if (MediaQuery
                                                                  .sizeOf(
                                                                      context)
                                                              .height >=
                                                          900.0) {
                                                        return 18.0;
                                                      } else {
                                                        return 12.0;
                                                      }
                                                    }())),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    38.0, 0.0, 38.0, 5.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          FlutterFlowTheme.of(context)
                                              .gradient2,
                                          FlutterFlowTheme.of(context)
                                              .aquaBreeze
                                        ],
                                        stops: [0.0, 1.0],
                                        begin: AlignmentDirectional(0.0, 1.0),
                                        end: AlignmentDirectional(0, -1.0),
                                      ),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          1.5, 1.5, 1.5, 1.5),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              Color(0xFF62D7CA),
                                              Color(0xFF3C8BAB)
                                            ],
                                            stops: [0.0, 1.0],
                                            begin: AlignmentDirectional(
                                                -0.64, -1.0),
                                            end:
                                                AlignmentDirectional(0.64, 1.0),
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.5),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  17.0, 10.0, 17.0, 0.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 20.0, 0.0, 0.0),
                                                child: Text(
                                                  'One Time Payment',
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .displayMedium
                                                      .override(
                                                        fontFamily: 'Sofia Pro',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .white,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        useGoogleFonts: false,
                                                      ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 20.0, 0.0, 0.0),
                                                child: Container(
                                                  width: double.infinity,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondary,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                11.0,
                                                                11.0,
                                                                11.0,
                                                                11.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          '500 AED',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .displayLarge,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 20.0, 0.0, 0.0),
                                                  child: ListView(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                      0,
                                                      0,
                                                      0,
                                                      10.0,
                                                    ),
                                                    primary: false,
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    children: [
                                                      wrapWithModel(
                                                        model: _model
                                                            .featureListItemModel16,
                                                        updateCallback: () =>
                                                            setState(() {}),
                                                        child:
                                                            FeatureListItemWidget(
                                                          colorIcon:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .white,
                                                          colorText:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .white,
                                                          text:
                                                              'Unlimited Interview Practice ',
                                                        ),
                                                      ),
                                                      wrapWithModel(
                                                        model: _model
                                                            .featureListItemModel17,
                                                        updateCallback: () =>
                                                            setState(() {}),
                                                        child:
                                                            FeatureListItemWidget(
                                                          colorIcon:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .white,
                                                          colorText:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .white,
                                                          text:
                                                              'Unlimited Access to Expert Video Answers',
                                                        ),
                                                      ),
                                                      wrapWithModel(
                                                        model: _model
                                                            .featureListItemModel18,
                                                        updateCallback: () =>
                                                            setState(() {}),
                                                        child:
                                                            FeatureListItemWidget(
                                                          colorIcon:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .white,
                                                          colorText:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .white,
                                                          text:
                                                              'Unlimited Access to Latest Interview Questions (Top Companies)',
                                                        ),
                                                      ),
                                                      wrapWithModel(
                                                        model: _model
                                                            .featureListItemModel19,
                                                        updateCallback: () =>
                                                            setState(() {}),
                                                        child:
                                                            FeatureListItemWidget(
                                                          colorIcon:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .white,
                                                          colorText:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .white,
                                                          text:
                                                              'Referral Bonus Program ',
                                                        ),
                                                      ),
                                                      wrapWithModel(
                                                        model: _model
                                                            .featureListItemModel20,
                                                        updateCallback: () =>
                                                            setState(() {}),
                                                        child:
                                                            FeatureListItemWidget(
                                                          colorIcon:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .white,
                                                          colorText:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .white,
                                                          text:
                                                              'Job Referrals and Recommendation',
                                                        ),
                                                      ),
                                                      wrapWithModel(
                                                        model: _model
                                                            .featureListItemModel21,
                                                        updateCallback: () =>
                                                            setState(() {}),
                                                        child:
                                                            FeatureListItemWidget(
                                                          colorIcon:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .white,
                                                          colorText:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .white,
                                                          text:
                                                              'Top Company Guides',
                                                        ),
                                                      ),
                                                      wrapWithModel(
                                                        model: _model
                                                            .featureListItemModel22,
                                                        updateCallback: () =>
                                                            setState(() {}),
                                                        child:
                                                            FeatureListItemWidget(
                                                          colorIcon:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .white,
                                                          colorText:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .white,
                                                          text:
                                                              'Customer Support',
                                                        ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(height: () {
                                                      if (MediaQuery.sizeOf(
                                                                  context)
                                                              .height <=
                                                          700.0) {
                                                        return 5.0;
                                                      } else if (MediaQuery
                                                                  .sizeOf(
                                                                      context)
                                                              .height >=
                                                          900.0) {
                                                        return 18.0;
                                                      } else {
                                                        return 12.0;
                                                      }
                                                    }())),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.00, 1.00),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 25.0, 0.0, 0.0),
                            child: smooth_page_indicator.SmoothPageIndicator(
                              controller: _model.pageViewController ??=
                                  PageController(initialPage: 0),
                              count: 3,
                              axisDirection: Axis.horizontal,
                              onDotClicked: (i) async {
                                await _model.pageViewController!.animateToPage(
                                  i,
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.ease,
                                );
                              },
                              effect: smooth_page_indicator.SlideEffect(
                                spacing: 8.0,
                                radius: 16.0,
                                dotWidth: 10.5,
                                dotHeight: 10.5,
                                dotColor: FlutterFlowTheme.of(context).accent2,
                                activeDotColor:
                                    FlutterFlowTheme.of(context).primary,
                                paintStyle: PaintingStyle.fill,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Spacer(),
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    if (widget.isFirst) {
                      context.pushNamed('Home');
                    } else {
                      context.safePop();
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          10.0, 10.0, 10.0, 10.0),
                      child: Text(
                        'No, I want to stay freemium to try Quis',
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Sofia Pro',
                              color: FlutterFlowTheme.of(context).white,
                              fontWeight: FontWeight.w300,
                              decoration: TextDecoration.underline,
                              useGoogleFonts: false,
                              lineHeight: 1.16,
                            ),
                      ),
                    ),
                  ),
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      var _shouldSetState = false;
                      if (_model.pageViewCurrentIndex == 0) {
                        _model.monthlysubscriptionOutput = await revenue_cat
                            .purchasePackage('monthlysubscription');
                        _shouldSetState = true;
                        if (!_model.monthlysubscriptionOutput!) {
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
                              ));
                            },
                          );
                          if (_shouldSetState) setState(() {});
                          return;
                        }
                      } else if (_model.pageViewCurrentIndex == 1) {
                        _model.yearlysubscriptionOutput = await revenue_cat
                            .purchasePackage('yearlysubscription');
                        _shouldSetState = true;
                        if (!_model.yearlysubscriptionOutput!) {
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
                              ));
                            },
                          );
                          if (_shouldSetState) setState(() {});
                          return;
                        }
                      } else {
                        _model.onetimeOutput =
                            await revenue_cat.purchasePackage('onetime');
                        _shouldSetState = true;
                        if (!_model.onetimeOutput!) {
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
                              ));
                            },
                          );
                          if (_shouldSetState) setState(() {});
                          return;
                        }
                      }

                      if (Navigator.of(context).canPop()) {
                        context.pop();
                      }
                      context.pushNamed('ThankYouForSubscription');

                      if (_shouldSetState) setState(() {});
                    },
                    text: 'Select Plan',
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
                                color: FlutterFlowTheme.of(context).white,
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
              ]
                  .addToStart(SizedBox(height: 50.0))
                  .addToEnd(SizedBox(height: 36.0)),
            ),
          ],
        ),
      ),
    );
  }
}
