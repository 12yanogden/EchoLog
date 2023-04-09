import 'package:echolog/emotions/components/color_square.dart';
import 'package:echolog/emotions/models/emotion.dart';
import 'package:echolog/style/custom_text.dart';
import 'package:flutter/material.dart';

class EmotionListItem extends StatelessWidget {
  final Emotion emotion;

  EmotionListItem({Key? key, required this.emotion}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Row(
      children: [
        Text(emotion.getEmoji(), textAlign: TextAlign.center, style: emoji),
        ColorSquare(color: emotion.getColor()),
        Text(emotion.getName(), style: medium)
      ],
    ));
  }
}
