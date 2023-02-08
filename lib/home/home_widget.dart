import '../components/hamburger_menu_widget.dart';
import '../components/top_bar_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_timer.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  int timerMilliseconds = 0;
  String timerValue = StopWatchTimer.getDisplayTime(0, milliSecond: false);
  StopWatchTimer timerController = StopWatchTimer(mode: StopWatchMode.countUp);

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

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      drawer: Drawer(
        elevation: 16,
        child: HamburgerMenuWidget(),
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Column(
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
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
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
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
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
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
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
                                      timerController.onExecute
                                          .add(StopWatchExecute.stop);
                                      FFAppState().micState = 'NOT_RECORDING';
                                      timerController.onExecute
                                          .add(StopWatchExecute.reset);
                                    },
                                    child: Container(
                                      width: 36,
                                      height: 36,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: Image.asset(
                                        'assets/images/stop.png',
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                1,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
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
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor,
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
          ),
        ),
      ),
    );
  }
}
