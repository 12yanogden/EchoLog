import 'package:echolog/components/checkmark_button.dart';
import 'package:echolog/components/modal_top_bar.dart';
import 'package:echolog/emotions/components/emoji_keyboard.dart';
import 'package:echolog/style/custom_text.dart';
import 'package:flutter/material.dart';

class EmotionEmojiForm extends StatefulWidget {
  final Function back;
  final Function close;
  final bool isShown;
  final Function setEmoji;

  const EmotionEmojiForm(
      {super.key,
      required this.back,
      required this.close,
      required this.isShown,
      required this.setEmoji});

  @override
  EmotionEmojiFormState createState() => EmotionEmojiFormState();
}

class EmotionEmojiFormState extends State<EmotionEmojiForm> {
  String emoji = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void setEmoji(String emoji) {
    setState(() {
      this.emoji = emoji;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Padding(
          padding: const EdgeInsets.symmetric(horizontal: 64),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            ModalTopBar(back: widget.back, close: widget.close),
            Text("Which emoji matches you?", style: xl),
            const SizedBox(
              height: 32,
            ),
            Text(emoji, style: xxl),
            const SizedBox(
              height: 32,
            ),
            emoji != ''
                ? InkWell(
                    onTap: () => widget.setEmoji(emoji),
                    child: const CheckmarkButton())
                : Container()
          ])),
      EmojiKeyboard(isShown: widget.isShown, setEmoji: setEmoji)
    ]);
  }
}
