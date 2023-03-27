import 'package:echo_log/components/color_square.dart';
import 'package:flutter/material.dart';
import '../flutter_flow/flutter_flow_theme.dart';

class ColorPicker extends StatefulWidget {
  ColorPicker({super.key, required this.emoji, required this.setColor});
  final String emoji;
  final void Function(dynamic) setColor;
  Color? color;

  @override
  State<ColorPicker> createState() => _ColorPickerState(emoji: emoji);

  Color? getColor() {
    return this.color;
  }
}

class _ColorPickerState extends State<ColorPicker> {
  _ColorPickerState({required this.emoji});
  final String emoji;
  Image checkMarkBlack = Image.asset('assets/images/checkmark_off_black.png',
      width: 50, height: 50, fit: BoxFit.cover);

  void _changeColor(color) {
    setState(() {
      widget.color = color;
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
                      widget.setColor(null);
                      //Navigator.pop(context);
                    }),
              ),
              Expanded(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 32),
                      child: Center(
                          child: widget.color == null
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
                          if (widget.color != null)
                            ColorSquare(color: widget.color!)
                        ]))
                  ],
                ),
              ),
              if (widget.color != null)
                SizedBox(
                    child: IconButton(
                        icon: checkMarkBlack,
                        constraints:
                            BoxConstraints.expand(width: 100, height: 100),
                        onPressed: (() {
                          widget.setColor(widget.color);
                          //Navigator.pop(context);
                        }))),
              Expanded(
                //Color Palette --to be refactored to a drawer later
                child: Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 0.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () => _changeColor(
                                    Color.fromARGB(255, 255, 191, 148)),
                                child: ColorSquare(
                                    color: Color.fromARGB(255, 255, 191, 148)),
                              ),
                              InkWell(
                                onTap: () => _changeColor(
                                    Color.fromARGB(255, 255, 216, 153)),
                                child: ColorSquare(
                                    color: Color.fromARGB(255, 255, 216, 153)),
                              ),
                              InkWell(
                                onTap: () => _changeColor(
                                    Color.fromARGB(255, 176, 255, 156)),
                                child: ColorSquare(
                                    color: Color.fromARGB(255, 176, 255, 156)),
                              ),
                              InkWell(
                                onTap: () => _changeColor(
                                    Color.fromARGB(255, 152, 216, 255)),
                                child: ColorSquare(
                                    color: Color.fromARGB(255, 152, 216, 255)),
                              ),
                              InkWell(
                                onTap: () => _changeColor(
                                    Color.fromARGB(255, 164, 148, 254)),
                                child: ColorSquare(
                                    color: Color.fromARGB(255, 164, 148, 254)),
                              ),
                              InkWell(
                                onTap: () => _changeColor(
                                    Color.fromARGB(255, 252, 150, 250)),
                                child: ColorSquare(
                                    color: Color.fromARGB(255, 252, 150, 250)),
                              ),
                              InkWell(
                                onTap: () => _changeColor(
                                    Color.fromARGB(255, 254, 152, 194)),
                                child: ColorSquare(
                                    color: Color.fromARGB(255, 254, 152, 194)),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 0.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () => _changeColor(
                                    Color.fromARGB(255, 249, 163, 106)),
                                child: ColorSquare(
                                    color: Color.fromARGB(255, 249, 163, 106)),
                              ),
                              InkWell(
                                onTap: () => _changeColor(
                                    Color.fromARGB(255, 255, 200, 111)),
                                child: ColorSquare(
                                    color: Color.fromARGB(255, 255, 200, 111)),
                              ),
                              InkWell(
                                onTap: () => _changeColor(
                                    Color.fromARGB(255, 140, 255, 111)),
                                child: ColorSquare(
                                    color: Color.fromARGB(255, 140, 255, 111)),
                              ),
                              InkWell(
                                onTap: () => _changeColor(
                                    Color.fromARGB(255, 101, 195, 253)),
                                child: ColorSquare(
                                    color: Color.fromARGB(255, 101, 195, 253)),
                              ),
                              InkWell(
                                onTap: () => _changeColor(
                                    Color.fromARGB(255, 124, 100, 255)),
                                child: ColorSquare(
                                    color: Color.fromARGB(255, 124, 100, 255)),
                              ),
                              InkWell(
                                onTap: () => _changeColor(
                                    Color.fromARGB(255, 255, 104, 252)),
                                child: ColorSquare(
                                    color: Color.fromARGB(255, 255, 104, 252)),
                              ),
                              InkWell(
                                onTap: () => _changeColor(
                                    Color.fromARGB(255, 255, 98, 164)),
                                child: ColorSquare(
                                    color: Color.fromARGB(255, 255, 98, 164)),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 0.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () => _changeColor(
                                    Color.fromARGB(255, 251, 135, 58)),
                                child: ColorSquare(
                                    color: Color.fromARGB(255, 251, 135, 58)),
                              ),
                              InkWell(
                                onTap: () => _changeColor(
                                    Color.fromARGB(255, 255, 177, 51)),
                                child: ColorSquare(
                                    color: Color.fromARGB(255, 255, 177, 51)),
                              ),
                              InkWell(
                                onTap: () => _changeColor(
                                    Color.fromARGB(255, 90, 255, 48)),
                                child: ColorSquare(
                                    color: Color.fromARGB(255, 90, 255, 48)),
                              ),
                              InkWell(
                                onTap: () => _changeColor(
                                    Color.fromARGB(255, 60, 180, 255)),
                                child: ColorSquare(
                                    color: Color.fromARGB(255, 60, 180, 255)),
                              ),
                              InkWell(
                                onTap: () => _changeColor(
                                    Color.fromARGB(255, 80, 49, 255)),
                                child: ColorSquare(
                                    color: Color.fromARGB(255, 80, 49, 255)),
                              ),
                              InkWell(
                                onTap: () => _changeColor(
                                    Color.fromARGB(255, 255, 48, 252)),
                                child: ColorSquare(
                                    color: Color.fromARGB(255, 255, 48, 252)),
                              ),
                              InkWell(
                                onTap: () => _changeColor(
                                    Color.fromARGB(255, 255, 45, 133)),
                                child: ColorSquare(
                                    color: Color.fromARGB(255, 255, 45, 133)),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 0.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () => _changeColor(
                                    Color.fromARGB(255, 255, 102, 0)),
                                child: ColorSquare(
                                    color: Color.fromARGB(255, 255, 102, 0)),
                              ),
                              InkWell(
                                onTap: () => _changeColor(
                                    Color.fromARGB(255, 255, 157, 0)),
                                child: ColorSquare(
                                    color: Color.fromARGB(255, 255, 157, 0)),
                              ),
                              InkWell(
                                onTap: () => _changeColor(
                                    Color.fromARGB(255, 51, 255, 0)),
                                child: ColorSquare(
                                    color: Color.fromARGB(255, 51, 255, 0)),
                              ),
                              InkWell(
                                onTap: () => _changeColor(
                                    Color.fromARGB(255, 0, 157, 255)),
                                child: ColorSquare(
                                    color: Color.fromARGB(255, 0, 157, 255)),
                              ),
                              InkWell(
                                onTap: () => _changeColor(
                                    Color.fromARGB(255, 38, 0, 255)),
                                child: ColorSquare(
                                    color: Color.fromARGB(255, 38, 0, 255)),
                              ),
                              InkWell(
                                onTap: () => _changeColor(
                                    Color.fromARGB(255, 255, 0, 251)),
                                child: ColorSquare(
                                    color: Color.fromARGB(255, 255, 0, 251)),
                              ),
                              InkWell(
                                onTap: () => _changeColor(
                                    Color.fromARGB(255, 255, 0, 106)),
                                child: ColorSquare(
                                    color: Color.fromARGB(255, 255, 0, 106)),
                              ),
                            ],
                          ),
                        )
                      ]),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class ColorPalette extends StatefulWidget {
  const ColorPalette({super.key});

  @override
  State<ColorPalette> createState() => _ColorPaletteState();
}

class _ColorPaletteState extends State<ColorPalette> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
