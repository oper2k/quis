import 'dart:convert';
import 'dart:typed_data';
import '../cloud_functions/cloud_functions.dart';
import '../schema/structs/index.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Brevo Group Code

class BrevoGroup {
  static CreateAContactCall createAContactCall = CreateAContactCall();
  static UpdateAContactCall updateAContactCall = UpdateAContactCall();
  static SendAnEmailCall sendAnEmailCall = SendAnEmailCall();
  static SendAScheduledEmailCall sendAScheduledEmailCall =
      SendAScheduledEmailCall();
}

class CreateAContactCall {
  Future<ApiCallResponse> call({
    String? firstname = '',
    String? lastname = '',
    String? email = '',
    String? apiKey =
        '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',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'CreateAContactCall',
        'variables': {
          'firstname': firstname,
          'lastname': lastname,
          'email': email,
          'apiKey': apiKey,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }

  dynamic brevoID(dynamic response) => getJsonField(
        response,
        r'''$.id''',
      );
}

class UpdateAContactCall {
  Future<ApiCallResponse> call({
    String? firstname = '',
    String? lastname = '',
    String? identifier = '',
    String? apiKey =
        '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',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'UpdateAContactCall',
        'variables': {
          'firstname': firstname,
          'lastname': lastname,
          'identifier': identifier,
          'apiKey': apiKey,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class SendAnEmailCall {
  Future<ApiCallResponse> call({
    String? userEmail = '',
    int? templateId,
    String? paramUsername = '',
    String? paramComment = '',
    String? paramEmail = '',
    String? paramFeedback = '',
    String? paramTopic = '',
    String? paramServiceName = '',
    String? paramUserCompany = '',
    String? paramUserRole = '',
    String? paramStage = '',
    String? paramInterviewRound = '',
    String? paramInterviewQuestion = '',
    String? paramInterviewAnswer = '',
    String? paramDate = '',
    String? paramAboutInterview = '',
    String? paramAboutInterviewPartner = '',
    String? paramPartnerStructure = '',
    String? paramPartnerImprove = '',
    String? paramProductScale = '',
    String? paramProductImprove = '',
    String? paramProductFeedback = '',
    String? paramAttachLink = '',
    String? paramUserIndustry = '',
    String? paramQuantity = '',
    String? apiKey =
        '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',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'SendAnEmailCall',
        'variables': {
          'userEmail': userEmail,
          'templateId': templateId,
          'paramUsername': paramUsername,
          'paramComment': paramComment,
          'paramEmail': paramEmail,
          'paramFeedback': paramFeedback,
          'paramTopic': paramTopic,
          'paramServiceName': paramServiceName,
          'paramUserCompany': paramUserCompany,
          'paramUserRole': paramUserRole,
          'paramStage': paramStage,
          'paramInterviewRound': paramInterviewRound,
          'paramInterviewQuestion': paramInterviewQuestion,
          'paramInterviewAnswer': paramInterviewAnswer,
          'paramDate': paramDate,
          'paramAboutInterview': paramAboutInterview,
          'paramAboutInterviewPartner': paramAboutInterviewPartner,
          'paramPartnerStructure': paramPartnerStructure,
          'paramPartnerImprove': paramPartnerImprove,
          'paramProductScale': paramProductScale,
          'paramProductImprove': paramProductImprove,
          'paramProductFeedback': paramProductFeedback,
          'paramAttachLink': paramAttachLink,
          'paramUserIndustry': paramUserIndustry,
          'paramQuantity': paramQuantity,
          'apiKey': apiKey,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class SendAScheduledEmailCall {
  Future<ApiCallResponse> call({
    String? time = '',
    String? userEmail = '',
    int? templateId,
    String? paramFeedback = '',
    String? apiKey =
        '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',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'SendAScheduledEmailCall',
        'variables': {
          'time': time,
          'userEmail': userEmail,
          'templateId': templateId,
          'paramFeedback': paramFeedback,
          'apiKey': apiKey,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

/// End Brevo Group Code

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
