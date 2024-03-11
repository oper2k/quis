import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'onboarding_list_item_practice_time_model.dart';
export 'onboarding_list_item_practice_time_model.dart';

class OnboardingListItemPracticeTimeWidget extends StatefulWidget {
  const OnboardingListItemPracticeTimeWidget({
    super.key,
    required this.textLeft,
    required this.textRight,
    bool? isPicked,
  }) : this.isPicked = isPicked ?? false;

  final String? textLeft;
  final String? textRight;
  final bool isPicked;

  @override
  State<OnboardingListItemPracticeTimeWidget> createState() =>
      _OnboardingListItemPracticeTimeWidgetState();
}

class _OnboardingListItemPracticeTimeWidgetState
    extends State<OnboardingListItemPracticeTimeWidget> {
  late OnboardingListItemPracticeTimeModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OnboardingListItemPracticeTimeModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: widget.isPicked
            ? FlutterFlowTheme.of(context).powderBlue
            : FlutterFlowTheme.of(context).white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(12.0, 14.0, 12.0, 14.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Text(
                valueOrDefault<String>(
                  widget.textLeft,
                  'title',
                ),
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Sofia Pro',
                      color: widget.isPicked
                          ? FlutterFlowTheme.of(context).info
                          : FlutterFlowTheme.of(context).primaryText,
                      useGoogleFonts: false,
                    ),
              ),
            ),
            Text(
              valueOrDefault<String>(
                widget.textRight,
                'text',
              ),
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    fontFamily: 'Sofia Pro',
                    color: widget.isPicked
                        ? FlutterFlowTheme.of(context).info
                        : FlutterFlowTheme.of(context).accent3,
                    useGoogleFonts: false,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
