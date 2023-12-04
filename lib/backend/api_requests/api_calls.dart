import 'dart:convert';
import 'dart:typed_data';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Brevo Group Code

class BrevoGroup {
  static String baseUrl = 'https://api.brevo.com/v3';
  static Map<String, String> headers = {
    'api-key': '[api-key]',
  };
  static CreateAContactCall createAContactCall = CreateAContactCall();
  static UpdateAContactCall updateAContactCall = UpdateAContactCall();
  static SendAWelcomeEmailCall sendAWelcomeEmailCall = SendAWelcomeEmailCall();
}

class CreateAContactCall {
  Future<ApiCallResponse> call({
    String? firstname = '',
    String? lastname = '',
    String? email = '',
    String? apiKey =
        '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',
  }) async {
    final ffApiRequestBody = '''
{
  "email": "${email}",
  "FIRSTNAME": "${firstname}",
  "LASTNAME": "${lastname}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Create a contact',
      apiUrl: '${BrevoGroup.baseUrl}/contacts',
      callType: ApiCallType.POST,
      headers: {
        'api-key': '${apiKey}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
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
    final ffApiRequestBody = '''
{
  "attributes": {
    "FIRSTNAME": "${firstname}",
    "LASTNAME": "${lastname}"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Update a contact',
      apiUrl: '${BrevoGroup.baseUrl}/contacts/${identifier}',
      callType: ApiCallType.PUT,
      headers: {
        'api-key': '${apiKey}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class SendAWelcomeEmailCall {
  Future<ApiCallResponse> call({
    String? userEmail = '',
    int? emailID = 2,
    String? apiKey =
        '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',
  }) async {
    final ffApiRequestBody = '''
{
  "sender": {
    "name": "Quis",
    "email": "info@quis-hq.com"
  },
  "to": [
    {
      "email": "${userEmail}"
    }
  ],
  "templateId": ${emailID}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Send a welcome email',
      apiUrl: '${BrevoGroup.baseUrl}/smtp/email',
      callType: ApiCallType.POST,
      headers: {
        'api-key': '${apiKey}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
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
