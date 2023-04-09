import 'package:echolog/entries/components/timer.dart';
import 'package:echolog/style/custom_colors.dart';
import 'package:echolog/style/custom_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sound/public/flutter_sound_recorder.dart';
import 'package:permission_handler/permission_handler.dart';

enum MicState { off, ready, recording, paused }

class AudioRecorder extends StatefulWidget {
  final void Function(bool) setIsRecording;
  final void Function(String) setRecordingPath;

  AudioRecorder(
      {super.key,
      required this.setIsRecording,
      required this.setRecordingPath});

  @override
  _AudioRecorderState createState() => _AudioRecorderState();
}

class _AudioRecorderState extends State<AudioRecorder> {
  final _recorder = FlutterSoundRecorder();
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

    _micState = MicState.ready;

    _recorder.setSubscriptionDuration(
      const Duration(milliseconds: 500),
    );
  }

  Future record() async {
    if (_micState == MicState.ready || _micState == MicState.paused) {
      await _recorder.startRecorder(toFile: "audio");

      widget.setIsRecording(true);

      setState(() {
        _micState = MicState.recording;
      });
    }
  }

  Future pause() async {
    if (_micState == MicState.recording) {
      await _recorder.pauseRecorder();

      widget.setIsRecording(false);

      setState(() {
        _micState = MicState.paused;
      });
    }
  }

  Future resume() async {
    if (_micState == MicState.paused) {
      await _recorder.resumeRecorder();

      widget.setIsRecording(true);

      setState(() {
        _micState = MicState.recording;
      });
    }
  }

  Future stop() async {
    if (_micState == MicState.recording || _micState == MicState.paused) {
      String? recordingPath = await _recorder.stopRecorder();

      widget.setIsRecording(false);

      if (recordingPath != null) {
        widget.setRecordingPath(recordingPath);
      }

      setState(() {
        _micState = MicState.ready;
      });
    }
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      InkWell(
          onTap: () async {
            if (_recorder.isRecording) {
              await stop();
            } else {
              await record();
            }
          },
          child: _micState == MicState.recording || _micState == MicState.paused
              ? Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                      _micState == MicState.recording
                          ? InkWell(
                              onTap: () async {
                                await pause();
                              },
                              child: const Icon(Icons.pause_outlined,
                                  color: offBlack, size: 64.0))
                          : InkWell(
                              onTap: () async {
                                await resume();
                              },
                              child: const Icon(Icons.mic_outlined,
                                  color: offBlack, size: 64.0)),
                      InkWell(
                          onTap: () async {
                            await stop();
                          },
                          child: const Icon(Icons.stop_outlined,
                              color: offBlack, size: 64.0))
                    ])
              : const Icon(CustomIcons.big_mic, color: offBlack, size: 96.0)),
      const SizedBox(height: 16),
      Timer(stream: _recorder.onProgress)
    ]);
  }
}
