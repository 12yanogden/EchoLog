import 'package:echolog/components/hamburger_menu.dart';
import 'package:echolog/emotion_ratings/modals/emotion_rating_form.dart';
import 'package:echolog/emotion_ratings/models/emotion_rating.dart';
import 'package:echolog/emotion_ratings/services/emotion_rating_service.dart';
import 'package:echolog/emotions/models/emotion.dart';
import 'package:echolog/emotions/services/emotion_service.dart';
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
  EmotionService emotionService = EmotionService();
  EntryService entryService = EntryService();
  bool needRecordingPath = false;
  String? recordingPath;
  List<EmotionRating> emotionRatings = [];
  String? entryName;
  List<Widget> stack = [];
  int stackIndex = 0;

  @override
  void initState() {
    super.initState();

    initStack();
    resetEmotionRatings();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void initStack() {
    stack = [
      EntryRecordingForm(
          nextView: nextView,
          needRecordingPath: needRecordingPath,
          setRecordingPath: setRecordingPath),
      EmotionRatingForm(back: prevView, setEmotionRatings: setEmotionRatings),
      EntryNameForm(back: prevView, setEntryName: setEntryName)
    ];
  }

  List<Widget> buildStack() {
    return [
      EntryRecordingForm(
          nextView: nextView,
          needRecordingPath: needRecordingPath,
          setRecordingPath: setRecordingPath),
      EmotionRatingForm(back: prevView, setEmotionRatings: setEmotionRatings),
      EntryNameForm(back: prevView, setEntryName: setEntryName)
    ];
  }

  void resetEmotionRatings() {
    List<Emotion> emotions = emotionService.getActiveEmotions();

    setState(() {
      emotionRatings = [];
    });

    for (Emotion emotion in emotions) {
      setState(() {
        emotionRatings.add(EmotionRating(emotion, 0));
      });
    }
  }

  void setRecordingPath(String recordingPath) {
    setState(() {
      this.recordingPath = recordingPath;
      needRecordingPath = false;
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

  void resetUponFormSubmission() {
    if (recordingPath != null && entryName != null) {
      entryService.addEntry(
          Entry(DateTime.now(), entryName!, recordingPath!, emotionRatings));

      recordingPath = null;
      resetEmotionRatings();
      entryName = null;
      print("");
      print("");
      print("");
      print("");
      print("");
      print("");
      print("");
      print("");
      print(entryService.entries[0].recordingPath);
    }
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
    resetUponFormSubmission();
    return Scaffold(
        drawer: const HamburgerMenu(currentPageName: 'Home'),
        body: SafeArea(
            child: IndexedStack(index: stackIndex, children: buildStack())));
  }
}
