import 'package:echolog/style/custom_text.dart';
import 'package:flutter/material.dart';

class Timer extends StatefulWidget {
  final Stream<dynamic>? stream;

  const Timer({super.key, required this.stream});

  @override
  _TimerState createState() => _TimerState();
}

class _TimerState extends State<Timer> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<dynamic>(
        stream: widget.stream,
        builder: (context, snapshot) {
          final duration =
              snapshot.hasData ? snapshot.data!.duration : Duration.zero;

          String twoDigits(int n) => n.toString().padLeft(2, '0');
          final twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
          final twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));

          return Text(
            '$twoDigitMinutes:$twoDigitSeconds',
            style: large,
          );
        });
  }
}