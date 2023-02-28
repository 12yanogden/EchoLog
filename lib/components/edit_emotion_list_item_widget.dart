import 'package:echo_log/backend/emotion_service.dart';

import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../models/emotion.dart';

class EditEmotionListItemWidget extends StatefulWidget {
  const EditEmotionListItemWidget({
    Key? key,
    required this.emotion,
  }) : super(key: key);

  final Emotion emotion;

  @override
  _EditEmotionListItemWidgetState createState() =>
      _EditEmotionListItemWidgetState();
}

class _EditEmotionListItemWidgetState extends State<EditEmotionListItemWidget> {
  TextEditingController? emotionNameController;

  @override
  void initState() {
    super.initState();
    emotionNameController = TextEditingController(
      text: widget.emotion.name // getJsonField(widget.emotion, r'''$.name''',).toString().toString()
    );
  }

  @override
  void dispose() {
    emotionNameController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(22, 22, 22, 0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 11, 0),
            child: Text( 
              widget.emotion.emoji, 
              textAlign: TextAlign.center, 
              style: TextStyle(
                fontSize: 32.0,
              )
            ),
            /*
            Image.network(
              getJsonField(
                widget.emotion,
                r'''$.icon''',
              ),
              width: 32,
              height: 32,
              fit: BoxFit.cover,
            ),
            */
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 22, 0),
            child: Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: widget.emotion.color,   // colorFromCssString( getJsonField( widget.emotion, r'''$.color''',).toString(), defaultColor: FlutterFlowTheme.of(context).primaryColor,),
                borderRadius: BorderRadius.circular(6),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 22, 0),
              child: TextFormField(
                readOnly: true, // This makes it uneditable - remove if adding functionality of editing names
                controller: emotionNameController,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'Emotion Name',
                  hintStyle: FlutterFlowTheme.of(context).bodyText2,
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFFE5E5EA),
                      width: 1,
                    ),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(4.0),
                      topRight: Radius.circular(4.0),
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFFE5E5EA),
                      width: 1,
                    ),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(4.0),
                      topRight: Radius.circular(4.0),
                    ),
                  ),
                  errorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0x00000000),
                      width: 1,
                    ),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(4.0),
                      topRight: Radius.circular(4.0),
                    ),
                  ),
                  focusedErrorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0x00000000),
                      width: 1,
                    ),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(4.0),
                      topRight: Radius.circular(4.0),
                    ),
                  ),
                ),
                style: FlutterFlowTheme.of(context).bodyText1,
              ),
            ),
          ),
          InkWell(
            onTap: () async {
              FFAppState().update(() {
                EmotionService().removeCurEmotionByID(widget.emotion.id);
                //FFAppState().removeFromEmotions(widget.emotion!);
              });
            },
            child: Icon(
              Icons.close,
              color: FlutterFlowTheme.of(context).alternate,
              size: 24,
            ),
          ),
        ],
      ),
    );
  }
}
