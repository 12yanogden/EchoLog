import 'package:flutter/material.dart';
import 'package:emoji_selector/emoji_selector.dart';
import '../backend/emotion_service.dart';
import '../flutter_flow/flutter_flow_theme.dart';

class Popup {
  final EmotionService emotService;
  final Function() refreshParent;

  Popup({required this.emotService, required this.refreshParent});

  show(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return EmojiPickerWidget(
            emotService: emotService,
            refreshParent: refreshParent,
          );
        });
  }
}

class EmojiPickerWidget extends StatefulWidget {
  final EmotionService emotService;
  final Function() refreshParent;

  const EmojiPickerWidget(
      {Key? key, required this.emotService, required this.refreshParent})
      : super(key: key);

  @override
  _EmojiPickerWidgetState createState() => _EmojiPickerWidgetState();
}

class _EmojiPickerWidgetState extends State<EmojiPickerWidget> {
  EmojiData? emojiData;
  Image checkMarkBlack = Image.asset('assets/images/checkmark_off_black.png',
      width: 100, height: 100, fit: BoxFit.cover);

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
                        child: Text('Which emoji matches you?',
                            style: TextStyle(
                              wordSpacing: 0,
                              letterSpacing: 0,
                              fontSize: 25,
                              color: FlutterFlowTheme.of(context).primaryText,
                            )),
                      ),
                    ),
                    if (emojiData?.id != null)
                      Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: Text(
                              '${emojiData?.char}',
                              style: const TextStyle(
                                fontSize: 70,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 16),
                            child: IconButton(
                                icon: checkMarkBlack,
                                onPressed: () {
                                  setState(() {
                                    // todo: move to color picker screen
                                    widget.emotService.addEmotion(
                                        '${emojiData?.char}',
                                        '${emojiData?.name}',
                                        Colors.deepOrange);
                                    widget.refreshParent();
                                    Navigator.pop(context);
                                  });
                                }),
                          )
                        ],
                      )
                  ],
                ),
              ),
              EmojiSelector(
                padding: const EdgeInsets.all(20),
                onSelected: (emoji) {
                  setState(() {
                    emojiData = emoji;
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
