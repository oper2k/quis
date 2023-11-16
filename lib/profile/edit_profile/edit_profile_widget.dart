import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/avatar_widget.dart';
import '/components/karma_plus_dialog_widget.dart';
import '/components/pick_bottom_sheet_widget.dart';
import '/components/pick_component_widget.dart';
import '/components/pseudo_drop_down_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:async';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'edit_profile_model.dart';
export 'edit_profile_model.dart';

class EditProfileWidget extends StatefulWidget {
  const EditProfileWidget({Key? key}) : super(key: key);

  @override
  _EditProfileWidgetState createState() => _EditProfileWidgetState();
}

class _EditProfileWidgetState extends State<EditProfileWidget> {
  late EditProfileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  late StreamSubscription<bool> _keyboardVisibilitySubscription;
  bool _isKeyboardVisible = false;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditProfileModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.groupRef = currentUserDocument?.group;
        _model.roleRef = currentUserDocument?.careerProfile?.role;
        _model.goalRoleRef = currentUserDocument?.careerProfile?.goalRole;
        _model.expYears = currentUserDocument?.careerProfile?.expYears;
      });
    });

    if (!isWeb) {
      _keyboardVisibilitySubscription =
          KeyboardVisibilityController().onChange.listen((bool visible) {
        setState(() {
          _isKeyboardVisible = visible;
        });
      });
    }

    _model.firstNameFieldController ??= TextEditingController(
        text: valueOrDefault(currentUserDocument?.firstName, ''));
    _model.firstNameFieldFocusNode ??= FocusNode();

    _model.lastNameFieldController ??= TextEditingController(
        text: valueOrDefault(currentUserDocument?.lastName, ''));
    _model.lastNameFieldFocusNode ??= FocusNode();

    _model.phoneFieldController ??=
        TextEditingController(text: currentPhoneNumber);
    _model.phoneFieldFocusNode ??= FocusNode();

    _model.linkedinFieldController ??= TextEditingController(
        text: valueOrDefault(currentUserDocument?.linkedinLink, ''));
    _model.linkedinFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    if (!isWeb) {
      _keyboardVisibilitySubscription.cancel();
    }
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
                'Edit profile',
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
                    child: StreamBuilder<List<GoalRoleRecord>>(
                      stream: queryGoalRoleRecord(),
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
                        List<GoalRoleRecord> containerGoalRoleRecordList =
                            snapshot.data!;
                        return Container(
                          decoration: BoxDecoration(),
                          child: Stack(
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 26.0, 0.0, 0.0),
                                        child: Container(
                                          width: 110.0,
                                          height: 110.0,
                                          child: Stack(
                                            children: [
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.00, 0.00),
                                                child: AuthUserStreamWidget(
                                                  builder: (context) =>
                                                      wrapWithModel(
                                                    model: _model.avatarModel,
                                                    updateCallback: () =>
                                                        setState(() {}),
                                                    child: AvatarWidget(
                                                      diameter: 100.0,
                                                      imagePath: _model
                                                                      .uploadedFileUrl !=
                                                                  null &&
                                                              _model.uploadedFileUrl !=
                                                                  ''
                                                          ? _model
                                                              .uploadedFileUrl
                                                          : currentUserPhoto,
                                                      isPremium: false,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    1.00, 1.00),
                                                child: InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    final selectedMedia =
                                                        await selectMediaWithSourceBottomSheet(
                                                      context: context,
                                                      maxWidth: 600.00,
                                                      maxHeight: 600.00,
                                                      imageQuality: 90,
                                                      allowPhoto: true,
                                                      pickerFontFamily:
                                                          'Roboto',
                                                    );
                                                    if (selectedMedia != null &&
                                                        selectedMedia.every((m) =>
                                                            validateFileFormat(
                                                                m.storagePath,
                                                                context))) {
                                                      setState(() => _model
                                                              .isDataUploading =
                                                          true);
                                                      var selectedUploadedFiles =
                                                          <FFUploadedFile>[];

                                                      var downloadUrls =
                                                          <String>[];
                                                      try {
                                                        showUploadMessage(
                                                          context,
                                                          'Uploading file...',
                                                          showLoading: true,
                                                        );
                                                        selectedUploadedFiles =
                                                            selectedMedia
                                                                .map((m) =>
                                                                    FFUploadedFile(
                                                                      name: m
                                                                          .storagePath
                                                                          .split(
                                                                              '/')
                                                                          .last,
                                                                      bytes: m
                                                                          .bytes,
                                                                      height: m
                                                                          .dimensions
                                                                          ?.height,
                                                                      width: m
                                                                          .dimensions
                                                                          ?.width,
                                                                      blurHash:
                                                                          m.blurHash,
                                                                    ))
                                                                .toList();

                                                        downloadUrls =
                                                            (await Future.wait(
                                                          selectedMedia.map(
                                                            (m) async =>
                                                                await uploadData(
                                                                    m.storagePath,
                                                                    m.bytes),
                                                          ),
                                                        ))
                                                                .where((u) =>
                                                                    u != null)
                                                                .map((u) => u!)
                                                                .toList();
                                                      } finally {
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .hideCurrentSnackBar();
                                                        _model.isDataUploading =
                                                            false;
                                                      }
                                                      if (selectedUploadedFiles
                                                                  .length ==
                                                              selectedMedia
                                                                  .length &&
                                                          downloadUrls.length ==
                                                              selectedMedia
                                                                  .length) {
                                                        setState(() {
                                                          _model.uploadedLocalFile =
                                                              selectedUploadedFiles
                                                                  .first;
                                                          _model.uploadedFileUrl =
                                                              downloadUrls
                                                                  .first;
                                                        });
                                                        showUploadMessage(
                                                            context,
                                                            'Success!');
                                                      } else {
                                                        setState(() {});
                                                        showUploadMessage(
                                                            context,
                                                            'Failed to upload data');
                                                        return;
                                                      }
                                                    }
                                                  },
                                                  child: Container(
                                                    width: 36.0,
                                                    height: 36.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: Icon(
                                                      FFIcons
                                                          .kfluentEdit20Regular,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      size: 24.0,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 26.0, 0.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 6.5, 12.0, 6.5),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Name',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .headlineSmall
                                                          .override(
                                                            fontFamily:
                                                                'Sofia Pro',
                                                            useGoogleFonts:
                                                                false,
                                                            lineHeight: 1.16,
                                                          ),
                                                    ),
                                                    AuthUserStreamWidget(
                                                      builder: (context) =>
                                                          TextFormField(
                                                        controller: _model
                                                            .firstNameFieldController,
                                                        focusNode: _model
                                                            .firstNameFieldFocusNode,
                                                        textCapitalization:
                                                            TextCapitalization
                                                                .words,
                                                        obscureText: false,
                                                        decoration:
                                                            InputDecoration(
                                                          isDense: true,
                                                          hintStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium,
                                                          enabledBorder:
                                                              InputBorder.none,
                                                          focusedBorder:
                                                              InputBorder.none,
                                                          errorBorder:
                                                              InputBorder.none,
                                                          focusedErrorBorder:
                                                              InputBorder.none,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineMedium,
                                                        validator: _model
                                                            .firstNameFieldControllerValidator
                                                            .asValidator(
                                                                context),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 6.5, 12.0, 6.5),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Surname',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .headlineSmall
                                                          .override(
                                                            fontFamily:
                                                                'Sofia Pro',
                                                            useGoogleFonts:
                                                                false,
                                                            lineHeight: 1.16,
                                                          ),
                                                    ),
                                                    AuthUserStreamWidget(
                                                      builder: (context) =>
                                                          TextFormField(
                                                        controller: _model
                                                            .lastNameFieldController,
                                                        focusNode: _model
                                                            .lastNameFieldFocusNode,
                                                        textCapitalization:
                                                            TextCapitalization
                                                                .words,
                                                        obscureText: false,
                                                        decoration:
                                                            InputDecoration(
                                                          isDense: true,
                                                          hintStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium,
                                                          enabledBorder:
                                                              InputBorder.none,
                                                          focusedBorder:
                                                              InputBorder.none,
                                                          errorBorder:
                                                              InputBorder.none,
                                                          focusedErrorBorder:
                                                              InputBorder.none,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineMedium,
                                                        validator: _model
                                                            .lastNameFieldControllerValidator
                                                            .asValidator(
                                                                context),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Container(
                                              height: 56.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  await showModalBottomSheet(
                                                    isScrollControlled: true,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    enableDrag: false,
                                                    context: context,
                                                    builder: (context) {
                                                      return WebViewAware(
                                                          child:
                                                              GestureDetector(
                                                        onTap: () => _model
                                                                .unfocusNode
                                                                .canRequestFocus
                                                            ? FocusScope.of(
                                                                    context)
                                                                .requestFocus(_model
                                                                    .unfocusNode)
                                                            : FocusScope.of(
                                                                    context)
                                                                .unfocus(),
                                                        child: Padding(
                                                          padding: MediaQuery
                                                              .viewInsetsOf(
                                                                  context),
                                                          child:
                                                              PickBottomSheetWidget(
                                                            stringList:
                                                                groupListGroupRecordList
                                                                    .map((e) =>
                                                                        e.name)
                                                                    .toList(),
                                                          ),
                                                        ),
                                                      ));
                                                    },
                                                  ).then((value) =>
                                                      safeSetState(() =>
                                                          _model.groupOutput =
                                                              value));

                                                  if (_model.groupOutput !=
                                                          null &&
                                                      _model.groupOutput !=
                                                          '') {
                                                    setState(() {
                                                      _model.groupRef =
                                                          groupListGroupRecordList
                                                              .where((e) =>
                                                                  e.name ==
                                                                  _model
                                                                      .groupOutput)
                                                              .toList()
                                                              .first
                                                              .reference;
                                                      _model.roleRef = null;
                                                    });
                                                  }

                                                  setState(() {});
                                                },
                                                child: wrapWithModel(
                                                  model: _model
                                                      .pseudoDropDownModel,
                                                  updateCallback: () =>
                                                      setState(() {}),
                                                  child: PseudoDropDownWidget(
                                                    defText: 'Industry',
                                                    text: groupListGroupRecordList
                                                                .where((e) =>
                                                                    e.reference ==
                                                                    _model
                                                                        .groupRef)
                                                                .toList()
                                                                .length >
                                                            0
                                                        ? groupListGroupRecordList
                                                            .where((e) =>
                                                                e.reference ==
                                                                _model.groupRef)
                                                            .toList()
                                                            .first
                                                            .name
                                                        : null,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        9.0, 17.0, 9.0, 12.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Expanded(
                                                      flex: 4,
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Text(
                                                            'Role',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Sofia Pro',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .accent3,
                                                                  useGoogleFonts:
                                                                      false,
                                                                  lineHeight:
                                                                      1.16,
                                                                ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        10.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                await showModalBottomSheet(
                                                                  isScrollControlled:
                                                                      true,
                                                                  backgroundColor:
                                                                      Colors
                                                                          .transparent,
                                                                  enableDrag:
                                                                      false,
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (context) {
                                                                    return WebViewAware(
                                                                        child:
                                                                            GestureDetector(
                                                                      onTap: () => _model
                                                                              .unfocusNode
                                                                              .canRequestFocus
                                                                          ? FocusScope.of(context).requestFocus(_model
                                                                              .unfocusNode)
                                                                          : FocusScope.of(context)
                                                                              .unfocus(),
                                                                      child:
                                                                          Padding(
                                                                        padding:
                                                                            MediaQuery.viewInsetsOf(context),
                                                                        child:
                                                                            PickBottomSheetWidget(
                                                                          stringList: roleListRoleRecordList
                                                                              .where((e) => e.group == _model.groupRef)
                                                                              .toList()
                                                                              .map((e) => e.name)
                                                                              .toList(),
                                                                        ),
                                                                      ),
                                                                    ));
                                                                  },
                                                                ).then((value) =>
                                                                    safeSetState(() =>
                                                                        _model.roleOutput =
                                                                            value));

                                                                if (_model.roleOutput !=
                                                                        null &&
                                                                    _model.roleOutput !=
                                                                        '') {
                                                                  setState(() {
                                                                    _model.roleRef = roleListRoleRecordList
                                                                        .where((e) =>
                                                                            e.name ==
                                                                            _model.roleOutput)
                                                                        .toList()
                                                                        .first
                                                                        .reference;
                                                                  });
                                                                }

                                                                setState(() {});
                                                              },
                                                              child:
                                                                  wrapWithModel(
                                                                model: _model
                                                                    .pickComponentModel1,
                                                                updateCallback:
                                                                    () => setState(
                                                                        () {}),
                                                                child:
                                                                    PickComponentWidget(
                                                                  pickedItem: _model
                                                                              .roleRef !=
                                                                          null
                                                                      ? roleListRoleRecordList
                                                                          .where((e) =>
                                                                              e.reference ==
                                                                              _model.roleRef)
                                                                          .toList()
                                                                          .first
                                                                          .name
                                                                      : ' ',
                                                                  isNotEmpty:
                                                                      _model.roleRef !=
                                                                          null,
                                                                  def: 'Role',
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex: 5,
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Text(
                                                            'Looking for',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Sofia Pro',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .accent3,
                                                                  useGoogleFonts:
                                                                      false,
                                                                  lineHeight:
                                                                      1.16,
                                                                ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        10.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                await showModalBottomSheet(
                                                                  isScrollControlled:
                                                                      true,
                                                                  backgroundColor:
                                                                      Colors
                                                                          .transparent,
                                                                  enableDrag:
                                                                      false,
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (context) {
                                                                    return WebViewAware(
                                                                        child:
                                                                            GestureDetector(
                                                                      onTap: () => _model
                                                                              .unfocusNode
                                                                              .canRequestFocus
                                                                          ? FocusScope.of(context).requestFocus(_model
                                                                              .unfocusNode)
                                                                          : FocusScope.of(context)
                                                                              .unfocus(),
                                                                      child:
                                                                          Padding(
                                                                        padding:
                                                                            MediaQuery.viewInsetsOf(context),
                                                                        child:
                                                                            PickBottomSheetWidget(
                                                                          stringList: containerGoalRoleRecordList
                                                                              .map((e) => e.name)
                                                                              .toList(),
                                                                        ),
                                                                      ),
                                                                    ));
                                                                  },
                                                                ).then((value) =>
                                                                    safeSetState(() =>
                                                                        _model.goalroleOutput =
                                                                            value));

                                                                if (_model.goalroleOutput !=
                                                                        null &&
                                                                    _model.goalroleOutput !=
                                                                        '') {
                                                                  setState(() {
                                                                    _model.goalRoleRef = containerGoalRoleRecordList
                                                                        .where((e) =>
                                                                            e.name ==
                                                                            _model.goalroleOutput)
                                                                        .toList()
                                                                        .first
                                                                        .reference;
                                                                  });
                                                                }

                                                                setState(() {});
                                                              },
                                                              child:
                                                                  wrapWithModel(
                                                                model: _model
                                                                    .pickComponentModel2,
                                                                updateCallback:
                                                                    () => setState(
                                                                        () {}),
                                                                child:
                                                                    PickComponentWidget(
                                                                  pickedItem: _model
                                                                              .goalRoleRef !=
                                                                          null
                                                                      ? containerGoalRoleRecordList
                                                                          .where((e) =>
                                                                              e.reference ==
                                                                              _model.goalRoleRef)
                                                                          .toList()
                                                                          .first
                                                                          .name
                                                                      : ' ',
                                                                  isNotEmpty:
                                                                      _model.goalRoleRef !=
                                                                          null,
                                                                  def:
                                                                      'Looking for',
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex: 4,
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Text(
                                                            'Years',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Sofia Pro',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .accent3,
                                                                  useGoogleFonts:
                                                                      false,
                                                                  lineHeight:
                                                                      1.16,
                                                                ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        10.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                await showModalBottomSheet(
                                                                  isScrollControlled:
                                                                      true,
                                                                  backgroundColor:
                                                                      Colors
                                                                          .transparent,
                                                                  enableDrag:
                                                                      false,
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (context) {
                                                                    return WebViewAware(
                                                                        child:
                                                                            GestureDetector(
                                                                      onTap: () => _model
                                                                              .unfocusNode
                                                                              .canRequestFocus
                                                                          ? FocusScope.of(context).requestFocus(_model
                                                                              .unfocusNode)
                                                                          : FocusScope.of(context)
                                                                              .unfocus(),
                                                                      child:
                                                                          Padding(
                                                                        padding:
                                                                            MediaQuery.viewInsetsOf(context),
                                                                        child:
                                                                            PickBottomSheetWidget(
                                                                          stringList:
                                                                              functions.generateExpYears(20),
                                                                        ),
                                                                      ),
                                                                    ));
                                                                  },
                                                                ).then((value) =>
                                                                    safeSetState(() =>
                                                                        _model.expYearsOutput =
                                                                            value));

                                                                if (_model.expYearsOutput !=
                                                                        null &&
                                                                    _model.expYearsOutput !=
                                                                        '') {
                                                                  setState(() {
                                                                    _model.expYears =
                                                                        int.parse(
                                                                            _model.expYearsOutput!);
                                                                  });
                                                                }

                                                                setState(() {});
                                                              },
                                                              child:
                                                                  wrapWithModel(
                                                                model: _model
                                                                    .pickComponentModel3,
                                                                updateCallback:
                                                                    () => setState(
                                                                        () {}),
                                                                child:
                                                                    PickComponentWidget(
                                                                  pickedItem: _model
                                                                              .expYears !=
                                                                          null
                                                                      ? _model
                                                                          .expYears
                                                                          ?.toString()
                                                                      : ' ',
                                                                  isNotEmpty:
                                                                      _model.expYears !=
                                                                          null,
                                                                  def: 'Years',
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ].divide(
                                                      SizedBox(width: 6.0)),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 6.5, 12.0, 6.5),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Phone number',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .headlineSmall
                                                          .override(
                                                            fontFamily:
                                                                'Sofia Pro',
                                                            useGoogleFonts:
                                                                false,
                                                            lineHeight: 1.16,
                                                          ),
                                                    ),
                                                    AuthUserStreamWidget(
                                                      builder: (context) =>
                                                          TextFormField(
                                                        controller: _model
                                                            .phoneFieldController,
                                                        focusNode: _model
                                                            .phoneFieldFocusNode,
                                                        obscureText: false,
                                                        decoration:
                                                            InputDecoration(
                                                          isDense: true,
                                                          hintStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium,
                                                          enabledBorder:
                                                              InputBorder.none,
                                                          focusedBorder:
                                                              InputBorder.none,
                                                          errorBorder:
                                                              InputBorder.none,
                                                          focusedErrorBorder:
                                                              InputBorder.none,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineMedium,
                                                        keyboardType:
                                                            TextInputType.phone,
                                                        validator: _model
                                                            .phoneFieldControllerValidator
                                                            .asValidator(
                                                                context),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 6.5, 12.0, 6.5),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Link to LinkedIn',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .headlineSmall
                                                          .override(
                                                            fontFamily:
                                                                'Sofia Pro',
                                                            useGoogleFonts:
                                                                false,
                                                            lineHeight: 1.16,
                                                          ),
                                                    ),
                                                    AuthUserStreamWidget(
                                                      builder: (context) =>
                                                          TextFormField(
                                                        controller: _model
                                                            .linkedinFieldController,
                                                        focusNode: _model
                                                            .linkedinFieldFocusNode,
                                                        obscureText: false,
                                                        decoration:
                                                            InputDecoration(
                                                          isDense: true,
                                                          hintStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium,
                                                          enabledBorder:
                                                              InputBorder.none,
                                                          focusedBorder:
                                                              InputBorder.none,
                                                          errorBorder:
                                                              InputBorder.none,
                                                          focusedErrorBorder:
                                                              InputBorder.none,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Sofia Pro',
                                                                  decoration:
                                                                      TextDecoration
                                                                          .underline,
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                        keyboardType:
                                                            TextInputType.url,
                                                        validator: _model
                                                            .linkedinFieldControllerValidator
                                                            .asValidator(
                                                                context),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ].divide(SizedBox(height: 12.0)),
                                        ),
                                      ),
                                    ].addToEnd(SizedBox(height: 120.0)),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.00, 1.00),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Builder(
                                      builder: (context) => Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 10.0),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            await currentUserReference!
                                                .update(createUsersRecordData(
                                              phoneNumber: _model
                                                  .phoneFieldController.text,
                                              firstName: _model
                                                  .firstNameFieldController
                                                  .text,
                                              lastName: _model
                                                  .lastNameFieldController.text,
                                              linkedinLink: _model
                                                  .linkedinFieldController.text,
                                              group: _model.groupRef,
                                              careerProfile:
                                                  createCareerProfileStruct(
                                                role: _model.roleRef,
                                                goalRole: _model.goalRoleRef,
                                                expYears: _model.expYears,
                                                clearUnsetFields: false,
                                              ),
                                            ));
                                            if (_model.roleRef == null) {
                                              await currentUserReference!
                                                  .update(createUsersRecordData(
                                                careerProfile:
                                                    createCareerProfileStruct(
                                                  fieldValues: {
                                                    'goal_role':
                                                        FieldValue.delete(),
                                                  },
                                                  clearUnsetFields: false,
                                                ),
                                              ));
                                            }
                                            if (_model.uploadedFileUrl !=
                                                    null &&
                                                _model.uploadedFileUrl != '') {
                                              await currentUserReference!
                                                  .update(createUsersRecordData(
                                                photoUrl:
                                                    _model.uploadedFileUrl,
                                              ));
                                            }
                                            if (!valueOrDefault<bool>(
                                                    currentUserDocument
                                                        ?.isProfileCompleted,
                                                    false) &&
                                                ((_model
                                                                .firstNameFieldController
                                                                .text !=
                                                            null &&
                                                        _model.firstNameFieldController.text !=
                                                            '') &&
                                                    (_model.lastNameFieldController.text != null &&
                                                        _model.lastNameFieldController.text !=
                                                            '') &&
                                                    (_model.phoneFieldController.text != null &&
                                                        _model
                                                                .phoneFieldController
                                                                .text !=
                                                            '') &&
                                                    (_model.linkedinFieldController.text != null &&
                                                        _model
                                                                .linkedinFieldController
                                                                .text !=
                                                            '')) &&
                                                (currentUserDocument!.careerProfile
                                                        .hasRole() &&
                                                    currentUserDocument!
                                                        .careerProfile
                                                        .hasGoalRole() &&
                                                    currentUserDocument!
                                                        .careerProfile
                                                        .hasExpYears())) {
                                              await currentUserReference!
                                                  .update({
                                                ...createUsersRecordData(
                                                  isProfileCompleted: true,
                                                ),
                                                ...mapToFirestore(
                                                  {
                                                    'karma':
                                                        FieldValue.increment(
                                                            0.5),
                                                  },
                                                ),
                                              });
                                              await showAlignedDialog(
                                                context: context,
                                                isGlobal: true,
                                                avoidOverflow: false,
                                                targetAnchor:
                                                    AlignmentDirectional(
                                                            0.0, 0.0)
                                                        .resolve(
                                                            Directionality.of(
                                                                context)),
                                                followerAnchor:
                                                    AlignmentDirectional(
                                                            0.0, 0.0)
                                                        .resolve(
                                                            Directionality.of(
                                                                context)),
                                                builder: (dialogContext) {
                                                  return Material(
                                                    color: Colors.transparent,
                                                    child: WebViewAware(
                                                        child: GestureDetector(
                                                      onTap: () => _model
                                                              .unfocusNode
                                                              .canRequestFocus
                                                          ? FocusScope.of(
                                                                  context)
                                                              .requestFocus(_model
                                                                  .unfocusNode)
                                                          : FocusScope.of(
                                                                  context)
                                                              .unfocus(),
                                                      child:
                                                          KarmaPlusDialogWidget(
                                                        karmaPoints: 0.5,
                                                      ),
                                                    )),
                                                  );
                                                },
                                              ).then(
                                                  (value) => setState(() {}));
                                            }

                                            context.goNamed('MyProfile');
                                          },
                                          text: 'Save',
                                          options: FFButtonOptions(
                                            width: double.infinity,
                                            height: 52.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    24.0, 0.0, 24.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .headlineLarge
                                                    .override(
                                                      fontFamily: 'Sofia Pro',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .white,
                                                      useGoogleFonts: false,
                                                    ),
                                            elevation: 0.0,
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 0.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                    if (!(isWeb
                                        ? MediaQuery.viewInsetsOf(context)
                                                .bottom >
                                            0
                                        : _isKeyboardVisible))
                                      Container(
                                        height: 40.0,
                                        decoration: BoxDecoration(),
                                      ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
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
