import 'package:flutter/material.dart';
import '../flutter_flow/flutter_flow_theme.dart';

class EntryNamer extends StatefulWidget {
  EntryNamer({super.key, required this.setEntryName});
  final void Function(dynamic) setEntryName;
  String? emotionName;

  @override
  _EntryNamerState createState() => _EntryNamerState();

  String? getEmotionName() {
    return this.emotionName;
  }
}

class _EntryNamerState extends State<EntryNamer> {
  Image checkMarkBlack = Image.asset('assets/images/checkmark_off_black.png',
      width: 100, height: 100, fit: BoxFit.cover);

  _EntryNamerState();

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
                                  widget.setEntryName(widget.emotionName);
                                  Navigator.pop(context);
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
