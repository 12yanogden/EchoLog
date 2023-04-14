import 'package:echolog/components/hamburger_menu.dart';
import 'package:echolog/emotion_ratings/modals/emotion_rating_form.dart';
import 'package:echolog/emotion_ratings/models/emotion_rating.dart';
import 'package:echolog/entries/screens/entry_recording_form.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool needRecordingPath = false;
  String? recordingPath;
  List<EmotionRating>? emotionRatings;
  List<Widget> stack = [];
  int stackIndex = 0;

  @override
  void initState() {
    super.initState();

    stack = [
      EntryRecordingForm(
          nextView: nextView,
          needRecordingPath: needRecordingPath,
          setRecordingPath: setRecordingPath),
      EmotionRatingForm(back: prevView, setEmotionRatings: setEmotionRatings)
    ];
  }

  @override
  void dispose() {
    super.dispose();
  }

  void setRecordingPath(String recordingPath) {
    setState(() {
      this.recordingPath = recordingPath;
    });

    nextView();
  }

  void setEmotionRatings(List<EmotionRating> emotionRatings) {
    setState(() {
      this.emotionRatings = emotionRatings;
    });

    nextView();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const HamburgerMenu(currentPageName: 'Home'),
        body:
            SafeArea(child: IndexedStack(index: stackIndex, children: stack)));
  }
}
