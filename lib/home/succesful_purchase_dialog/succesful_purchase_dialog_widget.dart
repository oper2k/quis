import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'succesful_purchase_dialog_model.dart';
export 'succesful_purchase_dialog_model.dart';

class SuccesfulPurchaseDialogWidget extends StatefulWidget {
  const SuccesfulPurchaseDialogWidget({super.key});

  @override
  State<SuccesfulPurchaseDialogWidget> createState() =>
      _SuccesfulPurchaseDialogWidgetState();
}

class _SuccesfulPurchaseDialogWidgetState
    extends State<SuccesfulPurchaseDialogWidget> {
  late SuccesfulPurchaseDialogModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SuccesfulPurchaseDialogModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).white,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(16.0, 2.0, 16.0, 42.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: const AlignmentDirectional(1.0, 0.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    logFirebaseEvent(
                        'SUCCESFUL_PURCHASE_DIALOG_Container_gxoc');
                    logFirebaseEvent('Container_dismiss_dialog');
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: 40.0,
                    height: 40.0,
                    decoration: const BoxDecoration(),
                    child: Align(
                      alignment: const AlignmentDirectional(1.0, 0.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent(
                              'SUCCESFUL_PURCHASE_DIALOG_Icon_hb46vjsz_');
                          logFirebaseEvent('Icon_dismiss_dialog');
                          Navigator.pop(context);
                        },
                        child: Icon(
                          FFIcons.kcross,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 24.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(0.0),
                child: Image.asset(
                  'assets/images/image_55.webp',
                  width: 125.0,
                  height: 109.0,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 22.0, 0.0, 0.0),
                child: Text(
                  'Thank you! The purchase was successful!',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).headlineSmall.override(
                        fontFamily: 'Sofia Pro',
                        fontWeight: FontWeight.w300,
                        useGoogleFonts: false,
                        lineHeight: 1.16,
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
