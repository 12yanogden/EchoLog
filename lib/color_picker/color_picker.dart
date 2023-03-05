import 'package:flutter/material.dart';
import 'package:emoji_selector/emoji_selector.dart';
import '../flutter_flow/flutter_flow_theme.dart';

class ColorPicker extends StatefulWidget {
  const ColorPicker({super.key, required this.emoji});
  final EmojiData emoji;

  @override
  State<ColorPicker> createState() => _ColorPickerState(emoji: emoji);
}

class _ColorPickerState extends State<ColorPicker> {
  _ColorPickerState({required this.emoji});
  final EmojiData emoji;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Padding(
        padding: EdgeInsets.only(top: 32),
        child: Center(
            child: Column(
          children: [
            Text('Choose a color for',
                textAlign: TextAlign.center,
                style: TextStyle(
                  wordSpacing: 0,
                  letterSpacing: 0,
                  fontSize: 25,
                  color: FlutterFlowTheme.of(context).primaryText,
                )),
            Center(
              child: Row(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Text(
                          '${emoji.char}',
                          style: const TextStyle(
                            fontSize: 70,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        )),
      ),
    ));
  }
}
