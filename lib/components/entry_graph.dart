import 'package:echo_log/models/emotion_rating.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../backend/emotion_service.dart';
import '../models/emotion.dart';

class EntryGraph extends StatefulWidget {
  List<EmotionRating> ratings;
  EntryGraph(this.ratings, {super.key});
  @override
  State<StatefulWidget> createState() => EntryGraphState();
}

class EntryGraphState extends State<EntryGraph> {
  final double width = 80;

  late List<BarChartGroupData> rawBarGroups;
  late List<BarChartGroupData> showingBarGroups;

  @override
  void initState() {
    EmotionService emotS = EmotionService();

    List<Color> colors = [];
    List<int> values = [];
    widget.ratings.forEach((rating) {
      Emotion emotion = emotS.getEmotionByID(rating.emotionId);
      values.add(rating.rating);
      colors.add(emotion.color);
    });

    super.initState();
    final barGroup1 = makeGroupData(0, values, colors);

    final items = [
      barGroup1,
    ];

    rawBarGroups = items;

    showingBarGroups = rawBarGroups;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width*1.7,
        //height: MediaQuery.of(context).size.height / 3.5,
        child: AspectRatio(
          aspectRatio: 1/3,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: BarChart(
                    BarChartData(
                      maxY: 5.1,
                      minY: -0.1,
                      titlesData: FlTitlesData(
                        show: false,
                      ),
                      borderData: FlBorderData(
                        show: false,
                      ),
                      barGroups: showingBarGroups,
                      gridData: FlGridData(
                        show: true,
                        horizontalInterval: 1,
                        getDrawingHorizontalLine: (value) =>
                            FlLine(color: Colors.grey, strokeWidth: 1),
                        drawVerticalLine: false,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
              ],
            ),
          ),
        ));
  }

  BarChartGroupData makeGroupData(
      int x, List<int> emot_values, List<Color> emot_colors) {
    return BarChartGroupData(
      barsSpace: 0,
      x: x,
      barRods: [
        for (int i = 0; i < emot_values.length; i++)
          BarChartRodData(
            toY: emot_values[i].toDouble(),
            color: emot_colors[i],
            width: width / emot_values.length,
            borderRadius: BorderRadius.all(Radius.circular(0)),
          ),
      ],
    );
  }
}
