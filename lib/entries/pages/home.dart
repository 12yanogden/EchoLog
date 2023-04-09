import 'package:echolog/components/hamburger_menu.dart';
import 'package:echolog/components/top_bar.dart';
import 'package:echolog/entries/components/animated_ellipses.dart';
import 'package:echolog/entries/components/audio_recorder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final soundPlayer = FlutterSoundPlayer();
  String? recordingPath;
  bool isRecording = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void setIsRecording(bool isRecording) {
    setState(() {
      this.isRecording = isRecording;
    });
  }

  void setRecordingPath(String recordingPath) {
    setState(() {
      this.recordingPath = recordingPath;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const HamburgerMenu(currentPageName: 'Home'),
        body: SafeArea(
            child: Stack(alignment: Alignment.topCenter, children: [
          const TopBar(),
          Stack(
            alignment: Alignment.center,
            children: <Widget>[
              AnimatedEllipses(isAnimating: isRecording),
              AudioRecorder(
                  setIsRecording: setIsRecording,
                  setRecordingPath: setRecordingPath),
            ],
          )
        ])));
  }
}
