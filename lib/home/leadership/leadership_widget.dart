import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/avatar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'leadership_model.dart';
export 'leadership_model.dart';

class LeadershipWidget extends StatefulWidget {
  const LeadershipWidget({super.key});

  @override
  State<LeadershipWidget> createState() => _LeadershipWidgetState();
}

class _LeadershipWidgetState extends State<LeadershipWidget> {
  late LeadershipModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LeadershipModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Leadership'});
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<UsersRecord>>(
      future: queryUsersRecordOnce(
        queryBuilder: (usersRecord) =>
            usersRecord.orderBy('karma', descending: true),
        limit: 10,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<UsersRecord> leadershipUsersRecordList = snapshot.data!;
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
                      logFirebaseEvent('LEADERSHIP_Container_4la3ucq0_ON_TAP');
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
                    'Leadership',
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
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 13.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                              width: 100.0,
                              decoration: BoxDecoration(),
                              child: Visibility(
                                visible: (leadershipUsersRecordList[0] !=
                                        null) &&
                                    (leadershipUsersRecordList[0].reference !=
                                        currentUserReference),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 47.0, 0.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width: 60.0,
                                        height: 60.0,
                                        child: Stack(
                                          children: [
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'LEADERSHIP_Container_3xa4zboz_ON_TAP');
                                                logFirebaseEvent(
                                                    'avatar_navigate_to');

                                                context.pushNamed(
                                                  'UserProfile',
                                                  queryParameters: {
                                                    'userItem': serializeParam(
                                                      leadershipUsersRecordList[
                                                          0],
                                                      ParamType.Document,
                                                    ),
                                                  }.withoutNulls,
                                                  extra: <String, dynamic>{
                                                    'userItem':
                                                        leadershipUsersRecordList[
                                                            0],
                                                  },
                                                );
                                              },
                                              child: wrapWithModel(
                                                model: _model.avatarModel1,
                                                updateCallback: () =>
                                                    setState(() {}),
                                                child: AvatarWidget(
                                                  diameter: 60.0,
                                                  imagePath:
                                                      leadershipUsersRecordList[
                                                              0]
                                                          .photoUrl,
                                                  isPremium: false,
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  1.0, 1.0),
                                              child: Container(
                                                width: 18.0,
                                                height: 18.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  shape: BoxShape.circle,
                                                ),
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Text(
                                                  '1',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Sofia Pro',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .white,
                                                        fontSize: 13.0,
                                                        useGoogleFonts: false,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 6.0, 0.0, 0.0),
                                        child: Text(
                                          leadershipUsersRecordList[0]
                                              .firstName,
                                          style: FlutterFlowTheme.of(context)
                                              .labelMedium
                                              .override(
                                                fontFamily: 'Sofia Pro',
                                                useGoogleFonts: false,
                                                lineHeight: 1.16,
                                              ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 4.0, 0.0, 0.0),
                                        child: Text(
                                          (double? karma) {
                                            return karma != null
                                                ? karma.toStringAsFixed(1)
                                                : '0';
                                          }(leadershipUsersRecordList[0].karma),
                                          style: FlutterFlowTheme.of(context)
                                              .labelMedium
                                              .override(
                                                fontFamily: 'Sofia Pro',
                                                useGoogleFonts: false,
                                                lineHeight: 1.16,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              width: 100.0,
                              decoration: BoxDecoration(),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  if (leadershipUsersRecordList[0] != null)
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          width: 93.0,
                                          height: 93.0,
                                          child: Stack(
                                            children: [
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Container(
                                                  width: 93.0,
                                                  height: 93.0,
                                                  child: custom_widgets
                                                      .DottedContainer(
                                                    width: 93.0,
                                                    height: 93.0,
                                                    colorDecoration:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                    intDash: 2,
                                                    intSpase: 2,
                                                    doubleStrokeWidth: 1.0,
                                                    doubleRadius: 100.0,
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: AuthUserStreamWidget(
                                                  builder: (context) =>
                                                      wrapWithModel(
                                                    model: _model.avatarModel2,
                                                    updateCallback: () =>
                                                        setState(() {}),
                                                    child: AvatarWidget(
                                                      diameter: 79.0,
                                                      imagePath:
                                                          currentUserPhoto,
                                                      isPremium: false,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.8, 0.8),
                                                child: Builder(
                                                  builder: (context) {
                                                    final userIndex =
                                                        leadershipUsersRecordList
                                                            .toList();
                                                    return Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: List.generate(
                                                          userIndex.length,
                                                          (userIndexIndex) {
                                                        final userIndexItem =
                                                            userIndex[
                                                                userIndexIndex];
                                                        return Visibility(
                                                          visible: userIndexItem
                                                                  .uid ==
                                                              currentUserUid,
                                                          child: Container(
                                                            width: 18.0,
                                                            height: 18.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              shape: BoxShape
                                                                  .circle,
                                                            ),
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Text(
                                                              (userIndexIndex +
                                                                      1)
                                                                  .toString(),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Sofia Pro',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .white,
                                                                    fontSize:
                                                                        13.0,
                                                                    useGoogleFonts:
                                                                        false,
                                                                  ),
                                                            ),
                                                          ),
                                                        );
                                                      }),
                                                    );
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 6.0, 0.0, 0.0),
                                          child: Text(
                                            'You',
                                            style: FlutterFlowTheme.of(context)
                                                .labelMedium
                                                .override(
                                                  fontFamily: 'Sofia Pro',
                                                  useGoogleFonts: false,
                                                  lineHeight: 1.16,
                                                ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 4.0, 0.0, 0.0),
                                          child: AuthUserStreamWidget(
                                            builder: (context) => Text(
                                              (double? karma) {
                                                return karma != null
                                                    ? karma.toStringAsFixed(1)
                                                    : '0';
                                              }(valueOrDefault(
                                                  currentUserDocument?.karma,
                                                  0.0)),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily: 'Sofia Pro',
                                                        useGoogleFonts: false,
                                                        lineHeight: 1.16,
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
                          Expanded(
                            child: Container(
                              width: 100.0,
                              decoration: BoxDecoration(),
                              child: Builder(
                                builder: (context) {
                                  if (functions
                                          .findUserIndexFromList(
                                              leadershipUsersRecordList
                                                  .toList(),
                                              currentUserUid)
                                          .toString() ==
                                      '1') {
                                    return Visibility(
                                      visible: (leadershipUsersRecordList[2] !=
                                              null) &&
                                          (leadershipUsersRecordList[2]
                                                  .reference !=
                                              currentUserReference),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 47.0, 0.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Container(
                                              width: 60.0,
                                              height: 60.0,
                                              child: Stack(
                                                children: [
                                                  InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      logFirebaseEvent(
                                                          'LEADERSHIP_Container_1b50aj3v_ON_TAP');
                                                      logFirebaseEvent(
                                                          'avatar_navigate_to');

                                                      context.pushNamed(
                                                        'UserProfile',
                                                        queryParameters: {
                                                          'userItem':
                                                              serializeParam(
                                                            leadershipUsersRecordList[
                                                                2],
                                                            ParamType.Document,
                                                          ),
                                                        }.withoutNulls,
                                                        extra: <String,
                                                            dynamic>{
                                                          'userItem':
                                                              leadershipUsersRecordList[
                                                                  2],
                                                        },
                                                      );
                                                    },
                                                    child: wrapWithModel(
                                                      model:
                                                          _model.avatarModel3,
                                                      updateCallback: () =>
                                                          setState(() {}),
                                                      child: AvatarWidget(
                                                        diameter: 60.0,
                                                        imagePath:
                                                            leadershipUsersRecordList[
                                                                    2]
                                                                .photoUrl,
                                                        isPremium: false,
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            1.0, 1.0),
                                                    child: Container(
                                                      width: 18.0,
                                                      height: 18.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        shape: BoxShape.circle,
                                                      ),
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Text(
                                                        '3',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Sofia Pro',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .white,
                                                                  fontSize:
                                                                      13.0,
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 6.0, 0.0, 0.0),
                                              child: Text(
                                                leadershipUsersRecordList[2]
                                                    .firstName,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'Sofia Pro',
                                                          useGoogleFonts: false,
                                                          lineHeight: 1.16,
                                                        ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 4.0, 0.0, 0.0),
                                              child: Text(
                                                (double? karma) {
                                                  return karma != null
                                                      ? karma.toStringAsFixed(1)
                                                      : '0';
                                                }(leadershipUsersRecordList[2]
                                                    .karma),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'Sofia Pro',
                                                          useGoogleFonts: false,
                                                          lineHeight: 1.16,
                                                        ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  } else {
                                    return Visibility(
                                      visible: (leadershipUsersRecordList[1] !=
                                              null) &&
                                          (leadershipUsersRecordList[1]
                                                  .reference !=
                                              currentUserReference),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 47.0, 0.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Container(
                                              width: 60.0,
                                              height: 60.0,
                                              child: Stack(
                                                children: [
                                                  InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      logFirebaseEvent(
                                                          'LEADERSHIP_Container_ru2ofmy5_ON_TAP');
                                                      logFirebaseEvent(
                                                          'avatar_navigate_to');

                                                      context.pushNamed(
                                                        'UserProfile',
                                                        queryParameters: {
                                                          'userItem':
                                                              serializeParam(
                                                            leadershipUsersRecordList[
                                                                1],
                                                            ParamType.Document,
                                                          ),
                                                        }.withoutNulls,
                                                        extra: <String,
                                                            dynamic>{
                                                          'userItem':
                                                              leadershipUsersRecordList[
                                                                  1],
                                                        },
                                                      );
                                                    },
                                                    child: wrapWithModel(
                                                      model:
                                                          _model.avatarModel4,
                                                      updateCallback: () =>
                                                          setState(() {}),
                                                      child: AvatarWidget(
                                                        diameter: 60.0,
                                                        imagePath:
                                                            leadershipUsersRecordList[
                                                                    1]
                                                                .photoUrl,
                                                        isPremium: false,
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            1.0, 1.0),
                                                    child: Container(
                                                      width: 18.0,
                                                      height: 18.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        shape: BoxShape.circle,
                                                      ),
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Text(
                                                        '2',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Sofia Pro',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .white,
                                                                  fontSize:
                                                                      13.0,
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 6.0, 0.0, 0.0),
                                              child: Text(
                                                leadershipUsersRecordList[1]
                                                    .firstName,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'Sofia Pro',
                                                          useGoogleFonts: false,
                                                          lineHeight: 1.16,
                                                        ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 4.0, 0.0, 0.0),
                                              child: Text(
                                                (double? karma) {
                                                  return karma != null
                                                      ? karma.toStringAsFixed(1)
                                                      : '0';
                                                }(leadershipUsersRecordList[1]
                                                    .karma),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'Sofia Pro',
                                                          useGoogleFonts: false,
                                                          lineHeight: 1.16,
                                                        ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  }
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                      child: Builder(
                        builder: (context) {
                          final user = leadershipUsersRecordList.toList();
                          return Column(
                            mainAxisSize: MainAxisSize.max,
                            children: List.generate(user.length, (userIndex) {
                              final userItem = user[userIndex];
                              return Visibility(
                                visible: (functions.findUserIndexFromList(
                                                leadershipUsersRecordList
                                                    .toList(),
                                                currentUserUid) >
                                            2) ||
                                        (functions.findUserIndexFromList(
                                                leadershipUsersRecordList
                                                    .toList(),
                                                currentUserUid) <=
                                            0)
                                    ? ((userIndex >= 2) &&
                                        (userItem.uid !=
                                            currentUserReference?.id))
                                    : ((userIndex >= 3) &&
                                        (userItem.uid !=
                                            currentUserReference?.id)),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 5.0, 0.0, 5.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'LEADERSHIP_Container_h3723ujt_ON_TAP');
                                      logFirebaseEvent('Container_navigate_to');

                                      context.pushNamed(
                                        'UserProfile',
                                        queryParameters: {
                                          'userItem': serializeParam(
                                            userItem,
                                            ParamType.Document,
                                          ),
                                        }.withoutNulls,
                                        extra: <String, dynamic>{
                                          'userItem': userItem,
                                        },
                                      );
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            15.0, 15.0, 35.0, 15.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              (userIndex + 1).toString(),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyLarge,
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      25.0, 0.0, 0.0, 0.0),
                                              child: AvatarWidget(
                                                key: Key(
                                                    'Keyxun_${userIndex}_of_${user.length}'),
                                                diameter: 40.0,
                                                imagePath: userItem.photoUrl,
                                                isPremium: false,
                                              ),
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        20.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  userItem.firstName,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelMedium,
                                                ),
                                              ),
                                            ),
                                            Icon(
                                              FFIcons.kchevronDownS,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 24.0,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                          );
                        },
                      ),
                    ),
                  ].addToEnd(SizedBox(height: 50.0)),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
