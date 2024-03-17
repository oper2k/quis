import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/karma_shortage_dialog_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/home/deducted_karma/deducted_karma_widget.dart';
import '/home/succesful_purchase_dialog/succesful_purchase_dialog_widget.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

Future<bool?> payByKarma(
  BuildContext context, {
  required double? karmaAmount,
  String? serviceName,
  required int? quantity,
  String? comment,
  String? attachmentlink,
  String? userRole,
  String? userIndustry,
  required String? userEmail,
}) async {
  bool? dialogOutput;
  ApiCallResponse? apiResultnl101;
  ApiCallResponse? apiResultnl102;

  logFirebaseEvent('payByKarma_alert_dialog');
  await showDialog(
    context: context,
    builder: (dialogContext) {
      return Dialog(
        elevation: 0,
        insetPadding: EdgeInsets.zero,
        backgroundColor: Colors.transparent,
        alignment:
            const AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
        child: WebViewAware(
          child: DeductedKarmaWidget(
            deductedKarma: karmaAmount!,
          ),
        ),
      );
    },
  ).then((value) => dialogOutput = value);

  if (!dialogOutput!) {
    return false;
  }
  if (valueOrDefault(currentUserDocument?.karma, 0.0) >= karmaAmount!) {
    logFirebaseEvent('payByKarma_backend_call');

    await currentUserReference!.update({
      ...mapToFirestore(
        {
          'karma': FieldValue.increment(-(karmaAmount)),
        },
      ),
    });
    logFirebaseEvent('payByKarma_backend_call');
    unawaited(
      () async {
        apiResultnl101 = await BrevoGroup.sendAnEmailCall.call(
          userEmail: currentUserEmail,
          templateId: 10,
          paramServiceName: serviceName,
          paramUserRole: userRole,
          paramComment: comment,
          paramUserIndustry: userIndustry,
          paramAttachLink: attachmentlink,
          paramEmail: userEmail,
          paramQuantity: quantity?.toString(),
        );
      }(),
    );
    logFirebaseEvent('payByKarma_backend_call');
    unawaited(
      () async {
        apiResultnl102 = await BrevoGroup.sendAnEmailCall.call(
          userEmail: FFAppConstants.infoEmail,
          templateId: 10,
          paramServiceName: serviceName,
          paramUserRole: userRole,
          paramComment: comment,
          paramUserIndustry: userIndustry,
          paramAttachLink: attachmentlink,
          paramEmail: userEmail,
          paramQuantity: quantity?.toString(),
        );
      }(),
    );
    logFirebaseEvent('payByKarma_alert_dialog');
    await showDialog(
      context: context,
      builder: (dialogContext) {
        return Dialog(
          elevation: 0,
          insetPadding: EdgeInsets.zero,
          backgroundColor: Colors.transparent,
          alignment: const AlignmentDirectional(0.0, 0.0)
              .resolve(Directionality.of(context)),
          child: const WebViewAware(
            child: SuccesfulPurchaseDialogWidget(),
          ),
        );
      },
    );

    logFirebaseEvent('payByKarma_navigate_back');
    context.safePop();
    return true;
  } else {
    logFirebaseEvent('payByKarma_alert_dialog');
    await showDialog(
      context: context,
      builder: (dialogContext) {
        return Dialog(
          elevation: 0,
          insetPadding: EdgeInsets.zero,
          backgroundColor: Colors.transparent,
          alignment: const AlignmentDirectional(0.0, 0.0)
              .resolve(Directionality.of(context)),
          child: const WebViewAware(
            child: KarmaShortageDialogWidget(),
          ),
        );
      },
    );

    return false;
  }
}
