import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_manager.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/karma_shortage_dialog_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

Future payByKarma(
  BuildContext context, {
  required double? karmaAmount,
}) async {
  if (valueOrDefault(currentUserDocument?.karma, 0.0) >= karmaAmount!) {
    await currentUserReference!.update({
      ...mapToFirestore(
        {
          'karma': FieldValue.increment(-(karmaAmount!)),
        },
      ),
    });
  } else {
    await showAlignedDialog(
      context: context,
      isGlobal: true,
      avoidOverflow: false,
      targetAnchor:
          AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
      followerAnchor:
          AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
      builder: (dialogContext) {
        return Material(
          color: Colors.transparent,
          child: WebViewAware(child: KarmaShortageDialogWidget()),
        );
      },
    );
  }
}
