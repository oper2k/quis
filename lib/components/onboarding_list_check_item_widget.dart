import '/components/check_mark_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'onboarding_list_check_item_model.dart';
export 'onboarding_list_check_item_model.dart';

class OnboardingListCheckItemWidget extends StatefulWidget {
  const OnboardingListCheckItemWidget({
    super.key,
    required this.text,
  });

  final String? text;

  @override
  State<OnboardingListCheckItemWidget> createState() =>
      _OnboardingListCheckItemWidgetState();
}

class _OnboardingListCheckItemWidgetState
    extends State<OnboardingListCheckItemWidget> {
  late OnboardingListCheckItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OnboardingListCheckItemModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        wrapWithModel(
          model: _model.checkMarkModel,
          updateCallback: () => setState(() {}),
          child: CheckMarkWidget(
            boolean: true,
            backgroundColor: FlutterFlowTheme.of(context).blueLink,
          ),
        ),
        Flexible(
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
            child: Text(
              valueOrDefault<String>(
                widget.text,
                'text',
              ),
              style: FlutterFlowTheme.of(context).labelLarge.override(
                    fontFamily: 'Sofia Pro',
                    useGoogleFonts: false,
                    lineHeight: 1.25,
                  ),
            ),
          ),
        ),
      ],
    );
  }
}
