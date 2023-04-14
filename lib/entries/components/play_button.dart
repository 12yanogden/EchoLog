import 'package:flutter_sound/flutter_sound.dart';
import 'package:flutter/material.dart';

class PlayButton extends StatefulWidget {
  final String recordingPath;

  const PlayButton({Key? key, required this.recordingPath}) : super(key: key);

  @override
  State<PlayButton> createState() => _PlayButtonState();
}

class _PlayButtonState extends State<PlayButton> {
  final player = FlutterSoundPlayer();

  _PlayButtonState();

  @override
  void initState() {
    super.initState();

    initPlayer();
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
          fromURI: widget.recordingPath,
          codec: Codec.aacMP4,
          whenFinished: () async {
            await player.stopPlayer();
          });
    } catch (e) {
      print("Could not play recording!");
      print("recordingPath: ${widget.recordingPath}");
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await _playRecording();
      },
      child: const Icon(Icons.play_arrow, size: 80),
    );
  }
}
