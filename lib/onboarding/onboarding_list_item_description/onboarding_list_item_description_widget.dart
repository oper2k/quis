import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'onboarding_list_item_description_model.dart';
export 'onboarding_list_item_description_model.dart';

class OnboardingListItemDescriptionWidget extends StatefulWidget {
  const OnboardingListItemDescriptionWidget({
    super.key,
    required this.title,
    required this.description,
    this.image,
    bool? isPicked,
  }) : this.isPicked = isPicked ?? false;

  final String? title;
  final String? description;
  final String? image;
  final bool isPicked;

  @override
  State<OnboardingListItemDescriptionWidget> createState() =>
      _OnboardingListItemDescriptionWidgetState();
}

class _OnboardingListItemDescriptionWidgetState
    extends State<OnboardingListItemDescriptionWidget> {
  late OnboardingListItemDescriptionModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OnboardingListItemDescriptionModel());
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
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: Text(
                    valueOrDefault<String>(
                      widget.title,
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
                if (widget.image != null && widget.image != '')
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(0.0),
                      child: Image.network(
                        widget.image!,
                        width: 24.0,
                        height: 24.0,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
              ],
            ),
            if (widget.isPicked)
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                child: Text(
                  valueOrDefault<String>(
                    widget.description,
                    'description',
                  ),
                  style: FlutterFlowTheme.of(context).labelLarge.override(
                        fontFamily: 'Sofia Pro',
                        color: FlutterFlowTheme.of(context).info,
                        useGoogleFonts: false,
                      ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
