import '/components/check_mark_blue_widget.dart';
import '/components/filter_element_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'questions_filter_bottom_sheet_model.dart';
export 'questions_filter_bottom_sheet_model.dart';

class QuestionsFilterBottomSheetWidget extends StatefulWidget {
  const QuestionsFilterBottomSheetWidget({
    Key? key,
    required this.filterList,
  }) : super(key: key);

  final List<String>? filterList;

  @override
  _QuestionsFilterBottomSheetWidgetState createState() =>
      _QuestionsFilterBottomSheetWidgetState();
}

class _QuestionsFilterBottomSheetWidgetState
    extends State<QuestionsFilterBottomSheetWidget> {
  late QuestionsFilterBottomSheetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QuestionsFilterBottomSheetModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.filterList = widget.filterList!.toList().cast<String>();
      });
    });
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(10.0),
          topRight: Radius.circular(10.0),
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16.0, 40.0, 16.0, 0.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Filter',
              style: FlutterFlowTheme.of(context).headlineLarge,
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 28.0, 0.0, 0.0),
              child: Wrap(
                spacing: 10.0,
                runSpacing: 10.0,
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.start,
                direction: Axis.horizontal,
                runAlignment: WrapAlignment.start,
                verticalDirection: VerticalDirection.down,
                clipBehavior: Clip.none,
                children: [
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      if (_model.filterList.contains('Hot')) {
                        setState(() {
                          _model.removeFromFilterList('Hot');
                        });
                      } else {
                        setState(() {
                          _model.addToFilterList('Hot');
                        });
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 5.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            wrapWithModel(
                              model: _model.checkMarkBlueModel1,
                              updateCallback: () => setState(() {}),
                              child: CheckMarkBlueWidget(
                                boolean: _model.filterList.contains('Hot'),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  5.0, 0.0, 0.0, 0.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.asset(
                                  'assets/images/rw3xw_.webp',
                                  width: 20.0,
                                  height: 20.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  5.0, 0.0, 0.0, 0.0),
                              child: AutoSizeText(
                                'Hot',
                                style:
                                    FlutterFlowTheme.of(context).headlineMedium,
                                minFontSize: 14.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      if (_model.filterList.contains('Popular')) {
                        setState(() {
                          _model.removeFromFilterList('Popular');
                        });
                      } else {
                        setState(() {
                          _model.addToFilterList('Popular');
                        });
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 5.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            wrapWithModel(
                              model: _model.checkMarkBlueModel2,
                              updateCallback: () => setState(() {}),
                              child: CheckMarkBlueWidget(
                                boolean: _model.filterList.contains('Popular'),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  5.0, 0.0, 0.0, 0.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.asset(
                                  'assets/images/1y30f_.webp',
                                  width: 20.0,
                                  height: 20.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  5.0, 0.0, 0.0, 0.0),
                              child: AutoSizeText(
                                'Popular',
                                style:
                                    FlutterFlowTheme.of(context).headlineMedium,
                                minFontSize: 14.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      if (_model.filterList.contains('Newest')) {
                        setState(() {
                          _model.removeFromFilterList('Newest');
                        });
                      } else {
                        setState(() {
                          _model.addToFilterList('Newest');
                        });
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 5.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            wrapWithModel(
                              model: _model.checkMarkBlueModel3,
                              updateCallback: () => setState(() {}),
                              child: CheckMarkBlueWidget(
                                boolean: _model.filterList.contains('Newest'),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  5.0, 0.0, 0.0, 0.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.asset(
                                  'assets/images/z8p64_.webp',
                                  width: 20.0,
                                  height: 20.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  5.0, 0.0, 0.0, 0.0),
                              child: AutoSizeText(
                                'Newest',
                                style:
                                    FlutterFlowTheme.of(context).headlineMedium,
                                minFontSize: 14.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: AlignmentDirectional(-1.00, 0.00),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 31.0, 0.0, 0.0),
                child: Text(
                  'Role',
                  style: FlutterFlowTheme.of(context).headlineMedium,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
              child: Builder(
                builder: (context) {
                  final role = FFAppState().filterRoleList.toList();
                  return Wrap(
                    spacing: 9.0,
                    runSpacing: 9.0,
                    alignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    direction: Axis.horizontal,
                    runAlignment: WrapAlignment.start,
                    verticalDirection: VerticalDirection.down,
                    clipBehavior: Clip.none,
                    children: List.generate(role.length, (roleIndex) {
                      final roleItem = role[roleIndex];
                      return InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          if (_model.filterList.contains(roleItem)) {
                            setState(() {
                              _model.removeFromFilterList(roleItem);
                            });
                          } else {
                            setState(() {
                              _model.addToFilterList(roleItem);
                            });
                          }
                        },
                        child: FilterElementWidget(
                          key: Key('Keyj0u_${roleIndex}_of_${role.length}'),
                          isPicked: _model.filterList.contains(roleItem),
                          text: roleItem,
                        ),
                      );
                    }),
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 40.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: FFButtonWidget(
                      onPressed: () async {
                        Navigator.pop(context);
                      },
                      text: 'Cancel',
                      options: FFButtonOptions(
                        height: 45.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).white,
                        textStyle:
                            FlutterFlowTheme.of(context).headlineLarge.override(
                                  fontFamily: 'Sofia Pro',
                                  color: FlutterFlowTheme.of(context).primary,
                                  useGoogleFonts: false,
                                ),
                        elevation: 0.0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 0.0,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  Expanded(
                    child: FFButtonWidget(
                      onPressed: () async {
                        Navigator.pop(context, _model.filterList);
                      },
                      text: 'Save',
                      options: FFButtonOptions(
                        height: 45.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).headlineLarge.override(
                                  fontFamily: 'Sofia Pro',
                                  color: FlutterFlowTheme.of(context).white,
                                  useGoogleFonts: false,
                                ),
                        elevation: 0.0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 0.0,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ].divide(SizedBox(width: 30.0)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
