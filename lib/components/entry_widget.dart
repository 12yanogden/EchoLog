import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EntryWidget extends StatefulWidget {
  const EntryWidget({
    Key? key,
    this.entry,
  }) : super(key: key);

  final dynamic entry;

  @override
  _EntryWidgetState createState() => _EntryWidgetState();
}

class _EntryWidgetState extends State<EntryWidget> {
  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(
          getJsonField(
            widget.entry,
            r'''$.name''',
          ).toString(),
          style: FlutterFlowTheme.of(context).bodyText1,
        ),
      ],
    );
  }
}
