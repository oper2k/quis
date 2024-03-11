import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/avatar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'matched_users_model.dart';
export 'matched_users_model.dart';

class MatchedUsersWidget extends StatefulWidget {
  const MatchedUsersWidget({
    super.key,
    required this.likedUsersList,
  });

  final List<UsersRecord>? likedUsersList;

  @override
  State<MatchedUsersWidget> createState() => _MatchedUsersWidgetState();
}

class _MatchedUsersWidgetState extends State<MatchedUsersWidget> {
  late MatchedUsersModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MatchedUsersModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'MatchedUsers'});
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
                  logFirebaseEvent('MATCHED_USERS_Container_d8p1mce2_ON_TAP');
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
                'People I matched with',
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
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            AuthUserStreamWidget(
              builder: (context) => Text(
                (currentUserDocument?.likedUsers?.toList() ?? [])
                    .length
                    .toString(),
                style: FlutterFlowTheme.of(context).bodyMedium,
              ),
            ),
            AuthUserStreamWidget(
              builder: (context) => Text(
                (currentUserDocument?.likedBy?.toList() ?? [])
                    .length
                    .toString(),
                style: FlutterFlowTheme.of(context).bodyMedium,
              ),
            ),
            AuthUserStreamWidget(
              builder: (context) => Text(
                (currentUserDocument?.likedUsers?.toList() ?? [])
                    .where((e) => (currentUserDocument?.likedBy?.toList() ?? [])
                        .contains(e.refUser))
                    .toList()
                    .length
                    .toString(),
                style: FlutterFlowTheme.of(context).bodyMedium,
              ),
            ),
            AuthUserStreamWidget(
              builder: (context) => Builder(
                builder: (context) {
                  final t1 = (currentUserDocument?.likedUsers?.toList() ?? [])
                      .toList();
                  return Column(
                    mainAxisSize: MainAxisSize.max,
                    children: List.generate(t1.length, (t1Index) {
                      final t1Item = t1[t1Index];
                      return Text(
                        valueOrDefault<String>(
                          t1Item.refUser?.id,
                          '-1',
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium,
                      );
                    }),
                  );
                },
              ),
            ),
            AuthUserStreamWidget(
              builder: (context) => Builder(
                builder: (context) {
                  final dd =
                      (currentUserDocument?.likedBy?.toList() ?? []).toList();
                  return Column(
                    mainAxisSize: MainAxisSize.max,
                    children: List.generate(dd.length, (ddIndex) {
                      final ddItem = dd[ddIndex];
                      return Text(
                        valueOrDefault<String>(
                          ddItem.id,
                          '-1',
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium,
                      );
                    }),
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
              child: AuthUserStreamWidget(
                builder: (context) => Builder(
                  builder: (context) {
                    final matchedUsers =
                        (currentUserDocument?.likedUsers?.toList() ?? [])
                            .where((e) =>
                                (currentUserDocument?.likedBy?.toList() ?? [])
                                    .contains(e.refUser))
                            .toList();
                    return ListView.separated(
                      padding: EdgeInsets.fromLTRB(
                        0,
                        10.0,
                        0,
                        50.0,
                      ),
                      scrollDirection: Axis.vertical,
                      itemCount: matchedUsers.length,
                      separatorBuilder: (_, __) => SizedBox(height: 8.0),
                      itemBuilder: (context, matchedUsersIndex) {
                        final matchedUsersItem =
                            matchedUsers[matchedUsersIndex];
                        return StreamBuilder<UsersRecord>(
                          stream: UsersRecord.getDocument(
                              matchedUsersItem.refUser!),
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
                            final containerUsersRecord = snapshot.data!;
                            return InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent(
                                    'MATCHED_USERS_Container_5ee9k8xu_ON_TAP');
                                logFirebaseEvent('Container_navigate_to');

                                context.pushNamed(
                                  'UserProfile',
                                  queryParameters: {
                                    'userItem': serializeParam(
                                      containerUsersRecord,
                                      ParamType.Document,
                                    ),
                                    'isLinkedIn': serializeParam(
                                      true,
                                      ParamType.bool,
                                    ),
                                  }.withoutNulls,
                                  extra: <String, dynamic>{
                                    'userItem': containerUsersRecord,
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
                                      7.0, 5.0, 7.0, 5.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      AvatarWidget(
                                        key: Key(
                                            'Key513_${matchedUsersIndex}_of_${matchedUsers.length}'),
                                        diameter: 50.0,
                                        imagePath:
                                            containerUsersRecord.photoUrl,
                                        isPremium: false,
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 0.0, 0.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 6.0,
                                                                15.0, 6.0),
                                                    child: Text(
                                                      '${containerUsersRecord.firstName} ${containerUsersRecord.lastName}',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .headlineMedium,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 6.0,
                                                                10.0, 6.0),
                                                    child: Text(
                                                      matchedUsersItem.top,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                5.0, 0.0),
                                                    child: Icon(
                                                      FFIcons
                                                          .kclarityCalendarLine,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      size: 18.0,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 6.0,
                                                                10.0, 6.0),
                                                    child: Text(
                                                      dateTimeFormat(
                                                          'd/M/y',
                                                          matchedUsersItem
                                                              .date!),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelSmall,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              if (responsiveVisibility(
                                                context: context,
                                                phone: false,
                                                tablet: false,
                                                tabletLandscape: false,
                                                desktop: false,
                                              ))
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 8.0, 0.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Icon(
                                                        FFIcons
                                                            .kclarityCalendarLine,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        size: 18.0,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    5.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          '04/10/23',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 30.0,
                                        height: 30.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondary,
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        child: Icon(
                                          FFIcons.kchevronDownS,
                                          color: FlutterFlowTheme.of(context)
                                              .white,
                                          size: 24.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
