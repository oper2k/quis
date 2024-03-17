import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/backend/schema/structs/index.dart';
import '/components/pick_bottom_sheet_widget.dart';
import '/components/pseudo_drop_down_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'job_referral_model.dart';
export 'job_referral_model.dart';

class JobReferralWidget extends StatefulWidget {
  const JobReferralWidget({super.key});

  @override
  State<JobReferralWidget> createState() => _JobReferralWidgetState();
}

class _JobReferralWidgetState extends State<JobReferralWidget> {
  late JobReferralModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => JobReferralModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'JobReferral'});
    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??= TextEditingController();
    _model.textFieldFocusNode2 ??= FocusNode();
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
                  logFirebaseEvent('JOB_REFERRAL_Container_o5nu5zrc_ON_TAP');
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
              Text(
                'Job Referral',
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).headlineLarge,
              ),
              Container(
                width: 40.0,
                height: 40.0,
                decoration: BoxDecoration(),
                alignment: AlignmentDirectional(-1.0, 0.0),
              ),
            ],
          ),
          actions: [],
          centerTitle: false,
          toolbarHeight: 40.0,
          elevation: 0.0,
        ),
        body: StreamBuilder<List<GroupRecord>>(
          stream: queryGroupRecord(),
          builder: (context, snapshot) {
            // Customize what your widget looks like when it's loading.
            if (!snapshot.hasData) {
              return Center(
                child: SizedBox(
                  width: 50.0,
                  height: 50.0,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      FlutterFlowTheme.of(context).primary,
                    ),
                  ),
                ),
              );
            }
            List<GroupRecord> groupListGroupRecordList = snapshot.data!;
            return Container(
              decoration: BoxDecoration(),
              child: StreamBuilder<List<RoleRecord>>(
                stream: queryRoleRecord(),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(
                      child: SizedBox(
                        width: 50.0,
                        height: 50.0,
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                            FlutterFlowTheme.of(context).primary,
                          ),
                        ),
                      ),
                    );
                  }
                  List<RoleRecord> roleListRoleRecordList = snapshot.data!;
                  return Container(
                    decoration: BoxDecoration(),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Lottie.asset(
                                'assets/lottie_animations/animation_lo30k8t3.json',
                                width: 220.0,
                                height: 200.0,
                                fit: BoxFit.contain,
                                animate: true,
                              ),
                            ),
                            Text(
                              'Get job referrals to your dream companies',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context).headlineLarge,
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 20.0, 0.0, 0.0),
                              child: Text(
                                'Land more interviews with job referrals from employees at Emirates, Coya and more.',
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .headlineSmall
                                    .override(
                                      fontFamily: 'Sofia Pro',
                                      fontWeight: FontWeight.w300,
                                      useGoogleFonts: false,
                                      lineHeight: 1.16,
                                    ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 20.0, 0.0, 0.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).primary,
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Container(
                                                width: 24.0,
                                                height: 24.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .white,
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Icon(
                                                  FFIcons.kcontent,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  size: 24.0,
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 4.0, 0.0, 4.0),
                                                child: Container(
                                                  width: 2.0,
                                                  height: 89.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      12.0, 0.0, 0.0, 0.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 2.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      'Accelerate your job search.',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .headlineMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Sofia Pro',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .white,
                                                                useGoogleFonts:
                                                                    false,
                                                              ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 5.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      'Referrals are the fastest way to get interviews in any industry, and are proven to improve your chances of landing the offer.',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .headlineSmall
                                                              .override(
                                                                fontFamily:
                                                                    'Sofia Pro',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .white,
                                                                useGoogleFonts:
                                                                    false,
                                                                lineHeight:
                                                                    1.16,
                                                              ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Container(
                                                width: 24.0,
                                                height: 24.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .white,
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Icon(
                                                  FFIcons.kcontent,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  size: 24.0,
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 4.0, 0.0, 4.0),
                                                child: Container(
                                                  width: 2.0,
                                                  height: 107.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      12.0, 0.0, 0.0, 0.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 2.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      'Connect with our 300+ referral network.',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .headlineMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Sofia Pro',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .white,
                                                                useGoogleFonts:
                                                                    false,
                                                              ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 5.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      'Get your resume seen by an exclusive network of hundreds of Quis members currently employed at top FnB or Aviation companies.',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .headlineSmall
                                                              .override(
                                                                fontFamily:
                                                                    'Sofia Pro',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .white,
                                                                useGoogleFonts:
                                                                    false,
                                                                lineHeight:
                                                                    1.16,
                                                              ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Container(
                                                width: 24.0,
                                                height: 24.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .white,
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Icon(
                                                  FFIcons.kcontent,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  size: 24.0,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      12.0, 0.0, 0.0, 0.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 2.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      'Get seen by employees in minutes.',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .headlineMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Sofia Pro',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .white,
                                                                useGoogleFonts:
                                                                    false,
                                                              ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 5.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      'We\'re not satisfied until you are. Work with us until you get the resume you want. If you\'re not satisfied, get your money back.',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .headlineSmall
                                                              .override(
                                                                fontFamily:
                                                                    'Sofia Pro',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .white,
                                                                useGoogleFonts:
                                                                    false,
                                                                lineHeight:
                                                                    1.16,
                                                              ),
                                                    ),
                                                  ),
                                                ],
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
                            Form(
                              key: _model.formKey,
                              autovalidateMode: AutovalidateMode.disabled,
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 33.0, 0.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Industry',
                                      style: FlutterFlowTheme.of(context)
                                          .headlineSmall
                                          .override(
                                            fontFamily: 'Sofia Pro',
                                            fontWeight: FontWeight.w300,
                                            useGoogleFonts: false,
                                            lineHeight: 1.16,
                                          ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 6.0, 0.0, 0.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'JOB_REFERRAL_Container_o5bpl2d5_ON_TAP');
                                          logFirebaseEvent(
                                              'Container_bottom_sheet');
                                          await showModalBottomSheet(
                                            isScrollControlled: true,
                                            backgroundColor: Colors.transparent,
                                            enableDrag: false,
                                            context: context,
                                            builder: (context) {
                                              return WebViewAware(
                                                child: GestureDetector(
                                                  onTap: () => _model
                                                          .unfocusNode
                                                          .canRequestFocus
                                                      ? FocusScope.of(context)
                                                          .requestFocus(_model
                                                              .unfocusNode)
                                                      : FocusScope.of(context)
                                                          .unfocus(),
                                                  child: Padding(
                                                    padding:
                                                        MediaQuery.viewInsetsOf(
                                                            context),
                                                    child:
                                                        PickBottomSheetWidget(
                                                      stringList:
                                                          groupListGroupRecordList
                                                              .map(
                                                                  (e) => e.name)
                                                              .toList(),
                                                      title:
                                                          'Choose from the list below',
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          ).then((value) => safeSetState(() =>
                                              _model.groupOutput = value));

                                          if (_model.groupOutput != null &&
                                              _model.groupOutput != '') {
                                            logFirebaseEvent(
                                                'Container_update_page_state');
                                            setState(() {
                                              _model.pickedIndustry =
                                                  groupListGroupRecordList
                                                      .where((e) =>
                                                          e.name ==
                                                          _model.groupOutput)
                                                      .toList()
                                                      .first;
                                            });
                                          }

                                          setState(() {});
                                        },
                                        child: Container(
                                          height: 52.0,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            border: Border.all(
                                              color: _model
                                                          .isRoleGroupValidated ==
                                                      false
                                                  ? FlutterFlowTheme.of(context)
                                                      .error
                                                  : FlutterFlowTheme.of(context)
                                                      .white,
                                            ),
                                          ),
                                          child: wrapWithModel(
                                            model: _model.pseudoDropDownModel1,
                                            updateCallback: () =>
                                                setState(() {}),
                                            child: PseudoDropDownWidget(
                                              defText: 'Industry',
                                              text: _model.pickedIndustry?.name,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 11.0, 0.0, 0.0),
                                      child: Text(
                                        'Role',
                                        style: FlutterFlowTheme.of(context)
                                            .headlineSmall
                                            .override(
                                              fontFamily: 'Sofia Pro',
                                              fontWeight: FontWeight.w300,
                                              useGoogleFonts: false,
                                              lineHeight: 1.16,
                                            ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 6.0, 0.0, 0.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'JOB_REFERRAL_Container_u2os7s8o_ON_TAP');
                                          logFirebaseEvent(
                                              'Container_bottom_sheet');
                                          await showModalBottomSheet(
                                            isScrollControlled: true,
                                            backgroundColor: Colors.transparent,
                                            enableDrag: false,
                                            context: context,
                                            builder: (context) {
                                              return WebViewAware(
                                                child: GestureDetector(
                                                  onTap: () => _model
                                                          .unfocusNode
                                                          .canRequestFocus
                                                      ? FocusScope.of(context)
                                                          .requestFocus(_model
                                                              .unfocusNode)
                                                      : FocusScope.of(context)
                                                          .unfocus(),
                                                  child: Padding(
                                                    padding:
                                                        MediaQuery.viewInsetsOf(
                                                            context),
                                                    child:
                                                        PickBottomSheetWidget(
                                                      stringList: roleListRoleRecordList
                                                          .where((e) =>
                                                              (e.group ==
                                                                  _model
                                                                      .pickedIndustry
                                                                      ?.reference) &&
                                                              (e.name !=
                                                                  'Unemployed') &&
                                                              (e.name !=
                                                                  'Other'))
                                                          .toList()
                                                          .map((e) => e.name)
                                                          .toList(),
                                                      title:
                                                          'Choose from the list below',
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          ).then((value) => safeSetState(
                                              () => _model.roleOutput = value));

                                          if (_model.roleOutput != null &&
                                              _model.roleOutput != '') {
                                            logFirebaseEvent(
                                                'Container_update_page_state');
                                            setState(() {
                                              _model.pickedRole =
                                                  roleListRoleRecordList
                                                      .where((e) =>
                                                          e.name ==
                                                          _model.roleOutput)
                                                      .toList()
                                                      .first;
                                            });
                                          }

                                          setState(() {});
                                        },
                                        child: Container(
                                          height: 52.0,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            border: Border.all(
                                              color: _model
                                                          .isRoleGroupValidated ==
                                                      false
                                                  ? FlutterFlowTheme.of(context)
                                                      .error
                                                  : FlutterFlowTheme.of(context)
                                                      .white,
                                            ),
                                          ),
                                          child: wrapWithModel(
                                            model: _model.pseudoDropDownModel2,
                                            updateCallback: () =>
                                                setState(() {}),
                                            child: PseudoDropDownWidget(
                                              defText: 'Role',
                                              text: _model.pickedRole?.name,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 11.0, 0.0, 0.0),
                                      child: Text(
                                        'Email address',
                                        style: FlutterFlowTheme.of(context)
                                            .headlineSmall
                                            .override(
                                              fontFamily: 'Sofia Pro',
                                              fontWeight: FontWeight.w300,
                                              useGoogleFonts: false,
                                              lineHeight: 1.16,
                                            ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 6.0, 0.0, 0.0),
                                      child: TextFormField(
                                        controller: _model.textController1,
                                        focusNode: _model.textFieldFocusNode1,
                                        textInputAction: TextInputAction.next,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          hintText: 'example@gmail.com',
                                          hintStyle: FlutterFlowTheme.of(
                                                  context)
                                              .headlineSmall
                                              .override(
                                                fontFamily: 'Sofia Pro',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .accent2,
                                                useGoogleFonts: false,
                                                lineHeight: 1.16,
                                              ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          filled: true,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .white,
                                          contentPadding: EdgeInsets.all(16.0),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .headlineSmall,
                                        validator: _model
                                            .textController1Validator
                                            .asValidator(context),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 11.0, 0.0, 0.0),
                                      child: Text(
                                        'Current CV',
                                        style: FlutterFlowTheme.of(context)
                                            .headlineSmall
                                            .override(
                                              fontFamily: 'Sofia Pro',
                                              fontWeight: FontWeight.w300,
                                              useGoogleFonts: false,
                                              lineHeight: 1.16,
                                            ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 6.0, 0.0, 0.0),
                                      child: Container(
                                        width: double.infinity,
                                        height: 56.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          border: Border.all(
                                            color: _model.isCVvalidated
                                                ? FlutterFlowTheme.of(context)
                                                    .white
                                                : FlutterFlowTheme.of(context)
                                                    .error,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 16.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                _model.uploadedFileUrl !=
                                                            null &&
                                                        _model.uploadedFileUrl !=
                                                            ''
                                                    ? 'uploaded file'
                                                    : 'Please attach here your CV',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .headlineSmall
                                                    .override(
                                                      fontFamily: 'Sofia Pro',
                                                      color: _model.uploadedFileUrl !=
                                                                  null &&
                                                              _model.uploadedFileUrl !=
                                                                  ''
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .accent2,
                                                      useGoogleFonts: false,
                                                    ),
                                              ),
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  logFirebaseEvent(
                                                      'JOB_REFERRAL_Container_2dv9fdu7_ON_TAP');
                                                  logFirebaseEvent(
                                                      'Container_custom_action');
                                                  await actions
                                                      .dismissKeyboard();
                                                  logFirebaseEvent(
                                                      'Container_upload_file_to_firebase');
                                                  final selectedFiles =
                                                      await selectFiles(
                                                    multiFile: false,
                                                  );
                                                  if (selectedFiles != null) {
                                                    setState(() =>
                                                        _model.isDataUploading =
                                                            true);
                                                    var selectedUploadedFiles =
                                                        <FFUploadedFile>[];

                                                    var downloadUrls =
                                                        <String>[];
                                                    try {
                                                      selectedUploadedFiles =
                                                          selectedFiles
                                                              .map((m) =>
                                                                  FFUploadedFile(
                                                                    name: m
                                                                        .storagePath
                                                                        .split(
                                                                            '/')
                                                                        .last,
                                                                    bytes:
                                                                        m.bytes,
                                                                  ))
                                                              .toList();

                                                      downloadUrls =
                                                          (await Future.wait(
                                                        selectedFiles.map(
                                                          (f) async =>
                                                              await uploadData(
                                                                  f.storagePath,
                                                                  f.bytes),
                                                        ),
                                                      ))
                                                              .where((u) =>
                                                                  u != null)
                                                              .map((u) => u!)
                                                              .toList();
                                                    } finally {
                                                      _model.isDataUploading =
                                                          false;
                                                    }
                                                    if (selectedUploadedFiles
                                                                .length ==
                                                            selectedFiles
                                                                .length &&
                                                        downloadUrls.length ==
                                                            selectedFiles
                                                                .length) {
                                                      setState(() {
                                                        _model.uploadedLocalFile =
                                                            selectedUploadedFiles
                                                                .first;
                                                        _model.uploadedFileUrl =
                                                            downloadUrls.first;
                                                      });
                                                    } else {
                                                      setState(() {});
                                                      return;
                                                    }
                                                  }

                                                  logFirebaseEvent(
                                                      'Container_update_page_state');
                                                  setState(() {
                                                    _model.isCVvalidated = true;
                                                  });
                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(),
                                                  child: Icon(
                                                    FFIcons
                                                        .kiconamoonAttachmentLight1,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    size: 24.0,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 11.0, 0.0, 0.0),
                                      child: Text(
                                        'Inspiring message',
                                        style: FlutterFlowTheme.of(context)
                                            .headlineSmall
                                            .override(
                                              fontFamily: 'Sofia Pro',
                                              fontWeight: FontWeight.w300,
                                              useGoogleFonts: false,
                                              lineHeight: 1.16,
                                            ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 6.0, 0.0, 0.0),
                                      child: TextFormField(
                                        controller: _model.textController2,
                                        focusNode: _model.textFieldFocusNode2,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          hintText:
                                              'Please write here Inspiring Message\n',
                                          hintStyle: FlutterFlowTheme.of(
                                                  context)
                                              .headlineSmall
                                              .override(
                                                fontFamily: 'Sofia Pro',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .accent2,
                                                useGoogleFonts: false,
                                                lineHeight: 1.16,
                                              ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          filled: true,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .white,
                                          contentPadding: EdgeInsets.all(16.0),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .headlineSmall,
                                        maxLines: null,
                                        minLines: 4,
                                        validator: _model
                                            .textController2Validator
                                            .asValidator(context),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 0.0, 0.0),
                                child: Text(
                                  'This feature does not guarantee a Job Offer. Upon receiving your submission, we will actively promote CV within internal network of Recruiters. IF your CV is succesfull you will receive a response from the Recruiter informing further steps. \n\nNOTE: You can apply for a Job Referral only ONCE a month!',
                                  textAlign: TextAlign.start,
                                  style: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Sofia Pro',
                                        color: FlutterFlowTheme.of(context)
                                            .accent3,
                                        useGoogleFonts: false,
                                        lineHeight: 1.16,
                                      ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(1.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 23.0, 0.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    SizedBox(
                                      width: 170.0,
                                      child: Divider(
                                        height: 1.0,
                                        thickness: 1.0,
                                        color: FlutterFlowTheme.of(context)
                                            .accent3,
                                      ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 6.0, 0.0, 0.0),
                                          child: Text(
                                            '15',
                                            style: FlutterFlowTheme.of(context)
                                                .headlineLarge,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  2.0, 0.0, 0.0, 0.0),
                                          child: Icon(
                                            FFIcons.kgameIconsYinYang,
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            size: 20.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 30.0, 0.0, 0.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'JOB_REFERRAL_GET_A_REFERRAL_BTN_ON_TAP');
                                  var _shouldSetState = false;
                                  if ((_model.pickedRole != null) &&
                                      (_model.pickedIndustry != null)) {
                                    logFirebaseEvent(
                                        'Button_update_page_state');
                                    setState(() {
                                      _model.isRoleGroupValidated = true;
                                    });
                                  } else {
                                    logFirebaseEvent(
                                        'Button_update_page_state');
                                    setState(() {
                                      _model.isRoleGroupValidated = false;
                                    });
                                    if (_model.uploadedFileUrl != null &&
                                        _model.uploadedFileUrl != '') {
                                      logFirebaseEvent(
                                          'Button_update_page_state');
                                      setState(() {
                                        _model.isCVvalidated = true;
                                      });
                                    } else {
                                      logFirebaseEvent(
                                          'Button_update_page_state');
                                      setState(() {
                                        _model.isCVvalidated = false;
                                      });
                                    }

                                    logFirebaseEvent('Button_validate_form');
                                    if (_model.formKey.currentState == null ||
                                        !_model.formKey.currentState!
                                            .validate()) {
                                      return;
                                    }
                                    if (_model.uploadedFileUrl == null ||
                                        _model.uploadedFileUrl.isEmpty) {
                                      return;
                                    }
                                    if (_shouldSetState) setState(() {});
                                    return;
                                  }

                                  if (_model.uploadedFileUrl != null &&
                                      _model.uploadedFileUrl != '') {
                                    logFirebaseEvent(
                                        'Button_update_page_state');
                                    setState(() {
                                      _model.isCVvalidated = true;
                                    });
                                  } else {
                                    logFirebaseEvent(
                                        'Button_update_page_state');
                                    setState(() {
                                      _model.isCVvalidated = false;
                                    });
                                    if (_shouldSetState) setState(() {});
                                    return;
                                  }

                                  logFirebaseEvent('Button_validate_form');
                                  if (_model.formKey.currentState == null ||
                                      !_model.formKey.currentState!
                                          .validate()) {
                                    return;
                                  }
                                  if (_model.uploadedFileUrl == null ||
                                      _model.uploadedFileUrl.isEmpty) {
                                    return;
                                  }
                                  logFirebaseEvent('Button_action_block');
                                  _model.payByKarmaOutput =
                                      await action_blocks.payByKarma(
                                    context,
                                    karmaAmount: 15.0,
                                    serviceName: 'Job Referral',
                                    quantity: 1,
                                    comment: _model.textController2.text,
                                    userRole: _model.pickedRole?.name,
                                    userIndustry: _model.pickedIndustry?.name,
                                    userEmail: _model.textController1.text,
                                  );
                                  _shouldSetState = true;
                                  if (_shouldSetState) setState(() {});
                                },
                                text: 'Get a Referral',
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
                                        color:
                                            FlutterFlowTheme.of(context).white,
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
                          ].addToEnd(SizedBox(height: 40.0)),
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
