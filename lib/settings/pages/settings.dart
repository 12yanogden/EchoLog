import 'package:echolog/components/hamburger_menu.dart';
import 'package:echolog/components/top_bar.dart';
import 'package:echolog/emotions/components/emotion_list.dart';
import 'package:echolog/emotions/services/emotion_service.dart';
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
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const TopBar(),
          Expanded(
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: EmotionList(
                      emotions: emotionService.getActiveEmotions(),
                      emotionsLimit: emotionService.getActiveEmotionLimit())))
        ])));
  }
}
