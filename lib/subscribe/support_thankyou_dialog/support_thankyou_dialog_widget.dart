import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'support_thankyou_dialog_model.dart';
export 'support_thankyou_dialog_model.dart';

class SupportThankyouDialogWidget extends StatefulWidget {
  const SupportThankyouDialogWidget({Key? key}) : super(key: key);

  @override
  _SupportThankyouDialogWidgetState createState() =>
      _SupportThankyouDialogWidgetState();
}

class _SupportThankyouDialogWidgetState
    extends State<SupportThankyouDialogWidget> {
  late SupportThankyouDialogModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SupportThankyouDialogModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
      child: Container(
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16.0, 2.0, 16.0, 42.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: AlignmentDirectional(1.00, -1.00),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: 40.0,
                        height: 40.0,
                        decoration: BoxDecoration(),
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.00, 0.00),
                    child: Lottie.asset(
                      'assets/lottie_animations/animation_lnv2c0x7.json',
                      width: 150.0,
                      height: 150.0,
                      fit: BoxFit.contain,
                      animate: true,
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(1.00, -1.00),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: 40.0,
                        height: 40.0,
                        decoration: BoxDecoration(),
                        child: Align(
                          alignment: AlignmentDirectional(1.00, 0.00),
                          child: Icon(
                            FFIcons.kcross,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 24.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 11.0, 0.0, 0.0),
                child: Text(
                  'Thank you!',
                  style: FlutterFlowTheme.of(context).headlineLarge,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 21.0, 0.0, 0.0),
                child: Text(
                  'We will get back to you shortly',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).headlineSmall.override(
                        fontFamily: 'Sofia Pro',
                        fontWeight: FontWeight.w300,
                        useGoogleFonts: false,
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
