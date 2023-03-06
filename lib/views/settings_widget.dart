import '../components/color_picker.dart';
import '../components/edit_emotion_list_item_widget.dart';
import '../components/emoji_picker_widget.dart';
import '../components/emotion_namer.dart';
import '../components/hamburger_menu_widget.dart';
import '../components/popup.dart';
import '../components/top_bar_widget.dart';
import '../backend/emotion_service.dart';
import '../models/emotion.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsWidget extends StatefulWidget {
  const SettingsWidget({Key? key}) : super(key: key);

  @override
  _SettingsWidgetState createState() => _SettingsWidgetState();
}

class _SettingsWidgetState extends State<SettingsWidget> {
  final EmotionService emotService = EmotionService();
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  String? emoji;
  Color? color;
  String? emotionName;

  @override
  void dispose() {
    _unfocusNode.dispose();
    super.dispose();
  }

  refresh() {
    setState(() {});
  }

  setEmoji(inputEmoji) {
    setState(() {
      this.emoji = inputEmoji;
    });
  }

  setColor(inputColor) {
    setState(() {
      this.color = inputColor;
    });
  }

  setEmotionName(inputEmotionName) {
    setState(() {
      this.emotionName = inputEmotionName;
    });
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    showEmojiPicker() {
      // Navigator.of(context).push(MaterialPageRoute(
      //   fullscreenDialog: true,
      //   builder: (context) => EmojiPickerWidget(setEmoji: setEmoji),
      // ));
      Future.delayed(const Duration(microseconds: 10), () {
        Popup(widget: EmojiPickerWidget(setEmoji: setEmoji)).show(context);
      });
      return Container();
    }

    showColorPicker() {
      Future.delayed(const Duration(microseconds: 10), () {
        Popup(widget: ColorPicker(emoji: this.emoji!, setColor: setColor))
            .show(context);
      });
      return Container();
    }

    showEmotionNamer() {
      Future.delayed(const Duration(microseconds: 10), () {
        Popup(
                widget: EmotionNamer(
                    emoji: this.emoji!,
                    color: this.color!,
                    setEmotionName: setEmotionName))
            .show(context);
      });
      return Container();
    }

    uploadEmotion() {
      Future.delayed(const Duration(microseconds: 10), () {
        setState(() {
          emotService.addEmotion(Emotion(this.emoji!, this.color!,
              this.emotionName!, emotService.genNextEmotionId()));
          this.emoji = null;
          this.color = null;
          this.emotionName = null;
        });
      });
      return Container();
    }

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      drawer: Drawer(
        elevation: 16,
        child: HamburgerMenuWidget(),
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              TopBarWidget(),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(22, 0, 0, 0),
                    child: Text(
                      (int emotionsCount, int emotionsMaxCount) {
                        return "Your Emotions (" +
                            emotionsCount.toString() +
                            "/" +
                            emotionsMaxCount.toString() +
                            ")";
                      }(
                          this.emotService.getCurEmotions().length,
                          this
                              .emotService
                              .getCurEmotionLimit()), //(FFAppState().emotions.length, FFAppState().emotionsMaxCount),
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Poppins',
                            fontSize: 18,
                          ),
                    ),
                  ),
                ],
              ),
              Builder(
                builder: (context) {
                  final emotions = emotService
                      .getCurEmotions(); //FFAppState().emotions.toList().take(5).toList();
                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: emotions.length,
                    itemBuilder: (context, emotionsIndex) {
                      final emotionsItem = emotions[emotionsIndex];
                      return EditEmotionListItemWidget(
                        key: Key('EditEmotionListItem_${emotionsIndex}'),
                        emotion: emotionsItem,
                      );
                    },
                  );
                },
              ),
              this.emoji == null &&
                      this.color == null &&
                      this.emotionName == null &&
                      emotService.getCurEmotions().length <
                          emotService.getCurEmotionLimit()
                  ? AddEmotionButton(showEmojiPicker: showEmojiPicker)
                  : Container(),
              this.emoji != null &&
                      this.color == null &&
                      this.emotionName == null
                  ? showColorPicker()
                  : Container(),
              this.emoji != null &&
                      this.color != null &&
                      this.emotionName == null
                  ? showEmotionNamer()
                  : Container(),
              this.emoji != null &&
                      this.color != null &&
                      this.emotionName != null
                  ? uploadEmotion()
                  : Container()
            ],
          ),
        ),
      ),
    );
  }
}

class AddEmotionButton extends StatelessWidget {
  final Function() showEmojiPicker;

  AddEmotionButton({required this.showEmojiPicker});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(22, 22, 22, 0),
      child: InkWell(
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primaryBackground,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: FlutterFlowTheme.of(context).secondaryText,
              ),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 6, 0, 6),
              child: Icon(
                Icons.add,
                color: FlutterFlowTheme.of(context).secondaryText,
                size: 32,
              ),
            ),
          ),
          onTap: () {
            this.showEmojiPicker();
          }),
    );
  }
}
