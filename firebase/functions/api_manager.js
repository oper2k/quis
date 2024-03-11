const axios = require("axios").default;
const qs = require("qs");

/// Start Brevo Group Code

const brevoGroup = {
  baseUrl: "https://api.brevo.com/v3",
  headers: { "api-key": `[api-key]` },
};

async function _createAContactCall(context, ffVariables) {
  var firstname = ffVariables["firstname"];
  var lastname = ffVariables["lastname"];
  var email = ffVariables["email"];
  var apiKey = ffVariables["apiKey"];

  var url = `${brevoGroup.baseUrl}/contacts`;
  var headers = { "api-key": `${apiKey}` };
  var params = {};
  var ffApiRequestBody = `
{
  "email": "${email}",
  "FIRSTNAME": "${firstname}",
  "LASTNAME": "${lastname}"
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({
      headers,
      params,
      body: ffApiRequestBody,
      bodyType: "JSON",
    }),
    returnBody: true,
  });
}

async function _updateAContactCall(context, ffVariables) {
  var firstname = ffVariables["firstname"];
  var lastname = ffVariables["lastname"];
  var identifier = ffVariables["identifier"];
  var apiKey = ffVariables["apiKey"];

  var url = `${brevoGroup.baseUrl}/contacts/${identifier}`;
  var headers = { "api-key": `${apiKey}` };
  var params = {};
  var ffApiRequestBody = `
{
  "attributes": {
    "FIRSTNAME": "${firstname}",
    "LASTNAME": "${lastname}"
  }
}`;

  return makeApiRequest({
    method: "put",
    url,
    headers,
    params,
    body: createBody({
      headers,
      params,
      body: ffApiRequestBody,
      bodyType: "JSON",
    }),
    returnBody: true,
  });
}

async function _sendAnEmailCall(context, ffVariables) {
  var userEmail = ffVariables["userEmail"];
  var templateId = ffVariables["templateId"];
  var paramUsername = ffVariables["paramUsername"];
  var paramComment = ffVariables["paramComment"];
  var paramEmail = ffVariables["paramEmail"];
  var paramFeedback = ffVariables["paramFeedback"];
  var paramTopic = ffVariables["paramTopic"];
  var paramServiceName = ffVariables["paramServiceName"];
  var paramUserCompany = ffVariables["paramUserCompany"];
  var paramUserRole = ffVariables["paramUserRole"];
  var paramStage = ffVariables["paramStage"];
  var paramInterviewRound = ffVariables["paramInterviewRound"];
  var paramInterviewQuestion = ffVariables["paramInterviewQuestion"];
  var paramInterviewAnswer = ffVariables["paramInterviewAnswer"];
  var paramDate = ffVariables["paramDate"];
  var paramAboutInterview = ffVariables["paramAboutInterview"];
  var paramAboutInterviewPartner = ffVariables["paramAboutInterviewPartner"];
  var paramPartnerStructure = ffVariables["paramPartnerStructure"];
  var paramPartnerImprove = ffVariables["paramPartnerImprove"];
  var paramProductScale = ffVariables["paramProductScale"];
  var paramProductImprove = ffVariables["paramProductImprove"];
  var paramProductFeedback = ffVariables["paramProductFeedback"];
  var paramAttachLink = ffVariables["paramAttachLink"];
  var paramUserIndustry = ffVariables["paramUserIndustry"];
  var paramQuantity = ffVariables["paramQuantity"];
  var apiKey = ffVariables["apiKey"];

  var url = `${brevoGroup.baseUrl}/smtp/email`;
  var headers = { "api-key": `${apiKey}` };
  var params = {};
  var ffApiRequestBody = `
{
  "to": [
    {
      "email": "${userEmail}"
    }
  ],
  "templateId": ${templateId},
  "params": {
    "EMAIL": "${paramEmail}",
    "ATTACHMENT": "${paramAttachLink}",
    "USERINDUSTRY": "${paramUserIndustry}",
    "USERNAME": "${paramUsername}",
    "COMMENT": "${paramComment}",
    "FEEDBACK": "${paramFeedback}",
    "TOPIC": "${paramTopic}",
    "QUANTITY": "${paramQuantity}",
    "SERVICENAME": "${paramServiceName}",
    "USERCOMPANY": "${paramUserCompany}",
    "USERROLE": "${paramUserRole}",
    "STAGE": "${paramStage}",
    "PRODUCTFEEDBACK": "${paramProductFeedback}",
    "INTERVIEWROUND": "${paramInterviewRound}",
    "INTERVIEWQUESTION": "${paramInterviewQuestion}",
    "INTERVIEWANSWER": "${paramInterviewAnswer}",
    "INTERVIEWDATE": "${paramDate}",
    "ABOUTINTERVIEW": "${paramAboutInterview}",
    "ABOUTINTERVIEWPARTNER": "${paramAboutInterviewPartner}",
    "PARTNERSTRUCTURE": "${paramPartnerStructure}",
    "PARTNERIMPROVE": "${paramPartnerImprove}",
    "PRODUCTSCALE": "${paramProductScale}",
    "PRODUCTIMPROVE": "${paramProductImprove}"
  }
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({
      headers,
      params,
      body: ffApiRequestBody,
      bodyType: "JSON",
    }),
    returnBody: true,
  });
}

