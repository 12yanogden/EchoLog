import 'package:echolog/components/hamburger_menu.dart';
import 'package:echolog/components/top_bar.dart';
import 'package:echolog/emotions/components/color_square.dart';
import 'package:echolog/emotions/components/emotion_list_item.dart';
import 'package:echolog/emotions/models/emotion.dart';
import 'package:echolog/emotions/services/emotion_service.dart';
import 'package:echolog/style/custom_text.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final EmotionService emotionService = EmotionService();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const HamburgerMenu(currentPageName: 'Settings'),
        body: SafeArea(
            child: Column(children: [
          const TopBar(),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Container(width: 32, height: 32, color: Colors.red))
          // Padding(
          //     padding: const EdgeInsets.symmetric(horizontal: 32),
          //     child: Column(children: [
          //       Text(
          //           (int emotionsCount, int emotionsMaxCount) {
          //             return "Your Emotions ($emotionsCount/$emotionsMaxCount)";
          //           }(emotionService.getActiveEmotionCount(),
          //               emotionService.getActiveEmotionLimit()),
          //           style: large),
          //       Expanded(
          //           child: ListView.builder(
          //               itemCount: emotionService.getActiveEmotionCount(),
          //               itemBuilder: (BuildContext context, int index) {
          //                 return Expanded(
          //                     child: Row(
          //                   children: [
          //                     Text(
          //                         emotionService
          //                             .getActiveEmotions()[index]
          //                             .getEmoji(),
          //                         textAlign: TextAlign.center,
          //                         style: emoji),
          //                     ColorSquare(
          //                         color: emotionService
          //                             .getActiveEmotions()[index]
          //                             .getColor()),
          //                     Text(
          //                         emotionService
          //                             .getActiveEmotions()[index]
          //                             .getName(),
          //                         style: medium)
          //                   ],
          //                 ));
          //               }))
          //     ]))
        ])));
  }
}
