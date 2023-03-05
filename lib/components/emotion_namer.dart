import 'package:echo_log/components/color_square.dart';
import 'package:flutter/material.dart';
import 'package:emoji_selector/emoji_selector.dart';
import '../backend/emotion_service.dart';
import '../flutter_flow/flutter_flow_theme.dart';

class EmotionNamer extends StatefulWidget {
  final EmotionService emotService;
  final String emoji;
  final Color color;
  final Function() refreshParent;

  const EmotionNamer(
      {Key? key,
      required this.emotService,
      required this.emoji,
      required this.color,
      required this.refreshParent})
      : super(key: key);

  @override
  _EmotionNamerState createState() =>
      _EmotionNamerState(emotService, emoji, color, refreshParent);
}

class _EmotionNamerState extends State<EmotionNamer> {
  final EmotionService emotService;
  final String emoji;
  final Color color;
  String? name;

  final Function() refreshParent;
  Image checkMarkBlack = Image.asset('assets/images/checkmark_off_black.png',
      width: 100, height: 100, fit: BoxFit.cover);

  _EmotionNamerState(
      this.emotService, this.emoji, this.color, this.refreshParent);

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
                      Navigator.pop(context);
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
                                this.name = text;
                                setState(() {});
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: '',
                              ),
                            ),
                          )),
                      if (this.name != null && this.name!.length != 0)
                        Padding(
                          padding: EdgeInsets.only(top: 16),
                          child: IconButton(
                              icon: checkMarkBlack,
                              onPressed: () {
                                setState(() {
                                  widget.emotService.addEmotion(
                                      this.emoji, this.name!, this.color);
                                  widget.refreshParent();
                                  Navigator.pop(context);
                                });
                              }),
                        )
                    ],
                  ),
                )
              ]),
        ],
      ),
    );
  }
}
