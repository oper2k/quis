import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'no_user_found_dialog_model.dart';
export 'no_user_found_dialog_model.dart';

class NoUserFoundDialogWidget extends StatefulWidget {
  const NoUserFoundDialogWidget({super.key});

  @override
  State<NoUserFoundDialogWidget> createState() =>
      _NoUserFoundDialogWidgetState();
}

class _NoUserFoundDialogWidgetState extends State<NoUserFoundDialogWidget> {
  late NoUserFoundDialogModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NoUserFoundDialogModel());
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
          padding: const EdgeInsetsDirectional.fromSTEB(16.0, 2.0, 16.0, 38.0),
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
                    alignment: const AlignmentDirectional(1.0, -1.0),
                    child: Container(
                      width: 40.0,
                      height: 40.0,
                      decoration: const BoxDecoration(),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(1.0, -1.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        logFirebaseEvent(
                            'NO_USER_FOUND_DIALOG_Container_handns8q_');
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
                ],
              ),
              Text(
                'Unfortunately, we were unable to find a partner for you to practice with today; \n\nSometimes, this happens due to a low number of people who registered for practice.\n\nWhat should you do?\n\n- Register for a new Practice Interview.\n- Log in 5 minutes prior to the Practice Interview start and tap \"Join Now.\"\n\n(If you are on Freemium, we will not count this attempt since you haven\'t practiced yet.)',
                textAlign: TextAlign.start,
                style: FlutterFlowTheme.of(context).headlineSmall.override(
                      fontFamily: 'Sofia Pro',
                      fontWeight: FontWeight.w300,
                      useGoogleFonts: false,
                      lineHeight: 1.16,
                    ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(21.0, 22.0, 21.0, 0.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    logFirebaseEvent('NO_USER_FOUND_DIALOG_COMP_OK_BTN_ON_TAP');
                    logFirebaseEvent('Button_dismiss_dialog');
                    Navigator.pop(context);
                  },
                  text: 'OK',
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 52.0,
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    iconPadding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle:
                        FlutterFlowTheme.of(context).headlineLarge.override(
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
            ],
          ),
        ),
      ),
    );
  }
}
