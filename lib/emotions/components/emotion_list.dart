import 'package:echolog/emotions/components/emotion_list_item.dart';
import 'package:echolog/emotions/models/emotion.dart';
import 'package:echolog/emotions/services/emotion_service.dart';
import 'package:echolog/style/custom_colors.dart';
import 'package:echolog/style/custom_text.dart';
import 'package:flutter/material.dart';

class EmotionList extends StatefulWidget {
  final Function nextView;

  const EmotionList({Key? key, required this.nextView}) : super(key: key);

  @override
  EmotionListState createState() => EmotionListState();
}

class EmotionListState extends State<EmotionList> {
  EmotionService emotionService = EmotionService();
  List<Emotion> emotions = [];

  @override
  void initState() {
    super.initState();

    emotions = emotionService.getActiveEmotions();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void removeEmotion(Emotion emotion) {
    setState(() {
      emotionService.deactivateEmotion(emotion);
      emotions = emotionService.getActiveEmotions();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
          (int emotionsCount, int emotionsMaxCount) {
            return "Your Emotions ($emotionsCount/$emotionsMaxCount)";
          }(emotions.length, emotionService.getActiveEmotionLimit()),
          style: large),
      const SizedBox(
        height: 18,
      ),
      Builder(builder: (context) {
        return Flexible(
            child: ListView.separated(
                shrinkWrap: true,
                itemCount: emotions.length,
                itemBuilder: (BuildContext context, int index) {
                  return EmotionListItem(
                      emotion: emotions[index], removeEmotion: removeEmotion);
                },
                separatorBuilder: (context, index) => const SizedBox(
                      height: 18,
                    )));
      }),
      emotions.length < emotionService.getActiveEmotionLimit()
          ? Column(children: [
              const SizedBox(
                height: 18,
              ),
              InkWell(
                  onTap: () => widget.nextView(),
                  child: Stack(alignment: Alignment.center, children: [
                    Container(
                        height: 42,
                        decoration: BoxDecoration(
                            color: lightGrey,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: darkGrey, width: 1))),
                    const Icon(Icons.add_rounded, color: darkGrey, size: 32)
                  ]))
            ])
          : Container()
    ]);
  }
}
