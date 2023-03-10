import 'package:echo_log/components/theme_colors.dart';

import '../components/hamburger_menu_widget.dart';
import '../components/top_bar_widget.dart';
import '../components/emot_sliders.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_timer.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:ui' as ui;

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  Color bgColor = ThemeColors.primaryBg;

  Image checkMarkBlack = Image.asset('assets/images/checkmark_off_black.png',
      width: 100, height: 100, fit: BoxFit.cover);

  int timerMilliseconds = 0;
  String timerValue = StopWatchTimer.getDisplayTime(0, milliSecond: false);
  StopWatchTimer timerController = StopWatchTimer(mode: StopWatchMode.countUp);
  late EmotSliders sliders;
  int showForm = 0;
  List<double> _emotionValues = List.filled(5, 0.0);
  //---------Start Temp Values (replace with info from settings page)
  List<String> emojis = ["💕", "🖖", "👼", "🚣‍♀️", "🐛"];
  List<String> emojiNames = List.filled(5, "emotName");
  List<Color> emojiColors = [
    Colors.red,
    Colors.purple,
    Colors.brown,
    Colors.blue,
    Colors.green
  ];
  //---------End Temp Values

  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _unfocusNode.dispose();
    timerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();
    this.sliders = EmotSliders(
      emotionValues: _emotionValues,
      emojis: emojis,
      emojiNames: emojiNames,
      emojiColors: emojiColors,
    );

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: bgColor,
      drawer: Drawer(
        elevation: 16,
        child: HamburgerMenuWidget(),
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: IndexedStack(
            index: showForm,
            children: <Widget>[
              _MainRecordColumn(),
              _EmotionLog(),
            ],
          ),
        ),
      ),
    );
  }

  Column _MainRecordColumn() {
    return Column(
      // Main record screan
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        TopBarWidget(),
        Expanded(
          child: Align(
            alignment: AlignmentDirectional(0, -0.1),
            child: Stack(
              alignment: AlignmentDirectional(0, 0),
              children: [
                Image.asset(
                  'assets/images/orange_circles.webp',
                  width: 320,
                  fit: BoxFit.cover,
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (FFAppState().micState == 'NOT_RECORDING')
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                        child: InkWell(
                          onTap: () async {
                            timerController.onExecute
                                .add(StopWatchExecute.start);
                            FFAppState().micState = 'RECORDING';
                          },
                          child: Image.asset(
                            'assets/images/big_mic.png',
                            width: 96,
                            height: 96,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    if (((String micState) {
                          return micState == "RECORDING";
                        }(FFAppState().micState)) ||
                        ((String micState) {
                          return micState == "PAUSED";
                        }(FFAppState().micState)))
                      Container(
                        height: 96,
                        decoration: BoxDecoration(),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (FFAppState().micState == 'PAUSED')
                              InkWell(
                                onTap: () async {
                                  timerController.onExecute
                                      .add(StopWatchExecute.start);
                                  FFAppState().micState = 'RECORDING';
                                },
                                child: Container(
                                  width: 36,
                                  height: 36,
                                  decoration: BoxDecoration(
                                    color: bgColor //FlutterFlowTheme.of(context).secondaryBackground,
                                  ),
                                  child: Image.asset(
                                    'assets/images/big_mic.png',
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            if (FFAppState().micState == 'RECORDING')
                              InkWell(
                                onTap: () async {
                                  timerController.onExecute
                                      .add(StopWatchExecute.stop);
                                  FFAppState().micState = 'PAUSED';
                                },
                                child: Container(
                                  width: 36,
                                  height: 36,
                                  decoration: BoxDecoration(
                                    color: bgColor //FlutterFlowTheme.of(context).secondaryBackground,
                                  ),
                                  child: Image.asset(
                                    'assets/images/pause.png',
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            Container(
                              width: 24,
                              decoration: BoxDecoration(),
                            ),
                            InkWell(
                              onTap: () async {
                                // stop timer
                                timerController.onExecute
                                    .add(StopWatchExecute.stop);
                                FFAppState().micState = 'NOT_RECORDING';
                                timerController.onExecute
                                    .add(StopWatchExecute.reset);

                                // Change to emotion log form
                                showForm = 1;
                                // set slider values to 0 incase the user makes more then one entry in a row
                                for (int i = 0;
                                    i < _emotionValues.length;
                                    i++) {
                                  _emotionValues[i] = 0;
                                }
                              },
                              child: Container(
                                width: 36,
                                height: 36,
                                decoration: BoxDecoration(
                                  color: bgColor, //FlutterFlowTheme.of(context).secondaryBackground,
                                ),
                                child: Image.asset(
                                  'assets/images/stop.png',
                                  width: MediaQuery.of(context).size.width,
                                  height:
                                      MediaQuery.of(context).size.height * 1,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                      child: FlutterFlowTimer(
                        initialTime: timerMilliseconds,
                        getDisplayTime: (value) =>
                            StopWatchTimer.getDisplayTime(value,
                                milliSecond: false),
                        timer: timerController,
                        updateStateInterval: Duration(milliseconds: 1000),
                        onChanged: (value, displayTime, shouldUpdate) {
                          timerMilliseconds = value;
                          timerValue = displayTime;
                          if (shouldUpdate) setState(() {});
                        },
                        textAlign: TextAlign.start,
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Poppins',
                              color: FlutterFlowTheme.of(context).primaryColor,
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Container _EmotionLog() {
    double mainMargins = 10.0;
    double buttonRadious = 100;

    return Container(
      margin: EdgeInsetsDirectional.all(mainMargins),
      child: Column(children: [
        Container(
          padding: EdgeInsets.all(10.0),
          child: Text(
            'How did you feel?',
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.bold),
            textScaleFactor: 2,
          ),
        ),
        Container(
          margin: EdgeInsets.all(mainMargins),
          child: this.sliders, // The sliders
        ),
        Expanded(
            child: Center(
                child: Container(
                    width: buttonRadious,
                    height: buttonRadious,
                    margin: EdgeInsets.only(top: mainMargins),
                    child: IconButton(
                      icon: checkMarkBlack,
                      onPressed: () {
                        setState(() {
                          showForm = 0; // Eventually progress to next page in enrty form
                        });
                      },
                    )))),
      ]),
    );
  }
}
