import '/components/pick_bottom_sheet_widget.dart';
import '/components/pseudo_drop_down_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/profile/support_letter_dialog/support_letter_dialog_widget.dart';
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'support_model.dart';
export 'support_model.dart';

class SupportWidget extends StatefulWidget {
  const SupportWidget({Key? key}) : super(key: key);

  @override
  _SupportWidgetState createState() => _SupportWidgetState();
}

class _SupportWidgetState extends State<SupportWidget> {
  late SupportModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SupportModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    _model.expandableController1 = ExpandableController(initialExpanded: false);
    _model.expandableController2 = ExpandableController(initialExpanded: false);
    _model.expandableController3 = ExpandableController(initialExpanded: false);
    _model.expandableController4 = ExpandableController(initialExpanded: false);
    _model.expandableController5 = ExpandableController(initialExpanded: false);
    _model.expandableController6 = ExpandableController(initialExpanded: false);
    _model.expandableController7 = ExpandableController(initialExpanded: false);
    _model.expandableController8 = ExpandableController(initialExpanded: false);
    _model.expandableController9 = ExpandableController(initialExpanded: false);
    _model.expandableController10 =
        ExpandableController(initialExpanded: false);
    _model.expandableController11 =
        ExpandableController(initialExpanded: false);
    _model.expandableController12 =
        ExpandableController(initialExpanded: false);
    _model.expandableController13 =
        ExpandableController(initialExpanded: false);
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
                  context.safePop();
                },
                child: Container(
                  width: 40.0,
                  height: 40.0,
                  decoration: BoxDecoration(),
                  alignment: AlignmentDirectional(-1.00, 0.00),
                  child: Icon(
                    FFIcons.karrowBack,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    size: 30.0,
                  ),
                ),
              ),
              Text(
                'Customer support',
                style: FlutterFlowTheme.of(context).headlineLarge,
              ),
              Container(
                width: 40.0,
                height: 40.0,
                decoration: BoxDecoration(),
              ),
            ],
          ),
          actions: [],
          centerTitle: false,
          toolbarHeight: 40.0,
          elevation: 0.0,
        ),
        body: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: AlignmentDirectional(0.00, 0.00),
                  child: Lottie.asset(
                    'assets/lottie_animations/animation_lnvyjnau.json',
                    width: 226.0,
                    height: 171.0,
                    fit: BoxFit.contain,
                    animate: true,
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.00, 0.00),
                  child: Text(
                    'Assistance at Your Fingertips',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).headlineLarge,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                  child: Text(
                    'Select the topic of the appeal',
                    style: FlutterFlowTheme.of(context).headlineSmall.override(
                          fontFamily: 'Sofia Pro',
                          fontWeight: FontWeight.w300,
                          useGoogleFonts: false,
                          lineHeight: 1.16,
                        ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 0.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      await showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        enableDrag: false,
                        context: context,
                        builder: (context) {
                          return WebViewAware(
                              child: GestureDetector(
                            onTap: () => _model.unfocusNode.canRequestFocus
                                ? FocusScope.of(context)
                                    .requestFocus(_model.unfocusNode)
                                : FocusScope.of(context).unfocus(),
                            child: Padding(
                              padding: MediaQuery.viewInsetsOf(context),
                              child: PickBottomSheetWidget(
                                stringList: FFAppState().supportTopicList,
                              ),
                            ),
                          ));
                        },
                      ).then((value) =>
                          safeSetState(() => _model.topicOutput = value));

                      if (_model.topicOutput != null &&
                          _model.topicOutput != '') {
                        setState(() {
                          _model.pickedTopic = _model.topicOutput;
                        });
                        setState(() {
                          _model.isTopicValidated = true;
                        });
                      }

                      setState(() {});
                    },
                    child: Container(
                      height: 52.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(
                          color: _model.isTopicValidated
                              ? Color(0x00000000)
                              : FlutterFlowTheme.of(context).error,
                        ),
                      ),
                      child: wrapWithModel(
                        model: _model.pseudoDropDownModel,
                        updateCallback: () => setState(() {}),
                        child: PseudoDropDownWidget(
                          defText: 'Select topic',
                          text: _model.pickedTopic,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 26.0, 0.0, 0.0),
                  child: Text(
                    'Message',
                    style: FlutterFlowTheme.of(context).headlineSmall.override(
                          fontFamily: 'Sofia Pro',
                          fontWeight: FontWeight.w300,
                          useGoogleFonts: false,
                          lineHeight: 1.16,
                        ),
                  ),
                ),
                Form(
                  key: _model.formKey,
                  autovalidateMode: AutovalidateMode.disabled,
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                    child: TextFormField(
                      controller: _model.textController,
                      focusNode: _model.textFieldFocusNode,
                      textInputAction: TextInputAction.done,
                      obscureText: false,
                      decoration: InputDecoration(
                        hintText: 'Describe the essence of the appeal',
                        hintStyle:
                            FlutterFlowTheme.of(context).headlineSmall.override(
                                  fontFamily: 'Sofia Pro',
                                  color: FlutterFlowTheme.of(context).accent2,
                                  useGoogleFonts: false,
                                  lineHeight: 1.16,
                                ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).alternate,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).error,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).error,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        filled: true,
                        fillColor: FlutterFlowTheme.of(context).white,
                        contentPadding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 16.0, 16.0, 16.0),
                      ),
                      style: FlutterFlowTheme.of(context).headlineSmall,
                      maxLines: null,
                      minLines: 4,
                      maxLength: 500,
                      validator:
                          _model.textControllerValidator.asValidator(context),
                    ),
                  ),
                ),
                Builder(
                  builder: (context) => Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        if (_model.pickedTopic != null &&
                            _model.pickedTopic != '') {
                          setState(() {
                            _model.isTopicValidated = true;
                          });
                        } else {
                          setState(() {
                            _model.isTopicValidated = false;
                          });
                          if (_model.formKey.currentState == null ||
                              !_model.formKey.currentState!.validate()) {
                            return;
                          }
                          return;
                        }

                        if (_model.formKey.currentState == null ||
                            !_model.formKey.currentState!.validate()) {
                          return;
                        }
                        await showAlignedDialog(
                          context: context,
                          isGlobal: true,
                          avoidOverflow: false,
                          targetAnchor: AlignmentDirectional(0.0, 0.0)
                              .resolve(Directionality.of(context)),
                          followerAnchor: AlignmentDirectional(0.0, 0.0)
                              .resolve(Directionality.of(context)),
                          builder: (dialogContext) {
                            return Material(
                              color: Colors.transparent,
                              child: WebViewAware(
                                  child: GestureDetector(
                                onTap: () => _model.unfocusNode.canRequestFocus
                                    ? FocusScope.of(context)
                                        .requestFocus(_model.unfocusNode)
                                    : FocusScope.of(context).unfocus(),
                                child: SupportLetterDialogWidget(),
                              )),
                            );
                          },
                        ).then((value) => setState(() {}));
                      },
                      text: 'Submit',
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 52.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
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
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 37.0, 0.0, 0.0),
                  child: Text(
                    'FAQ',
                    style: FlutterFlowTheme.of(context).headlineLarge,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 19.0, 0.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                        child: Text(
                          'Membership',
                          style: FlutterFlowTheme.of(context)
                              .headlineSmall
                              .override(
                                fontFamily: 'Sofia Pro',
                                color: FlutterFlowTheme.of(context).accent3,
                                useGoogleFonts: false,
                              ),
                        ),
                      ),
                      Divider(
                        thickness: 3.0,
                        color: Color(0x4DD8DADC),
                      ),
                      Container(
                        decoration: BoxDecoration(),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 16.0, 16.0, 16.0),
                          child: Container(
                            width: double.infinity,
                            color: Color(0x00000000),
                            child: ExpandableNotifier(
                              controller: _model.expandableController1,
                              child: ExpandablePanel(
                                header: Text(
                                  'What\'s included in the Membership?',
                                  style: FlutterFlowTheme.of(context)
                                      .headlineMedium,
                                ),
                                collapsed: Container(
                                  decoration: BoxDecoration(),
                                ),
                                expanded: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 16.0, 0.0, 0.0),
                                  child: Text(
                                    'Quis membership includes exclusive access to all of the course content, unlimited practice interviews and so much more! Our courses include detailed lessons, guides, master class videos, and frameworks to help you ace your interview. All of our courses include free lessons ',
                                    style: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .override(
                                          fontFamily: 'Sofia Pro',
                                          useGoogleFonts: false,
                                          lineHeight: 1.16,
                                        ),
                                  ),
                                ),
                                theme: ExpandableThemeData(
                                  tapHeaderToExpand: true,
                                  tapBodyToExpand: false,
                                  tapBodyToCollapse: false,
                                  headerAlignment:
                                      ExpandablePanelHeaderAlignment.center,
                                  hasIcon: true,
                                  expandIcon: FFIcons.kplus,
                                  collapseIcon: FFIcons.kxmark,
                                  iconSize: 24.0,
                                  iconColor:
                                      FlutterFlowTheme.of(context).primary,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Divider(
                        thickness: 3.0,
                        color: Color(0x4DD8DADC),
                      ),
                      Container(
                        decoration: BoxDecoration(),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 16.0, 16.0, 16.0),
                          child: Container(
                            width: double.infinity,
                            color: Color(0x00000000),
                            child: ExpandableNotifier(
                              controller: _model.expandableController2,
                              child: ExpandablePanel(
                                header: Text(
                                  'Can support assist me with career questions or a job offer advice?',
                                  style: FlutterFlowTheme.of(context)
                                      .headlineMedium,
                                ),
                                collapsed: Container(
                                  decoration: BoxDecoration(),
                                ),
                                expanded: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 16.0, 0.0, 0.0),
                                  child: Text(
                                    'At this time, Quis support offers assistance with account and service-related issues. If you would like more in-depth advice, we recommend you take a look at our coaching',
                                    style: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .override(
                                          fontFamily: 'Sofia Pro',
                                          useGoogleFonts: false,
                                          lineHeight: 1.16,
                                        ),
                                  ),
                                ),
                                theme: ExpandableThemeData(
                                  tapHeaderToExpand: true,
                                  tapBodyToExpand: false,
                                  tapBodyToCollapse: false,
                                  headerAlignment:
                                      ExpandablePanelHeaderAlignment.center,
                                  hasIcon: true,
                                  expandIcon: FFIcons.kplus,
                                  collapseIcon: FFIcons.kxmark,
                                  iconSize: 24.0,
                                  iconColor:
                                      FlutterFlowTheme.of(context).primary,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Divider(
                        thickness: 3.0,
                        color: Color(0x4DD8DADC),
                      ),
                      Container(
                        decoration: BoxDecoration(),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 16.0, 16.0, 16.0),
                          child: Container(
                            width: double.infinity,
                            color: Color(0x00000000),
                            child: ExpandableNotifier(
                              controller: _model.expandableController3,
                              child: ExpandablePanel(
                                header: Text(
                                  ' I\'ve reached out for support, when can I expect a response?',
                                  style: FlutterFlowTheme.of(context)
                                      .headlineMedium,
                                ),
                                collapsed: Container(
                                  decoration: BoxDecoration(),
                                ),
                                expanded: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 16.0, 0.0, 0.0),
                                  child: Text(
                                    'Our business hours are Monday through Thursday, 8 AM - 8 PM. You can expect a response within 2 business days.',
                                    style: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .override(
                                          fontFamily: 'Sofia Pro',
                                          useGoogleFonts: false,
                                          lineHeight: 1.16,
                                        ),
                                  ),
                                ),
                                theme: ExpandableThemeData(
                                  tapHeaderToExpand: true,
                                  tapBodyToExpand: false,
                                  tapBodyToCollapse: false,
                                  headerAlignment:
                                      ExpandablePanelHeaderAlignment.center,
                                  hasIcon: true,
                                  expandIcon: FFIcons.kplus,
                                  collapseIcon: FFIcons.kxmark,
                                  iconSize: 24.0,
                                  iconColor:
                                      FlutterFlowTheme.of(context).primary,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Divider(
                        thickness: 3.0,
                        color: Color(0x4DD8DADC),
                      ),
                      Container(
                        decoration: BoxDecoration(),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 16.0, 16.0, 16.0),
                          child: Container(
                            width: double.infinity,
                            color: Color(0x00000000),
                            child: ExpandableNotifier(
                              controller: _model.expandableController4,
                              child: ExpandablePanel(
                                header: Text(
                                  'How can I delete my Quis Account?',
                                  style: FlutterFlowTheme.of(context)
                                      .headlineMedium,
                                ),
                                collapsed: Container(
                                  decoration: BoxDecoration(),
                                ),
                                expanded: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 16.0, 0.0, 0.0),
                                  child: Text(
                                    ' You can delete your account by navigating to the \"Settings\" page and choose \"Delete Account\"',
                                    style: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .override(
                                          fontFamily: 'Sofia Pro',
                                          useGoogleFonts: false,
                                          lineHeight: 1.16,
                                        ),
                                  ),
                                ),
                                theme: ExpandableThemeData(
                                  tapHeaderToExpand: true,
                                  tapBodyToExpand: false,
                                  tapBodyToCollapse: false,
                                  headerAlignment:
                                      ExpandablePanelHeaderAlignment.center,
                                  hasIcon: true,
                                  expandIcon: FFIcons.kplus,
                                  collapseIcon: FFIcons.kxmark,
                                  iconSize: 24.0,
                                  iconColor:
                                      FlutterFlowTheme.of(context).primary,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Divider(
                        thickness: 3.0,
                        color: Color(0x4DD8DADC),
                      ),
                      Container(
                        decoration: BoxDecoration(),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 16.0, 16.0, 16.0),
                          child: Container(
                            width: double.infinity,
                            color: Color(0x00000000),
                            child: ExpandableNotifier(
                              controller: _model.expandableController5,
                              child: ExpandablePanel(
                                header: Text(
                                  'What is your renewal policy?',
                                  style: FlutterFlowTheme.of(context)
                                      .headlineMedium,
                                ),
                                collapsed: Container(
                                  decoration: BoxDecoration(),
                                ),
                                expanded: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 16.0, 0.0, 0.0),
                                  child: Text(
                                    'Your Quis membership will renew automatically. You can cancel your plan at any time before your renewal date by visiting the \"Billing Management\" from the \"Settings\" page.',
                                    style: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .override(
                                          fontFamily: 'Sofia Pro',
                                          useGoogleFonts: false,
                                          lineHeight: 1.16,
                                        ),
                                  ),
                                ),
                                theme: ExpandableThemeData(
                                  tapHeaderToExpand: true,
                                  tapBodyToExpand: false,
                                  tapBodyToCollapse: false,
                                  headerAlignment:
                                      ExpandablePanelHeaderAlignment.center,
                                  hasIcon: true,
                                  expandIcon: FFIcons.kplus,
                                  collapseIcon: FFIcons.kxmark,
                                  iconSize: 24.0,
                                  iconColor:
                                      FlutterFlowTheme.of(context).primary,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Divider(
                        thickness: 3.0,
                        color: Color(0x4DD8DADC),
                      ),
                      Container(
                        decoration: BoxDecoration(),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 16.0, 16.0, 16.0),
                          child: Container(
                            width: double.infinity,
                            color: Color(0x00000000),
                            child: ExpandableNotifier(
                              controller: _model.expandableController6,
                              child: ExpandablePanel(
                                header: Text(
                                  'I have a question which is not answered here',
                                  style: FlutterFlowTheme.of(context)
                                      .headlineMedium,
                                ),
                                collapsed: Container(
                                  decoration: BoxDecoration(),
                                ),
                                expanded: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 16.0, 0.0, 0.0),
                                  child: RichText(
                                    textScaleFactor:
                                        MediaQuery.of(context).textScaleFactor,
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text:
                                              'Please email your question to:  ',
                                          style: FlutterFlowTheme.of(context)
                                              .headlineSmall,
                                        ),
                                        TextSpan(
                                          text: 'info@quis-hq.com',
                                          style: FlutterFlowTheme.of(context)
                                              .headlineSmall
                                              .override(
                                                fontFamily: 'Sofia Pro',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                                fontWeight: FontWeight.w600,
                                                decoration:
                                                    TextDecoration.underline,
                                                useGoogleFonts: false,
                                              ),
                                          mouseCursor: SystemMouseCursors.click,
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () async {
                                              await launchURL(
                                                  'info@quis-hq.com');
                                            },
                                        )
                                      ],
                                      style: FlutterFlowTheme.of(context)
                                          .headlineSmall
                                          .override(
                                            fontFamily: 'Sofia Pro',
                                            useGoogleFonts: false,
                                            lineHeight: 1.16,
                                          ),
                                    ),
                                  ),
                                ),
                                theme: ExpandableThemeData(
                                  tapHeaderToExpand: true,
                                  tapBodyToExpand: false,
                                  tapBodyToCollapse: false,
                                  headerAlignment:
                                      ExpandablePanelHeaderAlignment.center,
                                  hasIcon: true,
                                  expandIcon: FFIcons.kplus,
                                  collapseIcon: FFIcons.kxmark,
                                  iconSize: 24.0,
                                  iconColor:
                                      FlutterFlowTheme.of(context).primary,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Divider(
                        thickness: 3.0,
                        color: Color(0x4DD8DADC),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 19.0, 0.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 10.0, 0.0, 0.0),
                        child: Text(
                          'Coaching',
                          style: FlutterFlowTheme.of(context)
                              .headlineSmall
                              .override(
                                fontFamily: 'Sofia Pro',
                                color: FlutterFlowTheme.of(context).accent3,
                                useGoogleFonts: false,
                              ),
                        ),
                      ),
                      Divider(
                        thickness: 3.0,
                        color: Color(0x4DD8DADC),
                      ),
                      Container(
                        decoration: BoxDecoration(),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 16.0, 16.0, 16.0),
                          child: Container(
                            width: double.infinity,
                            color: Color(0x00000000),
                            child: ExpandableNotifier(
                              controller: _model.expandableController7,
                              child: ExpandablePanel(
                                header: Text(
                                  'How does Quis interview coaching work?',
                                  style: FlutterFlowTheme.of(context)
                                      .headlineMedium,
                                ),
                                collapsed: Container(
                                  decoration: BoxDecoration(),
                                ),
                                expanded: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 16.0, 0.0, 0.0),
                                  child: Text(
                                    'Our interviewing coaching is a core pillar of the Quis interview preparation experience. In addition to self-studying on our platform and practicing with Practice Interviews, you can give yourself the best chance of landing your dream role by seeking feedback from our expert interview coaches who can help level-up your interview presence, refine your responses, and highlight any pitfalls. Most students book 3-5 sessions to make the most of the coaching experience.',
                                    style: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .override(
                                          fontFamily: 'Sofia Pro',
                                          useGoogleFonts: false,
                                          lineHeight: 1.16,
                                        ),
                                  ),
                                ),
                                theme: ExpandableThemeData(
                                  tapHeaderToExpand: true,
                                  tapBodyToExpand: false,
                                  tapBodyToCollapse: false,
                                  headerAlignment:
                                      ExpandablePanelHeaderAlignment.center,
                                  hasIcon: true,
                                  expandIcon: FFIcons.kplus,
                                  collapseIcon: FFIcons.kxmark,
                                  iconSize: 24.0,
                                  iconColor:
                                      FlutterFlowTheme.of(context).primary,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Divider(
                        thickness: 3.0,
                        color: Color(0x4DD8DADC),
                      ),
                      Container(
                        decoration: BoxDecoration(),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 16.0, 16.0, 16.0),
                          child: Container(
                            width: double.infinity,
                            color: Color(0x00000000),
                            child: ExpandableNotifier(
                              controller: _model.expandableController8,
                              child: ExpandablePanel(
                                header: Text(
                                  'What is included in a personalized coaching session?',
                                  style: FlutterFlowTheme.of(context)
                                      .headlineMedium,
                                ),
                                collapsed: Container(
                                  decoration: BoxDecoration(),
                                ),
                                expanded: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 16.0, 0.0, 0.0),
                                  child: Text(
                                    'Before and during the 45-minute session, you\'ll discuss your goals, and your coach will customize the session to tailor to your areas of improvement. During and after the session, you\'ll receive detailed feedback and guidance on how to improve. Some examples of what we might cover in our sessions depend on the industry where you are and include Salary negotiation, job requirement conformance, research and more.',
                                    style: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .override(
                                          fontFamily: 'Sofia Pro',
                                          useGoogleFonts: false,
                                          lineHeight: 1.16,
                                        ),
                                  ),
                                ),
                                theme: ExpandableThemeData(
                                  tapHeaderToExpand: true,
                                  tapBodyToExpand: false,
                                  tapBodyToCollapse: false,
                                  headerAlignment:
                                      ExpandablePanelHeaderAlignment.center,
                                  hasIcon: true,
                                  expandIcon: FFIcons.kplus,
                                  collapseIcon: FFIcons.kxmark,
                                  iconSize: 24.0,
                                  iconColor:
                                      FlutterFlowTheme.of(context).primary,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Divider(
                        thickness: 3.0,
                        color: Color(0x4DD8DADC),
                      ),
                      Container(
                        decoration: BoxDecoration(),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 16.0, 16.0, 16.0),
                          child: Container(
                            width: double.infinity,
                            color: Color(0x00000000),
                            child: ExpandableNotifier(
                              controller: _model.expandableController9,
                              child: ExpandablePanel(
                                header: Text(
                                  ' Who are Quis Coaches?',
                                  style: FlutterFlowTheme.of(context)
                                      .headlineMedium,
                                ),
                                collapsed: Container(
                                  decoration: BoxDecoration(),
                                ),
                                expanded: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 16.0, 0.0, 0.0),
                                  child: Text(
                                    'Quis Coaches are current Recruiters, ex-Recruiters and industry experts who have been hand-picked and vetted by Quis. Coaches are rigorously selected and checked before providing any kind of services',
                                    style: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .override(
                                          fontFamily: 'Sofia Pro',
                                          useGoogleFonts: false,
                                          lineHeight: 1.16,
                                        ),
                                  ),
                                ),
                                theme: ExpandableThemeData(
                                  tapHeaderToExpand: true,
                                  tapBodyToExpand: false,
                                  tapBodyToCollapse: false,
                                  headerAlignment:
                                      ExpandablePanelHeaderAlignment.center,
                                  hasIcon: true,
                                  expandIcon: FFIcons.kplus,
                                  collapseIcon: FFIcons.kxmark,
                                  iconSize: 24.0,
                                  iconColor:
                                      FlutterFlowTheme.of(context).primary,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Divider(
                        thickness: 3.0,
                        color: Color(0x4DD8DADC),
                      ),
                      Container(
                        decoration: BoxDecoration(),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 16.0, 16.0, 16.0),
                          child: Container(
                            width: double.infinity,
                            color: Color(0x00000000),
                            child: ExpandableNotifier(
                              controller: _model.expandableController10,
                              child: ExpandablePanel(
                                header: Text(
                                  ' I need coaching ASAP!',
                                  style: FlutterFlowTheme.of(context)
                                      .headlineMedium,
                                ),
                                collapsed: Container(
                                  decoration: BoxDecoration(),
                                ),
                                expanded: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 16.0, 0.0, 0.0),
                                  child: Text(
                                    'Please fill up the Add-ons form and we will get in touch with you.',
                                    style: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .override(
                                          fontFamily: 'Sofia Pro',
                                          useGoogleFonts: false,
                                          lineHeight: 1.16,
                                        ),
                                  ),
                                ),
                                theme: ExpandableThemeData(
                                  tapHeaderToExpand: true,
                                  tapBodyToExpand: false,
                                  tapBodyToCollapse: false,
                                  headerAlignment:
                                      ExpandablePanelHeaderAlignment.center,
                                  hasIcon: true,
                                  expandIcon: FFIcons.kplus,
                                  collapseIcon: FFIcons.kxmark,
                                  iconSize: 24.0,
                                  iconColor:
                                      FlutterFlowTheme.of(context).primary,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Divider(
                        thickness: 3.0,
                        color: Color(0x4DD8DADC),
                      ),
                      Container(
                        decoration: BoxDecoration(),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 16.0, 16.0, 16.0),
                          child: Container(
                            width: double.infinity,
                            color: Color(0x00000000),
                            child: ExpandableNotifier(
                              controller: _model.expandableController11,
                              child: ExpandablePanel(
                                header: Text(
                                  'Does my coaching purchase the membership of Quis',
                                  style: FlutterFlowTheme.of(context)
                                      .headlineMedium,
                                ),
                                collapsed: Container(
                                  decoration: BoxDecoration(),
                                ),
                                expanded: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 16.0, 0.0, 0.0),
                                  child: Text(
                                    'The purchase of a coaching session does not include Quis membership.',
                                    style: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .override(
                                          fontFamily: 'Sofia Pro',
                                          useGoogleFonts: false,
                                          lineHeight: 1.16,
                                        ),
                                  ),
                                ),
                                theme: ExpandableThemeData(
                                  tapHeaderToExpand: true,
                                  tapBodyToExpand: false,
                                  tapBodyToCollapse: false,
                                  headerAlignment:
                                      ExpandablePanelHeaderAlignment.center,
                                  hasIcon: true,
                                  expandIcon: FFIcons.kplus,
                                  collapseIcon: FFIcons.kxmark,
                                  iconSize: 24.0,
                                  iconColor:
                                      FlutterFlowTheme.of(context).primary,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Divider(
                        thickness: 3.0,
                        color: Color(0x4DD8DADC),
                      ),
                      Container(
                        decoration: BoxDecoration(),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 16.0, 16.0, 16.0),
                          child: Container(
                            width: double.infinity,
                            color: Color(0x00000000),
                            child: ExpandableNotifier(
                              controller: _model.expandableController12,
                              child: ExpandablePanel(
                                header: Text(
                                  'What if I need to cancel my session or miss my session?',
                                  style: FlutterFlowTheme.of(context)
                                      .headlineMedium,
                                ),
                                collapsed: Container(
                                  decoration: BoxDecoration(),
                                ),
                                expanded: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 16.0, 0.0, 0.0),
                                  child: Text(
                                    'We understand that plans can change. We ask that you reschedule or cancel your session at least 24 hours ahead of time out of consideration for our coaches. Missed sessions or cancellations/reschedules within 24 hours will count as a used session.',
                                    style: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .override(
                                          fontFamily: 'Sofia Pro',
                                          useGoogleFonts: false,
                                          lineHeight: 1.16,
                                        ),
                                  ),
                                ),
                                theme: ExpandableThemeData(
                                  tapHeaderToExpand: true,
                                  tapBodyToExpand: false,
                                  tapBodyToCollapse: false,
                                  headerAlignment:
                                      ExpandablePanelHeaderAlignment.center,
                                  hasIcon: true,
                                  expandIcon: FFIcons.kplus,
                                  collapseIcon: FFIcons.kxmark,
                                  iconSize: 24.0,
                                  iconColor:
                                      FlutterFlowTheme.of(context).primary,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Divider(
                        thickness: 3.0,
                        color: Color(0x4DD8DADC),
                      ),
                      Container(
                        decoration: BoxDecoration(),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 16.0, 16.0, 16.0),
                          child: Container(
                            width: double.infinity,
                            color: Color(0x00000000),
                            child: ExpandableNotifier(
                              controller: _model.expandableController13,
                              child: ExpandablePanel(
                                header: Text(
                                  'I have a question which is not answered here',
                                  style: FlutterFlowTheme.of(context)
                                      .headlineMedium,
                                ),
                                collapsed: Container(
                                  decoration: BoxDecoration(),
                                ),
                                expanded: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 16.0, 0.0, 0.0),
                                  child: RichText(
                                    textScaleFactor:
                                        MediaQuery.of(context).textScaleFactor,
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text:
                                              'Please email your question to:  ',
                                          style: FlutterFlowTheme.of(context)
                                              .headlineSmall,
                                        ),
                                        TextSpan(
                                          text: 'info@quis-hq.com',
                                          style: FlutterFlowTheme.of(context)
                                              .headlineSmall
                                              .override(
                                                fontFamily: 'Sofia Pro',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                                fontWeight: FontWeight.w600,
                                                decoration:
                                                    TextDecoration.underline,
                                                useGoogleFonts: false,
                                              ),
                                          mouseCursor: SystemMouseCursors.click,
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () async {
                                              await launchURL(
                                                  'info@quis-hq.com');
                                            },
                                        )
                                      ],
                                      style: FlutterFlowTheme.of(context)
                                          .headlineSmall
                                          .override(
                                            fontFamily: 'Sofia Pro',
                                            useGoogleFonts: false,
                                            lineHeight: 1.16,
                                          ),
                                    ),
                                  ),
                                ),
                                theme: ExpandableThemeData(
                                  tapHeaderToExpand: true,
                                  tapBodyToExpand: false,
                                  tapBodyToCollapse: false,
                                  headerAlignment:
                                      ExpandablePanelHeaderAlignment.center,
                                  hasIcon: true,
                                  expandIcon: FFIcons.kplus,
                                  collapseIcon: FFIcons.kxmark,
                                  iconSize: 24.0,
                                  iconColor:
                                      FlutterFlowTheme.of(context).primary,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Divider(
                        thickness: 3.0,
                        color: Color(0x4DD8DADC),
                      ),
                    ],
                  ),
                ),
              ].addToEnd(SizedBox(height: 50.0)),
            ),
          ),
        ),
      ),
    );
  }
}
