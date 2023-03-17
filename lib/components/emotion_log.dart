import 'package:echo_log/components/emotion_sliders.dart';
import 'package:flutter/material.dart';
import '../models/emotion.dart';

class EmotionLog extends StatefulWidget {
  EmotionLog(
      {super.key, required this.emotions, required this.setEmotionRatings});
  final List<Emotion> emotions;
  final void Function(dynamic) setEmotionRatings;
  String? emotionName;

  @override
  _EmotionLogState createState() => _EmotionLogState();

  String? getEmotionName() {
    return this.emotionName;
  }
}

class _EmotionLogState extends State<EmotionLog> {
  double mainMargins = 10.0;
  double buttonRadious = 100;

  _EmotionLogState();

  @override
  Widget build(BuildContext context) {
    this.sliders = EmotionSliders(
      emotionValues: _emotionValues,
      emotions: EmotionService().getCurEmotions(),
    );

    return Container(
      margin: EdgeInsetsDirectional.all(mainMargins),
      child: Column(children: [
        Container(
          padding: EdgeInsets.all(10.0),
          child: Text(
            'How did you feel?',
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.black),
            textScaleFactor: 2,
          ),
        ),
        Container(
          margin: EdgeInsets.all(mainMargins),
          child: this.sliders, // The sliders
        ),
        Expanded(
            child: Center(
                child: Container(
                    width: buttonRadious,
                    height: buttonRadious,
                    margin: EdgeInsets.only(top: mainMargins),
                    child: IconButton(
                      icon: checkMarkBlack,
                      onPressed: () {
                        setState(() {
                          showForm = 0;
                        });
                        _CreatNewEntry();
                      },
                    )))),
      ]),
    );
  }
}
