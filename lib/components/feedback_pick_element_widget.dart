import '/components/check_mark_blue_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'feedback_pick_element_model.dart';
export 'feedback_pick_element_model.dart';

class FeedbackPickElementWidget extends StatefulWidget {
  const FeedbackPickElementWidget({
    super.key,
    required this.isPicked,
    required this.text,
  });

  final bool? isPicked;
  final String? text;

  @override
  State<FeedbackPickElementWidget> createState() =>
      _FeedbackPickElementWidgetState();
}

class _FeedbackPickElementWidgetState extends State<FeedbackPickElementWidget> {
  late FeedbackPickElementModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FeedbackPickElementModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            wrapWithModel(
              model: _model.checkMarkBlueModel,
              updateCallback: () => setState(() {}),
              updateOnChange: true,
              child: CheckMarkBlueWidget(
                boolean: widget.isPicked!,
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
              child: AutoSizeText(
                widget.text!.maybeHandleOverflow(maxChars: 18),
                style: FlutterFlowTheme.of(context).headlineMedium,
                minFontSize: 10.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
