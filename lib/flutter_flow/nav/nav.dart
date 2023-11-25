import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';

import '/auth/base_auth_user_provider.dart';

import '/backend/push_notifications/push_notifications_handler.dart'
    show PushNotificationsHandler;
import '/index.dart';
import '/main.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'serialization_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? ConfirmEmailWidget() : OnboardingWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => appStateNotifier.loggedIn
              ? ConfirmEmailWidget()
              : OnboardingWidget(),
        ),
        FFRoute(
          name: 'Home',
          path: '/home',
          builder: (context, params) => HomeWidget(),
        ),
        FFRoute(
          name: 'Onboarding',
          path: '/onboarding',
          builder: (context, params) => OnboardingWidget(),
        ),
        FFRoute(
          name: 'Login',
          path: '/login',
          builder: (context, params) => LoginWidget(),
        ),
        FFRoute(
          name: 'Signup',
          path: '/signup',
          builder: (context, params) => SignupWidget(),
        ),
        FFRoute(
          name: 'Pricing',
          path: '/pricing',
          builder: (context, params) => PricingWidget(
            isFirst: params.getParam('isFirst', ParamType.bool),
          ),
        ),
        FFRoute(
          name: 'ConfirmEmail',
          path: '/confirmEmail',
          builder: (context, params) => ConfirmEmailWidget(
            isAfterReg: params.getParam('isAfterReg', ParamType.bool),
          ),
        ),
        FFRoute(
          name: 'InitPage',
          path: '/initPage',
          builder: (context, params) => InitPageWidget(),
        ),
        FFRoute(
          name: 'ResetPassword',
          path: '/resetPassword',
          builder: (context, params) => ResetPasswordWidget(),
        ),
        FFRoute(
          name: 'ResetPasswordConfirm',
          path: '/resetPasswordConfirm',
          builder: (context, params) => ResetPasswordConfirmWidget(),
        ),
        FFRoute(
          name: 'ConfirmedEmail',
          path: '/confirmedEmail',
          builder: (context, params) => ConfirmedEmailWidget(),
        ),
        FFRoute(
          name: 'MyProfile',
          path: '/myProfile',
          builder: (context, params) => MyProfileWidget(),
        ),
        FFRoute(
          name: 'Settings',
          path: '/settings',
          builder: (context, params) => SettingsWidget(),
        ),
        FFRoute(
          name: 'ChangePassword',
          path: '/changePassword',
          builder: (context, params) => ChangePasswordWidget(),
        ),
        FFRoute(
          name: 'EditProfile',
          path: '/editProfile',
          builder: (context, params) => EditProfileWidget(),
        ),
        FFRoute(
          name: 'Referral',
          path: '/referral',
          builder: (context, params) => ReferralWidget(),
        ),
        FFRoute(
          name: 'Support',
          path: '/support',
          builder: (context, params) => SupportWidget(),
        ),
        FFRoute(
          name: 'Karma',
          path: '/karma',
          builder: (context, params) => KarmaWidget(),
        ),
        FFRoute(
          name: 'EarnKarma',
          path: '/earnKarma',
          builder: (context, params) => EarnKarmaWidget(),
        ),
        FFRoute(
          name: 'MatchedUsers',
          path: '/matchedUsers',
          asyncParams: {
            'likedUsersList': getDocList(['users'], UsersRecord.fromSnapshot),
          },
          builder: (context, params) => MatchedUsersWidget(
            likedUsersList: params.getParam<UsersRecord>(
                'likedUsersList', ParamType.Document, true),
          ),
        ),
        FFRoute(
          name: 'UserProfile',
          path: '/userProfile',
          asyncParams: {
            'userItem': getDoc(['users'], UsersRecord.fromSnapshot),
          },
          builder: (context, params) => UserProfileWidget(
            userItem: params.getParam('userItem', ParamType.Document),
            isLinkedIn: params.getParam('isLinkedIn', ParamType.bool),
          ),
        ),
        FFRoute(
          name: 'Add-ons',
          path: '/addOns',
          builder: (context, params) => AddOnsWidget(),
        ),
        FFRoute(
          name: 'CVReview',
          path: '/cVReview',
          builder: (context, params) => CVReviewWidget(),
        ),
        FFRoute(
          name: 'MockInterview',
          path: '/mockInterview',
          builder: (context, params) => MockInterviewWidget(),
        ),
        FFRoute(
          name: 'LeadershipOrig',
          path: '/leadershipOrig',
          builder: (context, params) => LeadershipOrigWidget(),
        ),
        FFRoute(
          name: 'Leadership',
          path: '/leadership',
          builder: (context, params) => LeadershipWidget(),
        ),
        FFRoute(
          name: 'JobReferral',
          path: '/jobReferral',
          builder: (context, params) => JobReferralWidget(),
        ),
        FFRoute(
          name: 'ExchangeKarma',
          path: '/exchangeKarma',
          builder: (context, params) => ExchangeKarmaWidget(),
        ),
        FFRoute(
          name: 'FavoriteVideos',
          path: '/favoriteVideos',
          builder: (context, params) => FavoriteVideosWidget(),
        ),
        FFRoute(
          name: 'AllCourses',
          path: '/allCourses',
          builder: (context, params) => AllCoursesWidget(),
        ),
        FFRoute(
          name: 'Course',
          path: '/course',
          asyncParams: {
            'courseItem': getDoc(['course'], CourseRecord.fromSnapshot),
          },
          builder: (context, params) => CourseWidget(
            courseItem: params.getParam('courseItem', ParamType.Document),
          ),
        ),
        FFRoute(
          name: 'Video',
          path: '/video',
          asyncParams: {
            'videoItem':
                getDoc(['course_video'], CourseVideoRecord.fromSnapshot),
          },
          builder: (context, params) => VideoWidget(
            videoItem: params.getParam('videoItem', ParamType.Document),
            showBottomButtons:
                params.getParam('showBottomButtons', ParamType.bool),
          ),
        ),
        FFRoute(
          name: 'SendFeedback',
          path: '/sendFeedback',
          asyncParams: {
            'videoItem':
                getDoc(['course_video'], CourseVideoRecord.fromSnapshot),
          },
          builder: (context, params) => SendFeedbackWidget(
            videoItem: params.getParam('videoItem', ParamType.Document),
          ),
        ),
        FFRoute(
          name: 'PracticeInterview',
          path: '/practiceInterview',
          builder: (context, params) => PracticeInterviewWidget(),
        ),
        FFRoute(
          name: 'InterviewFeedback',
          path: '/interviewFeedback',
          builder: (context, params) => InterviewFeedbackWidget(
            userRef: params.getParam(
                'userRef', ParamType.DocumentReference, false, ['users']),
          ),
        ),
        FFRoute(
          name: 'FeedbackThankyou',
          path: '/feedbackThankyou',
          builder: (context, params) => FeedbackThankyouWidget(),
        ),
        FFRoute(
          name: 'LIQ',
          path: '/liq',
          builder: (context, params) => LiqWidget(
            userItem: params.getParam(
                'userItem', ParamType.DocumentReference, false, ['users']),
          ),
        ),
        FFRoute(
          name: 'LatestInterviewQuestions',
          path: '/latestInterviewQuestions',
          builder: (context, params) => LatestInterviewQuestionsWidget(),
        ),
        FFRoute(
          name: 'NewQuestion',
          path: '/newQuestion',
          builder: (context, params) => NewQuestionWidget(),
        ),
        FFRoute(
          name: 'WelcomeVideo',
          path: '/welcomeVideo',
          asyncParams: {
            'welcomeVideo':
                getDoc(['welcome_video'], WelcomeVideoRecord.fromSnapshot),
          },
          builder: (context, params) => WelcomeVideoWidget(
            welcomeVideo: params.getParam('welcomeVideo', ParamType.Document),
          ),
        ),
        FFRoute(
          name: 'Add-onsCopy',
          path: '/addOnsCopy',
          builder: (context, params) => AddOnsCopyWidget(),
        ),
        FFRoute(
          name: 'Question',
          path: '/question',
          asyncParams: {
            'questionItem': getDoc(
                ['interview_question'], InterviewQuestionRecord.fromSnapshot),
          },
          builder: (context, params) => QuestionWidget(
            questionItem: params.getParam('questionItem', ParamType.Document),
          ),
        ),
        FFRoute(
          name: 'VideoConfPage',
          path: '/videoConfPage',
          builder: (context, params) => VideoConfPageWidget(
            token: params.getParam('token', ParamType.String),
            channelName: params.getParam('channelName', ParamType.String),
            userProfileImage:
                params.getParam('userProfileImage', ParamType.String),
            uid: params.getParam('uid', ParamType.int),
          ),
        ),
        FFRoute(
          name: 'ThankYouForQuestion',
          path: '/thankYouForQuestion',
          builder: (context, params) => ThankYouForQuestionWidget(),
        ),
        FFRoute(
          name: 'BillingManagment',
          path: '/billingManagment',
          builder: (context, params) => BillingManagmentWidget(),
        ),
        FFRoute(
          name: 'CustomerSupport',
          path: '/customerSupport',
          builder: (context, params) => CustomerSupportWidget(),
        ),
        FFRoute(
          name: 'ThankYouForSubscription',
          path: '/thankYouForSubscription',
          builder: (context, params) => ThankYouForSubscriptionWidget(),
        ),
        FFRoute(
          name: 'VideoVimeo',
          path: '/videoVimeo',
          builder: (context, params) => VideoVimeoWidget(
            videoVimeoURL: params.getParam('videoVimeoURL', ParamType.String),
          ),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.extraMap.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, [
    bool isList = false,
    List<String>? collectionNamePath,
  ]) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(param, type, isList,
        collectionNamePath: collectionNamePath);
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.location);
            return '/onboarding';
          }
          return null;
        },
        pageBuilder: (context, state) {
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Container(
                  color: FlutterFlowTheme.of(context).primary,
                  child: Center(
                    child: Image.asset(
                      'assets/images/QUIS_-_logo_1.webp',
                      width: 200.0,
                      fit: BoxFit.contain,
                    ),
                  ),
                )
              : PushNotificationsHandler(child: page);

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder: PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).transitionsBuilder,
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouter.of(context).location;
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}
