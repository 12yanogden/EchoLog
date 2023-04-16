import 'package:emoji_selector/emoji_selector.dart';
import 'package:flutter/material.dart';

class EmojiKeyboard extends StatefulWidget {
  final bool isShown;
  final Function(String) setEmoji;

  const EmojiKeyboard({Key? key, required this.isShown, required this.setEmoji})
      : super(key: key);

  @override
  EmojiKeyboardState createState() => EmojiKeyboardState();
}

class EmojiKeyboardState extends State<EmojiKeyboard>
    with TickerProviderStateMixin {
  // late final AnimationController _animationController;
  // late final Animation<Offset> _offsetAnimation;
  // late double keyboardHeight;
  // bool isBuilt = false;
  double _height = -360.0;

  @override
  void initState() {
    super.initState();

    // _animationController = AnimationController(
    //   duration: const Duration(seconds: 10),
    //   vsync: this,
    // );

    // _offsetAnimation = Tween<Offset>(
    //   begin: const Offset(0.0, 1.0),
    //   end: Offset.zero,
    // ).animate(
    //     CurvedAnimation(parent: _animationController, curve: Curves.linear));

    if (widget.isShown) {
      Future.delayed(const Duration(milliseconds: 300), () {
        setState(() {
          _height = 0;
        });
      });
    }
  }

  @override
  void dispose() {
    // _animationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
        bottom: _height,
        child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: EmojiSelector(
                padding: const EdgeInsets.all(20),
                onSelected: (emoji) {
                  widget.setEmoji(emoji.char);
                })));
  }
}
