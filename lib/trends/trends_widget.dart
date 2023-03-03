import 'package:echo_log/backend/entry_service.dart';

import '../components/hamburger_menu_widget.dart';
import '../components/theme_colors.dart';
import '../components/top_bar_widget.dart';
import '../components/entry_graph.dart';

import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_calendar.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'package:fl_chart/fl_chart.dart';
import '../components/date_stamp.dart';
import '../components/play_button.dart';
import '../components/entry_summary_list_view.dart';

class TrendsWidget extends StatefulWidget {
  const TrendsWidget({Key? key}) : super(key: key);

  @override
  _TrendsWidgetState createState() => _TrendsWidgetState();
}

class _TrendsWidgetState extends State<TrendsWidget>
    with TickerProviderStateMixin {

  final animationsMap = {
    'containerOnActionTriggerAnimation': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        VisibilityEffect(duration: 1.ms),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0, 600),
          end: Offset(0, 0),
        ),
      ],
    ),
  };
  DateTimeRange? calendarSelectedDay;
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    calendarSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
  }

  @override
  void dispose() {
    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: ThemeColors.primaryBg, //FlutterFlowTheme.of(context).primaryBackground,
      drawer: Drawer(
        elevation: 16,
        child: HamburgerMenuWidget(),
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  TopBarWidget(),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
                        child: InkWell(
                          onTap: () async {
                            setState(() {
                              FFAppState().showDarkScreen = true;
                            });
                            if (animationsMap[
                                    'containerOnActionTriggerAnimation'] !=
                                null) {
                              await animationsMap[
                                      'containerOnActionTriggerAnimation']!
                                  .controller
                                  .forward(from: 0.0);
                            }
                          },
                          child: Material(
                            color: Colors.transparent,
                            elevation: 100,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                color: ThemeColors.primaryBg, //FlutterFlowTheme.of(context).primaryBackground,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 4,
                                    color: Color(0x33000000),
                                    offset: Offset(0, 2),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12, 12, 12, 12),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 12, 0),
                                      child: Icon(
                                        Icons.calendar_today_outlined,
                                        color: Colors.black,
                                        size: 24,
                                      ),
                                    ),
                                    Text(
                                      'Select Date',
                                      style: TextStyle(color: Colors.black) //FlutterFlowTheme.of(context).bodyText1,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  // Graph Area--------------------------------------------
                    
                    Expanded (child: Center(
                      child: Container(
                        alignment: Alignment.center,
                        height: MediaQuery.of(context).size.height / 1.7,
                        child: EntrySummaryListView(MediaQuery.of(context).size.height / 1.7),
                    )
                  ))
                  //
                ],
              ),

              // I think this is for the calander overlay
              if (valueOrDefault<bool>(
                FFAppState().showDarkScreen,
                false,
              ))
                InkWell(
                  onTap: () async {
                    if (animationsMap['containerOnActionTriggerAnimation'] !=
                        null) {
                      await animationsMap['containerOnActionTriggerAnimation']!
                          .controller
                          .reverse();
                    }
                    setState(() {
                      FFAppState().showDarkScreen = false;
                    });
                  },
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0x33000000),
                    ),
                  ),
                ),
              Align(
                alignment: AlignmentDirectional(0, 1),
                child: Material(
                  color: Colors.transparent,
                  elevation: 16,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(0),
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 4,
                          color: Color(0x33000000),
                          offset: Offset(0, 2),
                        )
                      ],
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(0),
                        bottomRight: Radius.circular(0),
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      ),
                    ),
                    child: FlutterFlowCalendar(
                      color: ThemeColors.primaryBg, // FlutterFlowTheme.of(context).primaryColor,
                      weekFormat: false,
                      weekStartsMonday: false,
                      initialDate: FFAppState().today,
                      onChange: (DateTimeRange? newSelectedDate) {
                        setState(() => calendarSelectedDay = newSelectedDate);
                      },
                      titleStyle: TextStyle(),
                      dayOfWeekStyle: TextStyle(),
                      dateStyle: TextStyle(),
                      selectedDateStyle: TextStyle(),
                      inactiveDateStyle: TextStyle(),
                    ),
                  ),
                ).animateOnActionTrigger(
                  animationsMap['containerOnActionTriggerAnimation']!,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
