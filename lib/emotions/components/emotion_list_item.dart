import 'package:echolog/emotions/components/color_square.dart';
import 'package:echolog/emotions/models/emotion.dart';
import 'package:echolog/style/custom_colors.dart';
import 'package:echolog/style/custom_text.dart';
import 'package:flutter/material.dart';

class EmotionListItem extends StatefulWidget {
  final Emotion emotion;
  final Function(Emotion) removeEmotion;

  const EmotionListItem(
      {Key? key, required this.emotion, required this.removeEmotion})
      : super(key: key);

  @override
  EmotionListItemState createState() => EmotionListItemState();
}

class EmotionListItemState extends State<EmotionListItem> {
  late final TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();

    _textEditingController = TextEditingController(text: widget.emotion.name);
  }

  @override
  void dispose() {
    _textEditingController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(widget.emotion.getEmoji(),
            textAlign: TextAlign.center, style: emoji),
        Container(width: 16),
        ColorSquare(color: widget.emotion.getColor()),
        const SizedBox(width: 16),
        Expanded(
            child: SizedBox(
                height: 42,
                child: TextField(
                    controller: _textEditingController,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.fromLTRB(18, 0, 0, 0),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: textFieldStroke),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    )))),
        const SizedBox(width: 16),
        InkWell(
            onTap: () => {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text("Delete"),
                        content: Text(
                            "Are you sure you want to delete ${widget.emotion.emoji}?\n\nThis will not remove historical data."),
                        actions: [
                          TextButton(
                            child: const Text("CANCEL"),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          TextButton(
                            child: const Text("DELETE", style: alertText),
                            onPressed: () {
                              widget.removeEmotion(widget.emotion);
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  )
                },
            child: const Icon(Icons.close))
      ],
    );
  }
}
