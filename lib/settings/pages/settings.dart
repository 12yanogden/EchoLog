import 'package:echolog/components/hamburger_menu.dart';
import 'package:echolog/components/top_bar.dart';
import 'package:echolog/emotions/components/emotion_list.dart';
import 'package:echolog/emotions/modals/emotion_emoji_form.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  List<Widget> stack = [];
  int stackIndex = 0;
  String? emoji;

  @override
  void initState() {
    super.initState();

    stack = [
      settingsView(nextView),
      EmotionEmojiForm(
          back: prevView,
          close: initialView,
          isShown: false,
          setEmoji: setEmoji)
    ];
  }

  @override
  void dispose() {
    super.dispose();
  }

  void nextView() {
    setState(() {
      stackIndex == stack.length - 1 ? stackIndex = 0 : stackIndex++;
    });
  }

  void prevView() {
    setState(() {
      stackIndex == 0 ? stackIndex = stack.length - 1 : stackIndex--;
    });
  }

  void initialView() {
    setState(() {
      stackIndex = 0;
    });
  }

  void setEmoji(String emoji) {
    setState(() {
      this.emoji = emoji;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const HamburgerMenu(currentPageName: 'Settings'),
        body:
            SafeArea(child: IndexedStack(index: stackIndex, children: stack)));
  }
}

Widget settingsView(Function nextView) {
  return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    const TopBar(),
    Expanded(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: EmotionList(
              nextView: nextView,
            )))
  ]);
}
