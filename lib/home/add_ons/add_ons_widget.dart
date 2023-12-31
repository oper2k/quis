import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/backend/schema/structs/index.dart';
import '/components/pick_bottom_sheet_widget.dart';
import '/components/pseudo_drop_down_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'add_ons_model.dart';
export 'add_ons_model.dart';

class AddOnsWidget extends StatefulWidget {
  const AddOnsWidget({Key? key}) : super(key: key);

  @override
  _AddOnsWidgetState createState() => _AddOnsWidgetState();
}

class _AddOnsWidgetState extends State<AddOnsWidget> {
  late AddOnsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddOnsModel());

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
                'Add-ons',
                style: FlutterFlowTheme.of(context).headlineLarge,
              ),
              Container(
                width: 40.0,
                height: 40.0,
                decoration: BoxDecoration(),
                alignment: AlignmentDirectional(-1.00, 0.00),
              ),
            ],
          ),
          actions: [],
          centerTitle: false,
          toolbarHeight: 40.0,
          elevation: 0.0,
        ),
        body: Stack(
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.00, 0.00),
                      child: Lottie.asset(
                        'assets/lottie_animations/animation_lnz09grs.json',
                        width: 220.0,
                        height: 200.0,
                        fit: BoxFit.cover,
                        animate: true,
                      ),
                    ),
                    Text(
                      'Get expert coaching, mock interviews, and more',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).headlineLarge,
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                      child: Text(
                        'Connect with an expert in your field to practice mock interviews, review your resume in-person, or create a study plan.',
                        textAlign: TextAlign.center,
                        style:
                            FlutterFlowTheme.of(context).headlineSmall.override(
                                  fontFamily: 'Sofia Pro',
                                  fontWeight: FontWeight.w300,
                                  useGoogleFonts: false,
                                  lineHeight: 1.16,
                                ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(-1.00, 0.00),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 18.0, 0.0, 0.0),
                        child: Text(
                          'Choose service',
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
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 0.0),
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
                                    stringList: FFAppState()
                                        .addOns
                                        .map((e) => e.name)
                                        .toList(),
                                  ),
                                ),
                              ));
                            },
                          ).then((value) =>
                              safeSetState(() => _model.serviceOutput = value));

                          if (_model.serviceOutput != null &&
                              _model.serviceOutput != '') {
                            setState(() {
                              _model.pickedAddon = FFAppState()
                                  .addOns
                                  .where((e) => e.name == _model.serviceOutput)
                                  .toList()
                                  .first;
                              _model.isServiceValidated = true;
                            });
                          }

                          setState(() {});
                        },
                        child: Container(
                          height: 52.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(
                              color: _model.isServiceValidated
                                  ? Color(0x00000000)
                                  : FlutterFlowTheme.of(context).error,
                            ),
                          ),
                          child: wrapWithModel(
                            model: _model.pseudoDropDownModel,
                            updateCallback: () => setState(() {}),
                            child: PseudoDropDownWidget(
                              defText: 'Services',
                              text: _model.pickedAddon?.name,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(-1.00, 0.00),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                        child: Text(
                          'Your comment',
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
                    ),
                    Form(
                      key: _model.formKey,
                      autovalidateMode: AutovalidateMode.disabled,
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 0.0),
                        child: TextFormField(
                          controller: _model.textController,
                          focusNode: _model.textFieldFocusNode,
                          obscureText: false,
                          decoration: InputDecoration(
                            hintText: 'My comment here',
                            hintStyle: FlutterFlowTheme.of(context)
                                .headlineSmall
                                .override(
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
                          validator: _model.textControllerValidator
                              .asValidator(context),
                        ),
                      ),
                    ),
                    if ((_model.pickedAddon?.name == 'CV writing') ||
                        (_model.pickedAddon?.name == 'CV review'))
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(-1.00, 0.00),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 0.0),
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
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(
                                  color: _model.isCVValidated
                                      ? Color(0x00000000)
                                      : FlutterFlowTheme.of(context).error,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      _model.uploadedFileUrl != null &&
                                              _model.uploadedFileUrl != ''
                                          ? 'uploaded file'
                                          : 'Please attach here your CV',
                                      style: FlutterFlowTheme.of(context)
                                          .headlineSmall
                                          .override(
                                            fontFamily: 'Sofia Pro',
                                            color: _model.uploadedFileUrl !=
                                                        null &&
                                                    _model.uploadedFileUrl != ''
                                                ? FlutterFlowTheme.of(context)
                                                    .primaryText
                                                : FlutterFlowTheme.of(context)
                                                    .accent2,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        final selectedFiles = await selectFiles(
                                          multiFile: false,
                                        );
                                        if (selectedFiles != null) {
                                          setState(() =>
                                              _model.isDataUploading = true);
                                          var selectedUploadedFiles =
                                              <FFUploadedFile>[];

                                          var downloadUrls = <String>[];
                                          try {
                                            selectedUploadedFiles =
                                                selectedFiles
                                                    .map((m) => FFUploadedFile(
                                                          name: m.storagePath
                                                              .split('/')
                                                              .last,
                                                          bytes: m.bytes,
                                                        ))
                                                    .toList();

                                            downloadUrls = (await Future.wait(
                                              selectedFiles.map(
                                                (f) async => await uploadData(
                                                    f.storagePath, f.bytes),
                                              ),
                                            ))
                                                .where((u) => u != null)
                                                .map((u) => u!)
                                                .toList();
                                          } finally {
                                            _model.isDataUploading = false;
                                          }
                                          if (selectedUploadedFiles.length ==
                                                  selectedFiles.length &&
                                              downloadUrls.length ==
                                                  selectedFiles.length) {
                                            setState(() {
                                              _model.uploadedLocalFile =
                                                  selectedUploadedFiles.first;
                                              _model.uploadedFileUrl =
                                                  downloadUrls.first;
                                            });
                                          } else {
                                            setState(() {});
                                            return;
                                          }
                                        }

                                        setState(() {
                                          _model.isCVValidated = true;
                                        });
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(),
                                        child: Icon(
                                          FFIcons.kiconamoonAttachmentLight1,
                                          color: FlutterFlowTheme.of(context)
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
                        ],
                      ),
                    Align(
                      alignment: AlignmentDirectional(1.00, 0.00),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 23.0, 0.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            SizedBox(
                              width: 170.0,
                              child: Divider(
                                height: 1.0,
                                thickness: 1.0,
                                color: FlutterFlowTheme.of(context).accent3,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 6.0, 0.0, 0.0),
                              child: Text(
                                '${valueOrDefault<String>(
                                  _model.pickedAddon?.price?.toString(),
                                  '0',
                                )} AED',
                                style:
                                    FlutterFlowTheme.of(context).headlineLarge,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 19.0, 0.0, 0.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          if (_model.pickedAddon != null) {
                            setState(() {
                              _model.isServiceValidated = true;
                            });
                          } else {
                            setState(() {
                              _model.isServiceValidated = false;
                            });
                            if (_model.uploadedFileUrl != null &&
                                _model.uploadedFileUrl != '') {
                              setState(() {
                                _model.isCVValidated = true;
                              });
                            } else {
                              setState(() {
                                _model.isCVValidated = false;
                              });
                            }

                            if (_model.formKey.currentState == null ||
                                !_model.formKey.currentState!.validate()) {
                              return;
                            }
                            return;
                          }

                          if (_model.uploadedFileUrl != null &&
                              _model.uploadedFileUrl != '') {
                            setState(() {
                              _model.isCVValidated = true;
                            });
                          } else {
                            setState(() {
                              _model.isCVValidated = false;
                            });
                            if (_model.formKey.currentState == null ||
                                !_model.formKey.currentState!.validate()) {
                              return;
                            }
                            return;
                          }
                        },
                        text: 'Order Service',
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
                    Align(
                      alignment: AlignmentDirectional(-1.00, 0.00),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 37.0, 0.0, 0.0),
                        child: Text(
                          'FAQ',
                          style: FlutterFlowTheme.of(context).headlineLarge,
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
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
                                        'How will I pay for the service?',
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
                                          'After submitting your service order, we will contact you via email to provide further instructions and request any additional information, if necessary. ',
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
                                            ExpandablePanelHeaderAlignment
                                                .center,
                                        hasIcon: true,
                                        expandIcon: FFIcons.kplus,
                                        collapseIcon: FFIcons.kxmark,
                                        iconSize: 24.0,
                                        iconColor: FlutterFlowTheme.of(context)
                                            .primary,
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
                                        'How does Quis interview coaching work? ',
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
                                            ExpandablePanelHeaderAlignment
                                                .center,
                                        hasIcon: true,
                                        expandIcon: FFIcons.kplus,
                                        collapseIcon: FFIcons.kxmark,
                                        iconSize: 24.0,
                                        iconColor: FlutterFlowTheme.of(context)
                                            .primary,
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
                                            ExpandablePanelHeaderAlignment
                                                .center,
                                        hasIcon: true,
                                        expandIcon: FFIcons.kplus,
                                        collapseIcon: FFIcons.kxmark,
                                        iconSize: 24.0,
                                        iconColor: FlutterFlowTheme.of(context)
                                            .primary,
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
                                        'Who are Quis Coaches?',
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
                                          'Quis Coaches are current Recruiters, ex-Recruiters and industry experts who have been hand-picked and vetted by Quis. Coaches are rigorously selected and checked before providing any kind of services.',
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
                                            ExpandablePanelHeaderAlignment
                                                .center,
                                        hasIcon: true,
                                        expandIcon: FFIcons.kplus,
                                        collapseIcon: FFIcons.kxmark,
                                        iconSize: 24.0,
                                        iconColor: FlutterFlowTheme.of(context)
                                            .primary,
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
                                        'Does coaching work in all time zones?',
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
                                          'Yes! We have coaches who can service any time zone you are in. You can preview the upcoming availability for each coach on their profile page.',
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
                                            ExpandablePanelHeaderAlignment
                                                .center,
                                        hasIcon: true,
                                        expandIcon: FFIcons.kplus,
                                        collapseIcon: FFIcons.kxmark,
                                        iconSize: 24.0,
                                        iconColor: FlutterFlowTheme.of(context)
                                            .primary,
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
                                        'Do unused sessions expire?',
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
                                          'Unused sessions never expire and can be redeemed for any type of 45 min coaching session',
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
                                            ExpandablePanelHeaderAlignment
                                                .center,
                                        hasIcon: true,
                                        expandIcon: FFIcons.kplus,
                                        collapseIcon: FFIcons.kxmark,
                                        iconSize: 24.0,
                                        iconColor: FlutterFlowTheme.of(context)
                                            .primary,
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
                                    controller: _model.expandableController7,
                                    child: ExpandablePanel(
                                      header: Text(
                                        'Who are Quis Coaches?',
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
                                          'Quis Coaches are current Recruiters, ex-Recruiters and industry experts who have been hand-picked and vetted by Quis. Coaches are rigorously selected and checked before providing any kind of services.',
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
                                            ExpandablePanelHeaderAlignment
                                                .center,
                                        hasIcon: true,
                                        expandIcon: FFIcons.kplus,
                                        collapseIcon: FFIcons.kxmark,
                                        iconSize: 24.0,
                                        iconColor: FlutterFlowTheme.of(context)
                                            .primary,
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
                                        'Can I get a refund for an unused session?',
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
                                              MediaQuery.of(context)
                                                  .textScaleFactor,
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text:
                                                    'Unused sessions are eligible for a refund within six months of purchase. Please note that refunds for unused sessions in multi-session packs do not include the multi-session discount. Your refund will be calculated based on the face value of a session (inclusive of promotions), or the next closest pricing option. For example, if you purchased a 5-session pack and only redeemed 3 sessions, you will be refunded the price difference between the 5-session pack and the 3-session pack. For any questions, please email ',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineSmall,
                                              ),
                                              TextSpan(
                                                text: 'info@quis-hq.com',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .headlineSmall
                                                    .override(
                                                      fontFamily: 'Sofia Pro',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondary,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      decoration: TextDecoration
                                                          .underline,
                                                      useGoogleFonts: false,
                                                    ),
                                                mouseCursor:
                                                    SystemMouseCursors.click,
                                                recognizer:
                                                    TapGestureRecognizer()
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
                                            ExpandablePanelHeaderAlignment
                                                .center,
                                        hasIcon: true,
                                        expandIcon: FFIcons.kplus,
                                        collapseIcon: FFIcons.kxmark,
                                        iconSize: 24.0,
                                        iconColor: FlutterFlowTheme.of(context)
                                            .primary,
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
                                        'I need coaching ASAP!',
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
                                          'Please fill up the Add-ons [LINK to ADD-ONS] form and we will get in touch with you.',
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
                                            ExpandablePanelHeaderAlignment
                                                .center,
                                        hasIcon: true,
                                        expandIcon: FFIcons.kplus,
                                        collapseIcon: FFIcons.kxmark,
                                        iconSize: 24.0,
                                        iconColor: FlutterFlowTheme.of(context)
                                            .primary,
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
                                        'Does my coaching purchase the membership of Quis?',
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
                                          'The purchase of a coaching session does not include Quis membership. ',
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
                                            ExpandablePanelHeaderAlignment
                                                .center,
                                        hasIcon: true,
                                        expandIcon: FFIcons.kplus,
                                        collapseIcon: FFIcons.kxmark,
                                        iconSize: 24.0,
                                        iconColor: FlutterFlowTheme.of(context)
                                            .primary,
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
                                            ExpandablePanelHeaderAlignment
                                                .center,
                                        hasIcon: true,
                                        expandIcon: FFIcons.kplus,
                                        collapseIcon: FFIcons.kxmark,
                                        iconSize: 24.0,
                                        iconColor: FlutterFlowTheme.of(context)
                                            .primary,
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
                                              MediaQuery.of(context)
                                                  .textScaleFactor,
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text:
                                                    'Please email your question to: ',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineSmall,
                                              ),
                                              TextSpan(
                                                text: 'info@quis-hq.com',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .headlineSmall
                                                    .override(
                                                      fontFamily: 'Sofia Pro',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondary,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      decoration: TextDecoration
                                                          .underline,
                                                      useGoogleFonts: false,
                                                    ),
                                                mouseCursor:
                                                    SystemMouseCursors.click,
                                                recognizer:
                                                    TapGestureRecognizer()
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
                                            ExpandablePanelHeaderAlignment
                                                .center,
                                        hasIcon: true,
                                        expandIcon: FFIcons.kplus,
                                        collapseIcon: FFIcons.kxmark,
                                        iconSize: 24.0,
                                        iconColor: FlutterFlowTheme.of(context)
                                            .primary,
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
                  ].addToEnd(SizedBox(height: 50.0)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
