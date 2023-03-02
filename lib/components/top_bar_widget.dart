import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TopBarWidget extends StatefulWidget {
  const TopBarWidget({Key? key}) : super(key: key);

  @override
  _TopBarWidgetState createState() => _TopBarWidgetState();
}

class _TopBarWidgetState extends State<TopBarWidget> {
  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () async {
            Scaffold.of(context).openDrawer();
          },
          child: Container(
            width: 68,
            height: 68,
            decoration: BoxDecoration(),
            child: Icon(
              Icons.menu,
              color: Colors.black,
              size: 24,
            ),
          ),
        ),
        Container(
          width: 68,
          height: 68,
          decoration: BoxDecoration(),
          child: Icon(
            Icons.search_rounded,
            color: Colors.black,
            size: 24,
          ),
        ),
      ],
    );
  }
}
