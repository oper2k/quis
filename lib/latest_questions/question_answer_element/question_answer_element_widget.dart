import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'question_answer_element_model.dart';
export 'question_answer_element_model.dart';

class QuestionAnswerElementWidget extends StatefulWidget {
  const QuestionAnswerElementWidget({Key? key}) : super(key: key);

  @override
  _QuestionAnswerElementWidgetState createState() =>
      _QuestionAnswerElementWidgetState();
}

class _QuestionAnswerElementWidgetState
    extends State<QuestionAnswerElementWidget> {
  late QuestionAnswerElementModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QuestionAnswerElementModel());

    _model.questionFieldController ??= TextEditingController();
    _model.questionFieldFocusNode ??= FocusNode();

    _model.answerFieldController ??= TextEditingController();
    _model.answerFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Form(
      key: _model.formKey,
      autovalidateMode: AutovalidateMode.always,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 27.0, 0.0, 0.0),
            child: Text(
              'Interview question',
              style: FlutterFlowTheme.of(context).headlineSmall,
            ),
          ),
          TextFormField(
            controller: _model.questionFieldController,
            focusNode: _model.questionFieldFocusNode,
            onChanged: (_) => EasyDebounce.debounce(
              '_model.questionFieldController',
              Duration(milliseconds: 2000),
              () async {
                setState(() {
                  _model.questionState = _model.questionFieldController.text;
                });
                if (_model.formKey.currentState == null ||
                    !_model.formKey.currentState!.validate()) {
                  return;
                }
                setState(() {
                  _model.isValid = false;
                });
              },
            ),
            obscureText: false,
            decoration: InputDecoration(
              hintText: 'Your question',
              hintStyle: FlutterFlowTheme.of(context).headlineSmall.override(
                    fontFamily: 'Sofia Pro',
                    color: FlutterFlowTheme.of(context).accent2,
                    useGoogleFonts: false,
                    lineHeight: 1.16,
                  ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0x00000000),
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).alternate,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).error,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).error,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              filled: true,
              fillColor: FlutterFlowTheme.of(context).white,
              contentPadding:
                  EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
            ),
            style: FlutterFlowTheme.of(context).headlineSmall,
            maxLines: null,
            minLines: 4,
            maxLength: 400,
            validator:
                _model.questionFieldControllerValidator.asValidator(context),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 0.0),
            child: Text(
              'Your answer *',
              style: FlutterFlowTheme.of(context).headlineSmall,
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 0.0),
            child: TextFormField(
              controller: _model.answerFieldController,
              focusNode: _model.answerFieldFocusNode,
              onChanged: (_) => EasyDebounce.debounce(
                '_model.answerFieldController',
                Duration(milliseconds: 2000),
                () async {
                  setState(() {
                    _model.answerState = _model.answerFieldController.text;
                  });
                  if (_model.formKey.currentState == null ||
                      !_model.formKey.currentState!.validate()) {
                    return;
                  }
                  setState(() {
                    _model.isValid = true;
                  });
                },
              ),
              obscureText: false,
              decoration: InputDecoration(
                hintText: 'Your answer',
                hintStyle: FlutterFlowTheme.of(context).headlineSmall.override(
                      fontFamily: 'Sofia Pro',
                      color: FlutterFlowTheme.of(context).accent2,
                      useGoogleFonts: false,
                      lineHeight: 1.16,
                    ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0x00000000),
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).alternate,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).error,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).error,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                filled: true,
                fillColor: FlutterFlowTheme.of(context).white,
                contentPadding:
                    EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
              ),
              style: FlutterFlowTheme.of(context).headlineSmall,
              validator:
                  _model.answerFieldControllerValidator.asValidator(context),
            ),
          ),
        ],
      ),
    );
  }
}
