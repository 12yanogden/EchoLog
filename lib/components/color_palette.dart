import 'package:echo_log/components/color_square.dart';
import 'package:flutter/material.dart';

class ColorPalette extends StatefulWidget {
  final Function callback;
  const ColorPalette({super.key, required this.callback});

  @override
  State<ColorPalette> createState() => _ColorPaletteState(callback: callback);
}

class _ColorPaletteState extends State<ColorPalette> {
  final Function callback;
  _ColorPaletteState({required this.callback});

  double _height = 0;

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(milliseconds: 300), () {
      setState(() {
        _height = 350;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeIn,
      height: _height,
      color: Color.fromARGB(255, 231, 231, 231),
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
                      onTap: () => callback(Color.fromARGB(255, 255, 191, 148)),
                      child: ColorSquare(
                          color: Color.fromARGB(255, 255, 191, 148)),
                    ),
                    InkWell(
                      onTap: () => callback(Color.fromARGB(255, 255, 216, 153)),
                      child: ColorSquare(
                          color: Color.fromARGB(255, 255, 216, 153)),
                    ),
                    InkWell(
                      onTap: () => callback(Color.fromARGB(255, 176, 255, 156)),
                      child: ColorSquare(
                          color: Color.fromARGB(255, 176, 255, 156)),
                    ),
                    InkWell(
                      onTap: () => callback(Color.fromARGB(255, 152, 216, 255)),
                      child: ColorSquare(
                          color: Color.fromARGB(255, 152, 216, 255)),
                    ),
                    InkWell(
                      onTap: () => callback(Color.fromARGB(255, 164, 148, 254)),
                      child: ColorSquare(
                          color: Color.fromARGB(255, 164, 148, 254)),
                    ),
                    InkWell(
                      onTap: () => callback(Color.fromARGB(255, 252, 150, 250)),
                      child: ColorSquare(
                          color: Color.fromARGB(255, 252, 150, 250)),
                    ),
                    InkWell(
                      onTap: () => callback(Color.fromARGB(255, 254, 152, 194)),
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
                      onTap: () => callback(Color.fromARGB(255, 249, 163, 106)),
                      child: ColorSquare(
                          color: Color.fromARGB(255, 249, 163, 106)),
                    ),
                    InkWell(
                      onTap: () => callback(Color.fromARGB(255, 255, 200, 111)),
                      child: ColorSquare(
                          color: Color.fromARGB(255, 255, 200, 111)),
                    ),
                    InkWell(
                      onTap: () => callback(Color.fromARGB(255, 140, 255, 111)),
                      child: ColorSquare(
                          color: Color.fromARGB(255, 140, 255, 111)),
                    ),
                    InkWell(
                      onTap: () => callback(Color.fromARGB(255, 101, 195, 253)),
                      child: ColorSquare(
                          color: Color.fromARGB(255, 101, 195, 253)),
                    ),
                    InkWell(
                      onTap: () => callback(Color.fromARGB(255, 124, 100, 255)),
                      child: ColorSquare(
                          color: Color.fromARGB(255, 124, 100, 255)),
                    ),
                    InkWell(
                      onTap: () => callback(Color.fromARGB(255, 255, 104, 252)),
                      child: ColorSquare(
                          color: Color.fromARGB(255, 255, 104, 252)),
                    ),
                    InkWell(
                      onTap: () => callback(Color.fromARGB(255, 255, 98, 164)),
                      child:
                          ColorSquare(color: Color.fromARGB(255, 255, 98, 164)),
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
                      onTap: () => callback(Color.fromARGB(255, 251, 135, 58)),
                      child:
                          ColorSquare(color: Color.fromARGB(255, 251, 135, 58)),
                    ),
                    InkWell(
                      onTap: () => callback(Color.fromARGB(255, 255, 177, 51)),
                      child:
                          ColorSquare(color: Color.fromARGB(255, 255, 177, 51)),
                    ),
                    InkWell(
                      onTap: () => callback(Color.fromARGB(255, 90, 255, 48)),
                      child:
                          ColorSquare(color: Color.fromARGB(255, 90, 255, 48)),
                    ),
                    InkWell(
                      onTap: () => callback(Color.fromARGB(255, 60, 180, 255)),
                      child:
                          ColorSquare(color: Color.fromARGB(255, 60, 180, 255)),
                    ),
                    InkWell(
                      onTap: () => callback(Color.fromARGB(255, 80, 49, 255)),
                      child:
                          ColorSquare(color: Color.fromARGB(255, 80, 49, 255)),
                    ),
                    InkWell(
                      onTap: () => callback(Color.fromARGB(255, 255, 48, 252)),
                      child:
                          ColorSquare(color: Color.fromARGB(255, 255, 48, 252)),
                    ),
                    InkWell(
                      onTap: () => callback(Color.fromARGB(255, 255, 45, 133)),
                      child:
                          ColorSquare(color: Color.fromARGB(255, 255, 45, 133)),
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
                      onTap: () => callback(Color.fromARGB(255, 255, 102, 0)),
                      child:
                          ColorSquare(color: Color.fromARGB(255, 255, 102, 0)),
                    ),
                    InkWell(
                      onTap: () => callback(Color.fromARGB(255, 255, 157, 0)),
                      child:
                          ColorSquare(color: Color.fromARGB(255, 255, 157, 0)),
                    ),
                    InkWell(
                      onTap: () => callback(Color.fromARGB(255, 51, 255, 0)),
                      child:
                          ColorSquare(color: Color.fromARGB(255, 51, 255, 0)),
                    ),
                    InkWell(
                      onTap: () => callback(Color.fromARGB(255, 0, 157, 255)),
                      child:
                          ColorSquare(color: Color.fromARGB(255, 0, 157, 255)),
                    ),
                    InkWell(
                      onTap: () => callback(Color.fromARGB(255, 38, 0, 255)),
                      child:
                          ColorSquare(color: Color.fromARGB(255, 38, 0, 255)),
                    ),
                    InkWell(
                      onTap: () => callback(Color.fromARGB(255, 255, 0, 251)),
                      child:
                          ColorSquare(color: Color.fromARGB(255, 255, 0, 251)),
                    ),
                    InkWell(
                      onTap: () => callback(Color.fromARGB(255, 255, 0, 106)),
                      child:
                          ColorSquare(color: Color.fromARGB(255, 255, 0, 106)),
                    ),
                  ],
                ),
              )
            ]),
      ),
    );
  }
}