async function _sendAScheduledEmailCall(context, ffVariables) {
  var time = ffVariables["time"];
  var userEmail = ffVariables["userEmail"];
  var templateId = ffVariables["templateId"];
  var paramFeedback = ffVariables["paramFeedback"];
  var apiKey = ffVariables["apiKey"];

  var url = `${brevoGroup.baseUrl}/smtp/email`;
  var headers = { "api-key": `${apiKey}` };
  var params = {};
  var ffApiRequestBody = `
{
  "sender": {
    "name": "Quis",
    "email": "info@quis-hq.com"
  },
  "scheduledAt": "${time}",
  "messageVersions": [
    {
      "to": [
        {
          "email": "${userEmail}"
        }
      ],
      "params": {
        "FEEDBACK": "Hello again!"
      }
    }
  ],
  "templateId": ${templateId}
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({
      headers,
      params,
      body: ffApiRequestBody,
      bodyType: "JSON",
    }),
    returnBody: true,
  });
}

/// End Brevo Group Code

/// Helper functions to route to the appropriate API Call.

async function makeApiCall(context, data) {
  var callName = data["callName"] || "";
  var variables = data["variables"] || {};

  const callMap = {
    CreateAContactCall: _createAContactCall,
    UpdateAContactCall: _updateAContactCall,
    SendAnEmailCall: _sendAnEmailCall,
    SendAScheduledEmailCall: _sendAScheduledEmailCall,
  };

  if (!(callName in callMap)) {
    return {
      statusCode: 400,
      error: `API Call "${callName}" not defined as private API.`,
    };
  }

  var apiCall = callMap[callName];
  var response = await apiCall(context, variables);
  return response;
}

async function makeApiRequest({
  method,
  url,
  headers,
  params,
  body,
  returnBody,
}) {
  return axios
    .request({
      method: method,
      url: url,
      headers: headers,
      params: params,
      ...(body && { data: body }),
    })
    .then((response) => {
      return {
        statusCode: response.status,
        headers: response.headers,
        ...(returnBody && { body: response.data }),
      };
    })
    .catch(function (error) {
      return {
        statusCode: error.response.status,
        headers: error.response.headers,
        ...(returnBody && { body: error.response.data }),
        error: error.message,
      };
    });
}

const _unauthenticatedResponse = {
  statusCode: 401,
  headers: {},
  error: "API call requires authentication",
};

function createBody({ headers, params, body, bodyType }) {
  switch (bodyType) {
    case "JSON":
      headers["Content-Type"] = "application/json";
      return body;
    case "TEXT":
      headers["Content-Type"] = "text/plain";
      return body;
    case "X_WWW_FORM_URL_ENCODED":
      headers["Content-Type"] = "application/x-www-form-urlencoded";
      return qs.stringify(params);
  }
}

module.exports = { makeApiCall };
