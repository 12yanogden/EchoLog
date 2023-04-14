import 'package:echolog/components/top_bar.dart';
import 'package:echolog/entries/components/animated_ellipses.dart';
import 'package:echolog/entries/components/audio_recorder.dart';
import 'package:flutter/material.dart';

class EntryRecordingForm extends StatefulWidget {
  final void Function() nextView;
  final bool needRecordingPath;
  final void Function(String) setRecordingPath;

  const EntryRecordingForm(
      {super.key,
      required this.nextView,
      required this.needRecordingPath,
      required this.setRecordingPath});

  @override
  State<EntryRecordingForm> createState() => _EntryRecordingFormState();
}

class _EntryRecordingFormState extends State<EntryRecordingForm> {
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

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.topCenter, children: [
      const TopBar(),
      Stack(
        alignment: Alignment.center,
        children: <Widget>[
          AnimatedEllipses(isAnimating: isRecording),
          AudioRecorder(
              setIsRecording: setIsRecording,
              nextView: widget.nextView,
              needRecordingPath: widget.needRecordingPath,
              setRecordingPath: widget.setRecordingPath),
        ],
      )
    ]);
  }
}
