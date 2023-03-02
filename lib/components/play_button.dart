import 'package:flutter_sound/flutter_sound.dart';
import 'package:flutter/material.dart';

class PlayButton extends StatefulWidget {
  // PlayButton({Key? key}) : super(key: key);
  String recordingPath;

  PlayButton({Key? key, required this.recordingPath}) : super(key: key) {
    this.recordingPath = recordingPath;
  }

  @override
  _PlayButtonState createState() => _PlayButtonState(recordingPath);
}

class _PlayButtonState extends State<PlayButton> {
  String recordingPath;
  final player = FlutterSoundPlayer();

  _PlayButtonState(this.recordingPath);

  @override
  void initState() {
    super.initState();

    this.initPlayer();
  }

  @override
  void dispose() {
    player.closePlayer();
    super.dispose();
  }

  Future<void> initPlayer() async {
    await player.openPlayer();
  }

  _playRecording() async {
    try {
      await player.startPlayer(
          fromURI: this.recordingPath,
          codec: Codec.aacMP4,
          whenFinished: () async {
            await player.stopPlayer();
          });
    } catch (e) {
      print("Terminated by error!");
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await _playRecording();
      },
      child: Image.asset(
        'assets/images/play_button.png',
        width: 32,
        height: 32,
        fit: BoxFit.cover,
      ),
    );
  }
}
