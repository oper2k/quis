const admin = require("firebase-admin/app");
admin.initializeApp();

const generateRtcTokenCall = require("./generate_rtc_token_call.js");
exports.generateRtcTokenCall = generateRtcTokenCall.generateRtcTokenCall;
