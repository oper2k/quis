import 'dart:async';
import 'dart:convert';

import 'serialization_util.dart';
import '../backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import '../../index.dart';
import '../../main.dart';

final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({Key? key, required this.child})
      : super(key: key);

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
      (data) async => ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'Home': ParameterData.none(),
  'Onboarding': ParameterData.none(),
  'Login': ParameterData.none(),
  'Signup': ParameterData.none(),
  'Pricing': (data) async => ParameterData(
        allParams: {
          'isFirst': getParameter<bool>(data, 'isFirst'),
        },
      ),
  'ConfirmEmail': ParameterData.none(),
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
  'MatchedUsers': (data) async => ParameterData(
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
  'VideoPlayer': (data) async => ParameterData(
        allParams: {
          'video': getParameter<String>(data, 'video'),
        },
      ),
  'PracticeInterview': ParameterData.none(),
  'InterviewFeedback': (data) async => ParameterData(
        allParams: {
          'userRef': getParameter<DocumentReference>(data, 'userRef'),
        },
      ),
  'FeedbackThankyou': ParameterData.none(),
  'LIQ': (data) async => ParameterData(
        allParams: {
          'userItem': getParameter<DocumentReference>(data, 'userItem'),
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
  'Add-onsCopy': ParameterData.none(),
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
        },
      ),
  'ThankYouForQuestion': ParameterData.none(),
  'BillingManagment': ParameterData.none(),
  'CustomerSupport': ParameterData.none(),
  'ThankYouForSubscription': ParameterData.none(),
  'VideoVimeo': (data) async => ParameterData(
        allParams: {
          'videoVimeoURL': getParameter<String>(data, 'videoVimeoURL'),
        },
      ),
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
