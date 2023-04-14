import 'package:echo_log/components/color_square.dart';
import 'package:flutter/material.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../components/color_palette.dart';

class ColorPicker extends StatefulWidget {
  ColorPicker({super.key, required this.emoji, required this.setColor});
  final String emoji;
  final void Function(dynamic) setColor;
  Color? color;

  @override
  State<ColorPicker> createState() => _ColorPickerState(emoji: emoji);

  Color? getColor() {
    return color;
  }
}

class _ColorPickerState extends State<ColorPicker> {
  _ColorPickerState({required this.emoji});
  Color? color;
  final String emoji;
  Image checkMarkBlack = Image.asset('assets/images/checkmark_off_black.png',
      width: 50, height: 50, fit: BoxFit.cover);

  callback(newColor) {
    setState(() {
      color = newColor;
    });
  }

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
                    }),
              ),
              Expanded(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 32),
                      child: Center(
                          child: color == null
                              ? Text('Choose a color for',
                                  style: TextStyle(
                                    wordSpacing: 0,
                                    letterSpacing: 0,
                                    fontSize: 25,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ))
                              : Text('Confirm?',
                                  style: TextStyle(
                                    wordSpacing: 0,
                                    letterSpacing: 0,
                                    fontSize: 25,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ))),
                    ),
                    Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Wrap(spacing: 20, children: [
                          Text(
                            textAlign: TextAlign.center,
                            '${this.emoji}',
                            style: const TextStyle(
                              fontSize: 32,
                            ),
                          ),
                          if (color != null) ColorSquare(color: color!)
                        ]))
                  ],
                ),
              ),
              if (color != null)
                SizedBox(
                    child: IconButton(
                        icon: checkMarkBlack,
                        constraints:
                            BoxConstraints.expand(width: 100, height: 100),
                        onPressed: (() {
                          widget.setColor(color);
                          Navigator.pop(context);
                        }))),
              ColorPalette(callback: callback),
            ],
          ),
        ],
      ),
    );
  }
}
