import 'package:echo_log/components/color_square.dart';
import 'package:flutter/material.dart';
import '../flutter_flow/flutter_flow_theme.dart';

class EmotionNamer extends StatefulWidget {
  EmotionNamer(
      {super.key,
      required this.emoji,
      required this.color,
      required this.setEmotionName});
  final String emoji;
  final Color color;
  final void Function(dynamic) setEmotionName;
  String? emotionName;

  @override
  _EmotionNamerState createState() => _EmotionNamerState(emoji, color);

  String? getEmotionName() {
    return this.emotionName;
  }
}

class _EmotionNamerState extends State<EmotionNamer> {
  final String emoji;
  final Color color;
  Image checkMarkBlack = Image.asset('assets/images/checkmark_off_black.png',
      width: 100, height: 100, fit: BoxFit.cover);

  _EmotionNamerState(this.emoji, this.color);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(24),
        ),
      ),
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      insetPadding: EdgeInsets.all(0),
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    icon: Icon(
                      Icons.close,
                      color: FlutterFlowTheme.of(context).alternate,
                      size: 25,
                    ),
                    onPressed: () {
                      widget.setEmotionName(null);
                      //Navigator.pop(context);
                    },
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 32),
                        child: Center(
                          child: Text('Choose a name for',
                              style: TextStyle(
                                wordSpacing: 0,
                                letterSpacing: 0,
                                fontSize: 25,
                                color: FlutterFlowTheme.of(context).primaryText,
                              )),
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: Wrap(
                            // mainAxisAlignment: MainAxisAlignment.center,
                            spacing: 20,
                            children: [
                              Text(
                                textAlign: TextAlign.center,
                                '${this.emoji}',
                                style: const TextStyle(
                                  fontSize: 32,
                                ),
                              ),
                              ColorSquare(color: color)
                            ],
                          )),
                      Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: SizedBox(
                            width: 300,
                            child: TextField(
                              onChanged: (text) {
                                setState(() {
                                  widget.emotionName = text;
                                });
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: '',
                              ),
                            ),
                          )),
                      if (widget.emotionName != null &&
                          widget.emotionName!.length != 0)
                        Padding(
                            padding: EdgeInsets.only(top: 16),
                            child: IconButton(
                                icon: checkMarkBlack,
                                onPressed: (() {
                                  widget.setEmotionName(widget.emotionName);
                                  //Navigator.pop(context);
                                }))),
                    ],
                  ),
                )
              ]),
        ],
      ),
    );
  }
}
