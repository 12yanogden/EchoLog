import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HamburgerMenuWidget extends StatefulWidget {
  const HamburgerMenuWidget({
    Key? key,
    String? currentPage,
  })  : this.currentPage = currentPage ?? 'Home',
        super(key: key);

  final String currentPage;

  @override
  _HamburgerMenuWidgetState createState() => _HamburgerMenuWidgetState();
}

class _HamburgerMenuWidgetState extends State<HamburgerMenuWidget> {
  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          width: double.infinity,
          height: 12,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
          ),
        ),
        InkWell(
          onTap: () async {
            context.pushNamed('Home');
          },
          child: Container(
            margin: EdgeInsets.only(top: 24.0), // added margin because on android the time overlay make it impossible to click
            decoration: BoxDecoration(),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 12),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                    child: Icon(
                      Icons.home_outlined,
                      color: Colors.black,
                      size: 24,
                    ),
                  ),
                  Text(
                    'Home',
                    style: FlutterFlowTheme.of(context).bodyText1,
                  ),
                ],
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () async {
            context.pushNamed('Trends');
          },
          child: Container(
            decoration: BoxDecoration(),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 12),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                    child: Icon(
                      Icons.bar_chart,
                      color: Colors.black,
                      size: 24,
                    ),
                  ),
                  Text(
                    'Trends',
                    style: FlutterFlowTheme.of(context).bodyText1,
                  ),
                ],
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () async {
            context.pushNamed('Settings');
          },
          child: Container(
            decoration: BoxDecoration(),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 12),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                    child: Icon(
                      Icons.settings,
                      color: Colors.black,
                      size: 24,
                    ),
                  ),
                  Text(
                    'Settings',
                    style: FlutterFlowTheme.of(context).bodyText1,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
