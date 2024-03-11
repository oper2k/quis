import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'feature_list_item_model.dart';
export 'feature_list_item_model.dart';

class FeatureListItemWidget extends StatefulWidget {
  const FeatureListItemWidget({
    super.key,
    required this.colorIcon,
    required this.colorText,
    required this.text,
  });

  final Color? colorIcon;
  final Color? colorText;
  final String? text;

  @override
  State<FeatureListItemWidget> createState() => _FeatureListItemWidgetState();
}

class _FeatureListItemWidgetState extends State<FeatureListItemWidget> {
  late FeatureListItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FeatureListItemModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Icon(
            FFIcons.kslected,
            color: widget.colorIcon,
            size: 30.0,
          ),
          Expanded(
            child: AutoSizeText(
              widget.text!,
              style: FlutterFlowTheme.of(context).headlineSmall.override(
                    fontFamily: 'Sofia Pro',
                    color: widget.colorText,
                    fontWeight: FontWeight.w300,
                    useGoogleFonts: false,
                    lineHeight: 1.16,
                  ),
              minFontSize: 12.0,
            ),
          ),
        ].divide(SizedBox(width: 21.0)),
      ),
    );
  }
}
