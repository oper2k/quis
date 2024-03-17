import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'delete_account_dialog_model.dart';
export 'delete_account_dialog_model.dart';

class DeleteAccountDialogWidget extends StatefulWidget {
  const DeleteAccountDialogWidget({super.key});

  @override
  State<DeleteAccountDialogWidget> createState() =>
      _DeleteAccountDialogWidgetState();
}

class _DeleteAccountDialogWidgetState extends State<DeleteAccountDialogWidget> {
  late DeleteAccountDialogModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DeleteAccountDialogModel());
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
          color: FlutterFlowTheme.of(context).secondaryBackground,
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
                        'DELETE_ACCOUNT_DIALOG_Container_38g4hfm9');
                    logFirebaseEvent('Container_dismiss_dialog');
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: 40.0,
                    height: 40.0,
                    decoration: const BoxDecoration(),
                    child: Align(
                      alignment: const AlignmentDirectional(1.0, 0.0),
                      child: Icon(
                        FFIcons.kcross,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 24.0,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                child: Text(
                  'Are you sure you want to delete your account?',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).headlineSmall.override(
                        fontFamily: 'Sofia Pro',
                        fontWeight: FontWeight.w300,
                        useGoogleFonts: false,
                        lineHeight: 1.16,
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(13.0, 50.0, 13.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: FFButtonWidget(
                        onPressed: () async {
                          logFirebaseEvent(
                              'DELETE_ACCOUNT_DIALOG_COMP_NO_BTN_ON_TAP');
                          logFirebaseEvent('Button_dismiss_dialog');
                          Navigator.pop(context);
                        },
                        text: 'No',
                        options: FFButtonOptions(
                          height: 52.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: const Color(0x00073763),
                          textStyle: FlutterFlowTheme.of(context).headlineSmall,
                          elevation: 0.0,
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).primary,
                            width: 0.0,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    Expanded(
                      child: FFButtonWidget(
                        onPressed: () async {
                          logFirebaseEvent(
                              'DELETE_ACCOUNT_DIALOG_DELETE_BTN_ON_TAP');
                          logFirebaseEvent('Button_dismiss_dialog');
                          Navigator.pop(context, true);
                        },
                        text: 'Delete',
                        options: FFButtonOptions(
                          height: 52.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle: FlutterFlowTheme.of(context)
                              .headlineSmall
                              .override(
                                fontFamily: 'Sofia Pro',
                                color: FlutterFlowTheme.of(context).white,
                                useGoogleFonts: false,
                              ),
                          elevation: 0.0,
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                            width: 0.0,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ].divide(const SizedBox(width: 16.0)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
