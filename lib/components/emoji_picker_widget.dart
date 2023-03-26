import 'package:flutter/material.dart';
import 'package:emoji_selector/emoji_selector.dart';
import '../flutter_flow/flutter_flow_theme.dart';

class EmojiPickerWidget extends StatefulWidget {
  EmojiPickerWidget({Key? key, required this.setEmoji}) : super(key: key);
  final void Function(dynamic) setEmoji;
  // final void Function() refresh;
  late final String? emoji;

  @override
  _EmojiPickerWidgetState createState() => _EmojiPickerWidgetState();

  String? getEmoji() {
    return this.emoji;
  }
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
                    widget.setEmoji(null);
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
                                onPressed: (() {
                                  widget.setEmoji(emojiData?.char);
                                  // widget.refresh();
                                  //Navigator.pop(context);
                                })),
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
