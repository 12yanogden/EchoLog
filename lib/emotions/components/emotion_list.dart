import 'package:echolog/emotions/components/emotion_list_item.dart';
import 'package:echolog/emotions/models/emotion.dart';
import 'package:echolog/style/custom_text.dart';
import 'package:flutter/material.dart';

class EmotionList extends StatefulWidget {
  final List<Emotion> emotions;
  final int emotionsLimit;

  const EmotionList(
      {Key? key, required this.emotions, required this.emotionsLimit})
      : super(key: key);

  @override
  EmotionListState createState() => EmotionListState();
}

class EmotionListState extends State<EmotionList> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
          (int emotionsCount, int emotionsMaxCount) {
            return "Your Emotions ($emotionsCount/$emotionsMaxCount)";
          }(widget.emotions.length, widget.emotionsLimit),
          style: large),
      const SizedBox(
        height: 18,
      ),
      Builder(builder: (context) {
        final emotions = widget.emotions;
        return Expanded(
            child: ListView.separated(
                shrinkWrap: true,
                itemCount: widget.emotions.length,
                itemBuilder: (BuildContext context, int index) {
                  return EmotionListItem(emotion: emotions[index]);
                },
                separatorBuilder: (context, index) => const SizedBox(
                      height: 18,
                    )));
      })
    ]);
  }
}
