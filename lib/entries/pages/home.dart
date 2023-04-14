import 'package:echolog/components/hamburger_menu.dart';
import 'package:echolog/emotion_ratings/modals/emotion_rating_form.dart';
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
  int stackIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void setRecordingPath(String recordingPath) {
    setState(() {
      this.recordingPath = recordingPath;
      stackIndex = 1;
    });
  }

  void nextView() {
    setState(() {
      stackIndex++;
    });
  }

  void prevView() {
    setState(() {
      stackIndex--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const HamburgerMenu(currentPageName: 'Home'),
        body: SafeArea(
            child: IndexedStack(index: stackIndex, children: <Widget>[
          EntryRecordingForm(
              nextView: nextView,
              needRecordingPath: needRecordingPath,
              setRecordingPath: setRecordingPath),
          EmotionRatingForm(back: prevView)
        ])));
  }
}
