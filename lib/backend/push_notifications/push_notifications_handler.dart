import 'dart:async';

import 'serialization_util.dart';
import '../backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';


final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({super.key, required this.child});

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    if (mounted) {
      setState(() => _loading = true);
    }
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        context.pushNamed(
          initialPageName,
          pathParameters: parameterData.pathParameters,
          extra: parameterData.extra,
        );
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      if (mounted) {
        setState(() => _loading = false);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    handleOpenedPushNotification();
  }

  @override
  Widget build(BuildContext context) => _loading
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
      : widget.child;
}

class ParameterData {
  const ParameterData(
      {this.requiredParams = const {}, this.allParams = const {}});
  final Map<String, String?> requiredParams;
  final Map<String, dynamic> allParams;

  Map<String, String> get pathParameters => Map.fromEntries(
        requiredParams.entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
  Map<String, dynamic> get extra => Map.fromEntries(
        allParams.entries.where((e) => e.value != null),
      );

  static Future<ParameterData> Function(Map<String, dynamic>) none() =>
      (data) async => const ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'Home': ParameterData.none(),
  'OnboardingOld': ParameterData.none(),
  'Login': ParameterData.none(),
  'SignupOld': ParameterData.none(),
  'Pricing': (data) async => const ParameterData(
        allParams: {},
      ),
  'ConfirmEmail': (data) async => ParameterData(
        allParams: {
          'isAfterReg': getParameter<bool>(data, 'isAfterReg'),
        },
      ),
  'InitPage': ParameterData.none(),
  'ResetPassword': ParameterData.none(),
  'ResetPasswordConfirm': ParameterData.none(),
  'ConfirmedEmail': ParameterData.none(),
  'MyProfile': ParameterData.none(),
  'Settings': ParameterData.none(),
  'ChangePassword': ParameterData.none(),
  'EditProfile': ParameterData.none(),
  'Referral': ParameterData.none(),
  'Support': ParameterData.none(),
  'Karma': ParameterData.none(),
  'EarnKarma': ParameterData.none(),
  'MatchedUsers': (data) async => const ParameterData(
        allParams: {},
      ),
  'UserProfile': (data) async => ParameterData(
        allParams: {
          'userItem': await getDocumentParameter<UsersRecord>(
              data, 'userItem', UsersRecord.fromSnapshot),
          'isLinkedIn': getParameter<bool>(data, 'isLinkedIn'),
        },
      ),
  'Add-ons': ParameterData.none(),
  'CVReview': ParameterData.none(),
  'MockInterview': ParameterData.none(),
  'LeadershipOrig': ParameterData.none(),
  'Leadership': ParameterData.none(),
  'JobReferral': ParameterData.none(),
  'ExchangeKarma': ParameterData.none(),
  'FavoriteVideos': ParameterData.none(),
  'AllCourses': ParameterData.none(),
  'Course': (data) async => ParameterData(
        allParams: {
          'courseItem': await getDocumentParameter<CourseRecord>(
              data, 'courseItem', CourseRecord.fromSnapshot),
        },
      ),
  'Video': (data) async => ParameterData(
        allParams: {
          'videoItem': await getDocumentParameter<CourseVideoRecord>(
              data, 'videoItem', CourseVideoRecord.fromSnapshot),
          'showBottomButtons': getParameter<bool>(data, 'showBottomButtons'),
        },
      ),
  'SendFeedback': (data) async => ParameterData(
        allParams: {
          'videoItem': await getDocumentParameter<CourseVideoRecord>(
              data, 'videoItem', CourseVideoRecord.fromSnapshot),
        },
      ),
  'PracticeInterview': ParameterData.none(),
  'InterviewFeedback': (data) async => ParameterData(
        allParams: {
          'userRef': getParameter<DocumentReference>(data, 'userRef'),
          'roomDoc': await getDocumentParameter<ConferenceRoomRecord>(
              data, 'roomDoc', ConferenceRoomRecord.fromSnapshot),
          'isLike': getParameter<bool>(data, 'isLike'),
        },
      ),
  'FeedbackThankyou': ParameterData.none(),
  'LIQ': (data) async => ParameterData(
        allParams: {
          'userItem': getParameter<DocumentReference>(data, 'userItem'),
          'roomDoc': await getDocumentParameter<ConferenceRoomRecord>(
              data, 'roomDoc', ConferenceRoomRecord.fromSnapshot),
        },
      ),
  'LatestInterviewQuestions': ParameterData.none(),
  'NewQuestion': ParameterData.none(),
  'WelcomeVideo': (data) async => ParameterData(
        allParams: {
          'welcomeVideo': await getDocumentParameter<WelcomeVideoRecord>(
              data, 'welcomeVideo', WelcomeVideoRecord.fromSnapshot),
        },
      ),
  'Question': (data) async => ParameterData(
        allParams: {
          'questionItem': await getDocumentParameter<InterviewQuestionRecord>(
              data, 'questionItem', InterviewQuestionRecord.fromSnapshot),
        },
      ),
  'VideoConfPage': (data) async => ParameterData(
        allParams: {
          'token': getParameter<String>(data, 'token'),
          'channelName': getParameter<String>(data, 'channelName'),
          'userProfileImage': getParameter<String>(data, 'userProfileImage'),
          'uid': getParameter<int>(data, 'uid'),
          'userRef': getParameter<DocumentReference>(data, 'userRef'),
          'role': getParameter<String>(data, 'role'),
          'roomDoc': await getDocumentParameter<ConferenceRoomRecord>(
              data, 'roomDoc', ConferenceRoomRecord.fromSnapshot),
        },
      ),
  'ThankYouForQuestion': ParameterData.none(),
  'BillingManagment': ParameterData.none(),
  'ThankYouForSubscription': (data) async => ParameterData(
        allParams: {
          'isInOnboarding': getParameter<bool>(data, 'isInOnboarding'),
        },
      ),
  'VideoVimeo': (data) async => ParameterData(
        allParams: {
          'videoVimeoURL': getParameter<String>(data, 'videoVimeoURL'),
        },
      ),
  'ConfirmEmailCopy': (data) async => ParameterData(
        allParams: {
          'isAfterReg': getParameter<bool>(data, 'isAfterReg'),
        },
      ),
  'ReminderPage': ParameterData.none(),
  'InitPageOld': ParameterData.none(),
  'PricingOld': (data) async => ParameterData(
        allParams: {
          'isFirst': getParameter<bool>(data, 'isFirst'),
        },
      ),
  'AuthEmailPage': ParameterData.none(),
  'Onboarding01': ParameterData.none(),
  'Onboarding02': ParameterData.none(),
  'Onboarding03name': ParameterData.none(),
  'Onboarding04': ParameterData.none(),
  'Onboarding05': ParameterData.none(),
  'Onboarding06industry': ParameterData.none(),
  'Onboarding07': ParameterData.none(),
  'Onboarding08': ParameterData.none(),
  'Onboarding18time': ParameterData.none(),
  'Onboarding09experienceYears': ParameterData.none(),
  'Onboarding10role': ParameterData.none(),
  'Onboarding11improve': ParameterData.none(),
  'Onboarding12referral': ParameterData.none(),
  'Onboarding13': ParameterData.none(),
  'Onboarding14practiceGoal': ParameterData.none(),
  'Onboarding15': ParameterData.none(),
  'Onboarding16': ParameterData.none(),
  'SplashPage': ParameterData.none(),
  'ResetPasswordOld': ParameterData.none(),
  'Onboarding17LinkedIn': ParameterData.none(),
  'Onboarding19ONBCOMPLETED': ParameterData.none(),
  'Onboarding20afterPricing': ParameterData.none(),
  'Onboarding21gift': ParameterData.none(),
  'Guide1': ParameterData.none(),
  'HomeGuide1': ParameterData.none(),
  'AllCoursesGuide': ParameterData.none(),
  'LatestInterviewQuestionsGuide': ParameterData.none(),
  'HomeGuide2': ParameterData.none(),
  'test': ParameterData.none(),
  'PracticeInterviewGuide': ParameterData.none(),
};

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
