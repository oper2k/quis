const functions = require("firebase-functions");
const logger = require("firebase-functions/logger");
const { RtcTokenBuilder, RtcRole } = require("agora-token");

const appID = "8a3a660dddd24ceba9680ea671ef3591";
const appCertificate = "ef0b2637a586424cadcb9f54a7013204";
const role = RtcRole.PUBLISHER;
const tokenExpirationInSecond = 2700;
const privilegeExpirationInSecond = 2700;

exports.generateRtcTokenCall = functions.https.onCall((body, context) => {
  const uid = body.uid;
  const channelName = body.channelName;
  logger.info("generate token for uid", uid, "in channel", channelName);

  const token = RtcTokenBuilder.buildTokenWithUid(
    appID,
    appCertificate,
    channelName,
    uid,
    role,
    tokenExpirationInSecond,
    privilegeExpirationInSecond,
  );
  return token;
});
