import '/backend/backend.dart';
import '/components/avatar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'leadership_orig_model.dart';
export 'leadership_orig_model.dart';

class LeadershipOrigWidget extends StatefulWidget {
  const LeadershipOrigWidget({Key? key}) : super(key: key);

  @override
  _LeadershipOrigWidgetState createState() => _LeadershipOrigWidgetState();
}

class _LeadershipOrigWidgetState extends State<LeadershipOrigWidget> {
  late LeadershipOrigModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LeadershipOrigModel());
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

    return FutureBuilder<List<UsersRecord>>(
      future: queryUsersRecordOnce(
        queryBuilder: (usersRecord) => usersRecord.orderBy('karma'),
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
        List<UsersRecord> leadershipOrigUsersRecordList = snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
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
                            size: 24.0,
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
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 13.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (leadershipOrigUsersRecordList[1] != null)
                          Padding(
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
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.pushNamed(
                                            'UserProfile',
                                            queryParameters: {
                                              'userItem': serializeParam(
                                                leadershipOrigUsersRecordList[
                                                    1],
                                                ParamType.Document,
                                              ),
                                            }.withoutNulls,
                                            extra: <String, dynamic>{
                                              'userItem':
                                                  leadershipOrigUsersRecordList[
                                                      1],
                                            },
                                          );
                                        },
                                        child: wrapWithModel(
                                          model: _model.avatarModel1,
                                          updateCallback: () => setState(() {}),
                                          child: AvatarWidget(
                                            diameter: 60.0,
                                            imagePath:
                                                leadershipOrigUsersRecordList[1]
                                                    .photoUrl,
                                            isPremium: false,
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(1.00, 1.00),
                                        child: Container(
                                          width: 18.0,
                                          height: 18.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            shape: BoxShape.circle,
                                          ),
                                          alignment:
                                              AlignmentDirectional(0.00, 0.00),
                                          child: Text(
                                            '1',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Sofia Pro',
                                                  color: FlutterFlowTheme.of(
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
                                    leadershipOrigUsersRecordList[1].firstName,
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
                                    leadershipOrigUsersRecordList[1]
                                        .karma
                                        .toString(),
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
                        if (leadershipOrigUsersRecordList[0] != null)
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                width: 93.0,
                                height: 93.0,
                                child: Stack(
                                  children: [
                                    Align(
                                      alignment:
                                          AlignmentDirectional(0.00, 0.00),
                                      child: Container(
                                        width: 93.0,
                                        height: 93.0,
                                        child: custom_widgets.DottedContainer(
                                          width: 93.0,
                                          height: 93.0,
                                          colorDecoration:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                          intDash: 2,
                                          intSpase: 2,
                                          doubleStrokeWidth: 1.0,
                                          doubleRadius: 100.0,
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment:
                                          AlignmentDirectional(0.00, 0.00),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.pushNamed(
                                            'UserProfile',
                                            queryParameters: {
                                              'userItem': serializeParam(
                                                leadershipOrigUsersRecordList[
                                                    0],
                                                ParamType.Document,
                                              ),
                                            }.withoutNulls,
                                            extra: <String, dynamic>{
                                              'userItem':
                                                  leadershipOrigUsersRecordList[
                                                      0],
                                            },
                                          );
                                        },
                                        child: wrapWithModel(
                                          model: _model.avatarModel2,
                                          updateCallback: () => setState(() {}),
                                          child: AvatarWidget(
                                            diameter: 79.0,
                                            imagePath:
                                                leadershipOrigUsersRecordList[0]
                                                    .photoUrl,
                                            isPremium: false,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment:
                                          AlignmentDirectional(0.80, 0.80),
                                      child: Container(
                                        width: 18.0,
                                        height: 18.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          shape: BoxShape.circle,
                                        ),
                                        alignment:
                                            AlignmentDirectional(0.00, 0.00),
                                        child: Text(
                                          '1',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Sofia Pro',
                                                color:
                                                    FlutterFlowTheme.of(context)
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
                                  leadershipOrigUsersRecordList[0].firstName,
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
                                  leadershipOrigUsersRecordList[0]
                                      .karma
                                      .toString(),
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
                        if (leadershipOrigUsersRecordList[2] != null)
                          Padding(
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
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.pushNamed(
                                            'UserProfile',
                                            queryParameters: {
                                              'userItem': serializeParam(
                                                leadershipOrigUsersRecordList[
                                                    2],
                                                ParamType.Document,
                                              ),
                                            }.withoutNulls,
                                            extra: <String, dynamic>{
                                              'userItem':
                                                  leadershipOrigUsersRecordList[
                                                      2],
                                            },
                                          );
                                        },
                                        child: wrapWithModel(
                                          model: _model.avatarModel3,
                                          updateCallback: () => setState(() {}),
                                          child: AvatarWidget(
                                            diameter: 60.0,
                                            imagePath:
                                                leadershipOrigUsersRecordList[2]
                                                    .photoUrl,
                                            isPremium: false,
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(1.00, 1.00),
                                        child: Container(
                                          width: 18.0,
                                          height: 18.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            shape: BoxShape.circle,
                                          ),
                                          alignment:
                                              AlignmentDirectional(0.00, 0.00),
                                          child: Text(
                                            '2',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Sofia Pro',
                                                  color: FlutterFlowTheme.of(
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
                                    leadershipOrigUsersRecordList[2].firstName,
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
                                    leadershipOrigUsersRecordList[2]
                                        .karma
                                        .toString(),
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
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                    child: Builder(
                      builder: (context) {
                        final user = leadershipOrigUsersRecordList.toList();
                        return Column(
                          mainAxisSize: MainAxisSize.max,
                          children: List.generate(user.length, (userIndex) {
                            final userItem = user[userIndex];
                            return Visibility(
                              visible: userIndex >= 3,
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
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
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        15.0, 15.0, 35.0, 15.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          (userIndex + 1).toString(),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge,
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  25.0, 0.0, 0.0, 0.0),
                                          child: AvatarWidget(
                                            key: Key(
                                                'Key2rc_${userIndex}_of_${user.length}'),
                                            diameter: 40.0,
                                            imagePath: userItem.photoUrl,
                                            isPremium: false,
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              userItem.firstName,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium,
                                            ),
                                          ),
                                        ),
                                        Icon(
                                          FFIcons.kchevronDownS,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 24.0,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }).divide(SizedBox(height: 10.0)),
                        );
                      },
                    ),
                  ),
                ].addToStart(SizedBox(height: 50.0)),
              ),
            ),
          ),
        );
      },
    );
  }
}
