import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'splash_page_model.dart';
export 'splash_page_model.dart';

class SplashPageWidget extends StatefulWidget {
  const SplashPageWidget({super.key});

  @override
  State<SplashPageWidget> createState() => _SplashPageWidgetState();
}

class _SplashPageWidgetState extends State<SplashPageWidget> {
  late SplashPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SplashPageModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'SplashPage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('SPLASH_SplashPage_ON_INIT_STATE');
      if (loggedIn) {
        if (valueOrDefault(currentUserDocument?.brevoId, 0) <= 0) {
          logFirebaseEvent('SplashPage_backend_call');
          _model.apiResultsj6 = await BrevoGroup.createAContactCall.call(
            firstname: valueOrDefault(currentUserDocument?.firstName, ''),
            lastname: valueOrDefault(currentUserDocument?.lastName, ''),
            email: currentUserEmail,
          );
          if ((_model.apiResultsj6?.succeeded ?? true)) {
            logFirebaseEvent('SplashPage_backend_call');

            await currentUserReference!.update(createUsersRecordData(
              brevoId: BrevoGroup.createAContactCall.brevoID(
                (_model.apiResultsj6?.jsonBody ?? ''),
              ),
            ));
          }
        }
        if (FFAppState().hasWalkShown) {
          logFirebaseEvent('SplashPage_navigate_to');

          context.goNamed(
            'Home',
            extra: <String, dynamic>{
              kTransitionInfoKey: const TransitionInfo(
                hasTransition: true,
                transitionType: PageTransitionType.fade,
                duration: Duration(milliseconds: 0),
              ),
            },
          );
        } else {
          logFirebaseEvent('SplashPage_update_app_state');
          setState(() {
            FFAppState().hasWalkShown = true;
          });
          if (kDebugMode) {
            logFirebaseEvent('SplashPage_navigate_to');

            context.goNamed(
              'Home',
              extra: <String, dynamic>{
                kTransitionInfoKey: const TransitionInfo(
                  hasTransition: true,
                  transitionType: PageTransitionType.fade,
                  duration: Duration(milliseconds: 0),
                ),
              },
            );
          } else {
            logFirebaseEvent('SplashPage_navigate_to');

            context.goNamed(
              'HomeGuide1',
              extra: <String, dynamic>{
                kTransitionInfoKey: const TransitionInfo(
                  hasTransition: true,
                  transitionType: PageTransitionType.fade,
                  duration: Duration(milliseconds: 0),
                ),
              },
            );
          }
        }
      } else {
        logFirebaseEvent('SplashPage_navigate_to');

        context.pushNamed('InitPage');
      }
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        ),
      ),
    );
  }
}
