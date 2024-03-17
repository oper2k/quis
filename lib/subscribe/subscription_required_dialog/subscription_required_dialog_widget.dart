import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'subscription_required_dialog_model.dart';
export 'subscription_required_dialog_model.dart';

class SubscriptionRequiredDialogWidget extends StatefulWidget {
  const SubscriptionRequiredDialogWidget({
    super.key,
    required this.text,
    this.action,
    bool? isAction,
  }) : isAction = isAction ?? false;

  final String? text;
  final Future Function()? action;
  final bool isAction;

  @override
  State<SubscriptionRequiredDialogWidget> createState() =>
      _SubscriptionRequiredDialogWidgetState();
}

class _SubscriptionRequiredDialogWidgetState
    extends State<SubscriptionRequiredDialogWidget> {
  late SubscriptionRequiredDialogModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SubscriptionRequiredDialogModel());
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
                        'SUBSCRIPTION_REQUIRED_DIALOG_Container_y');
                    if (widget.isAction) {
                      logFirebaseEvent('Container_execute_callback');
                      await widget.action?.call();
                    } else {
                      logFirebaseEvent('Container_dismiss_dialog');
                      Navigator.pop(context);
                    }
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
                              'SUBSCRIPTION_REQUIRED_DIALOG_Icon_yk4jqn');
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
              Lottie.asset(
                'assets/lottie_animations/animation_lnyxrxis.json',
                width: 150.0,
                height: 130.0,
                fit: BoxFit.cover,
                animate: true,
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 22.0, 0.0, 0.0),
                child: Text(
                  widget.text!,
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
                padding: const EdgeInsetsDirectional.fromSTEB(20.0, 25.0, 20.0, 0.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    logFirebaseEvent(
                        'SUBSCRIPTION_REQUIRED_DIALOG_VIEW_PLANS_');
                    logFirebaseEvent('Button_navigate_to');

                    context.pushNamed(
                      'Pricing',
                      queryParameters: {
                        'offers': serializeParam(
                          PaywallPrice.standard,
                          ParamType.Enum,
                        ),
                      }.withoutNulls,
                    );
                  },
                  text: 'View Plans',
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
