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

  int formIndex = 0;

  dynamic emojiPicker = Container();
  dynamic colorPicker = Container();
  dynamic emotionNamer = Container();

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

  reset() {
    setState(() {
      this.emojiPicker = Container();
      this.colorPicker = Container();
      this.emotionNamer = Container();
      this.emoji = null;
      this.color = null;
      this.emotionName = null;
      this.formIndex = 0;
    });
  }

  setEmoji(inputEmoji) {
    if (inputEmoji != null) {
      setState(() {
        this.emoji = inputEmoji;
        this.colorPicker = ColorPicker(emoji: this.emoji!, setColor: setColor);
        this.formIndex = 2;
      });
    } else {
      reset();
    }
  }

  setColor(inputColor) {
    if (inputColor != null) {
      setState(() {
        this.color = inputColor;
        this.emotionNamer = EmotionNamer(
            emoji: this.emoji!,
            color: this.color!,
            setEmotionName: setEmotionName);
        this.formIndex = 3;
      });
    } else {
      reset();
    }
  }

  setEmotionName(inputEmotionName) {
    if (inputEmotionName != null) {
      this.emotionName = inputEmotionName;
      this.formIndex = 0;
      uploadEmotion(); // this calls setState
    } else {
      reset();
    }
  }

  showEmojiPicker() {
    // Future.delayed(const Duration(microseconds: 10), () {
    //   Popup(widget: EmojiPickerWidget(setEmoji: setEmoji)).show(context);
    // });
    // return Container();
    setState(() {
      this.emojiPicker = EmojiPickerWidget(setEmoji: setEmoji);
      this.formIndex = 1;
    });
  }

  uploadEmotion() {
    setState(() {
      emotService.addEmotion(Emotion(this.emoji!, this.color!,
          this.emotionName!, emotService.genNextEmotionId()));
    });
    reset();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

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
            child: IndexedStack(
              index: this.formIndex,
              children: [
                _MainEmotionsList(),
                this.emojiPicker,
                this.colorPicker,
                this.emotionNamer,
              ],
            )),
      ),
    );
  }

  Column _MainEmotionsList() {
    return Column(
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
                }(this.emotService.getCurEmotions().length,
                    this.emotService.getCurEmotionLimit()),
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
        emotService.getCurEmotions().length < emotService.getCurEmotionLimit()
            ? AddEmotionButton(showEmojiPicker: showEmojiPicker)
            : Container(),
        // this.emoji != null && this.color == null && this.emotionName == null
        //     ? showColorPicker()
        //     : Container(),
        // this.emoji != null && this.color != null && this.emotionName == null
        //     ? showEmotionNamer()
        //     : Container(),
        // this.emoji != null && this.color != null && this.emotionName != null
        //     ? uploadEmotion()
        //     : Container()
      ],
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
