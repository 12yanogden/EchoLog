import 'dart:async';

import 'package:echolog/entries/components/timer.dart';
import 'package:echolog/style/custom_colors.dart';
import 'package:echolog/style/custom_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sound/public/flutter_sound_recorder.dart';
import 'package:permission_handler/permission_handler.dart';

enum MicState { off, ready, recording, paused }

class AudioRecorder extends StatefulWidget {
  final void Function(bool) setIsRecording;
  final void Function() nextView;
  final bool needRecordingPath;
  final void Function(String) setRecordingPath;

  const AudioRecorder(
      {super.key,
      required this.setIsRecording,
      required this.nextView,
      required this.needRecordingPath,
      required this.setRecordingPath});

  @override
  _AudioRecorderState createState() => _AudioRecorderState();
}

class _AudioRecorderState extends State<AudioRecorder> {
  FlutterSoundRecorder _recorder = FlutterSoundRecorder();
  MicState _micState = MicState.off;

  @override
  void initState() {
    super.initState();

    initRecorder();
  }

  @override
  void dispose() {
    _recorder.closeRecorder();

    super.dispose();
  }

  Future initRecorder() async {
    final status = await Permission.microphone.request();

    if (status != PermissionStatus.granted) {
      throw 'Microphone permission not granted';
    }

    await _recorder.openRecorder();

    setState(() {
      _micState = MicState.ready;
    });

    _recorder.setSubscriptionDuration(
      const Duration(milliseconds: 500),
    );
  }

  Future record() async {
    if (_micState == MicState.ready || _micState == MicState.paused) {
      await _recorder.startRecorder(toFile: "audio");

      setState(() {
        _micState = MicState.recording;
      });

      widget.setIsRecording(true);
    }
  }

  Future pause() async {
    if (_micState == MicState.recording) {
      await _recorder.pauseRecorder();

      setState(() {
        _micState = MicState.paused;
      });

      widget.setIsRecording(false);
    }
  }

  Future resume() async {
    if (_micState == MicState.paused) {
      await _recorder.resumeRecorder();

      setState(() {
        _micState = MicState.recording;
      });

      widget.setIsRecording(true);
    }
  }

  Future stop() async {
    if (_micState == MicState.recording) {
      await _recorder.pauseRecorder();

      setState(() {
        _micState = MicState.paused;
      });
    }

    widget.nextView();
  }

  Future reset() async {
    if (_micState == MicState.recording || _micState == MicState.paused) {
      String? recordingPath = await _recorder.stopRecorder();

      if (recordingPath != null) {
        widget.setRecordingPath(recordingPath);
      }

      setState(() {
        _micState = MicState.ready;
        _recorder = FlutterSoundRecorder();
        initRecorder();
      });
    }
  }

  @override
  void didUpdateWidget(covariant AudioRecorder oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.needRecordingPath) {
      reset();
    }
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      _micState == MicState.recording || _micState == MicState.paused
          ? Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                  _micState == MicState.recording
                      ? InkWell(
                          onTap: () async => await pause(),
                          child: const Icon(Icons.pause_outlined,
                              color: offBlack, size: 64.0))
                      : InkWell(
                          onTap: () async => await resume(),
                          child: const Icon(Icons.mic_outlined,
                              color: offBlack, size: 64.0)),
                  InkWell(
                      onTap: () async => await stop(),
                      child: const Icon(Icons.stop_outlined,
                          color: offBlack, size: 64.0))
                ])
          : InkWell(
              onTap: () async => record(),
              child:
                  const Icon(CustomIcons.big_mic, color: offBlack, size: 96.0)),
      const SizedBox(height: 16),
      Timer(stream: _recorder.onProgress)
    ]);
  }
}
