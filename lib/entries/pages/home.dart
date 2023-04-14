import 'package:echolog/components/hamburger_menu.dart';
import 'package:echolog/emotion_ratings/modals/emotion_rating_form.dart';
import 'package:echolog/emotion_ratings/models/emotion_rating.dart';
import 'package:echolog/entries/modals/entry_name_form.dart';
import 'package:echolog/entries/models/entry.dart';
import 'package:echolog/entries/screens/entry_recording_form.dart';
import 'package:echolog/entries/services/entry_service.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  EntryService entryService = EntryService();
  bool needRecordingPath = false;
  String? recordingPath;
  List<EmotionRating>? emotionRatings;
  String? entryName;
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
      EmotionRatingForm(back: prevView, setEmotionRatings: setEmotionRatings),
      EntryNameForm(back: prevView, setEntryName: setEntryName)
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
  }

  void setEmotionRatings(List<EmotionRating> emotionRatings) {
    setState(() {
      this.emotionRatings = emotionRatings;
    });

    nextView();
  }

  void setEntryName(String entryName) {
    setState(() {
      this.entryName = entryName;
      needRecordingPath = true;
    });

    nextView();
  }

  void reset() {
    print(entryService.getAllEntries());

    recordingPath = null;
    emotionRatings = null;
    entryName = null;
  }

  void nextView() {
    setState(() {
      stackIndex == stack.length - 1 ? stackIndex = 0 : stackIndex++;
    });

    if (recordingPath != null && emotionRatings != null && entryName != null) {
      entryService.addEntry(
          Entry(DateTime.now(), entryName!, recordingPath!, emotionRatings!));
      reset();
    }
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
