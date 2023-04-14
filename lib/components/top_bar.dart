import 'package:echolog/style/custom_colors.dart';
import 'package:flutter/material.dart';

class TopBar extends StatefulWidget {
  const TopBar({Key? key}) : super(key: key);

  @override
  TopBarState createState() => TopBarState();
}

class TopBarState extends State<TopBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () async {
            Scaffold.of(context).openDrawer();
          },
          child: Container(
            width: 96,
            height: 96,
            decoration: const BoxDecoration(),
            child: const Icon(
              Icons.menu,
              color: offBlack,
              size: 32,
            ),
          ),
        ),
        // Container(
        //   width: 68,
        //   height: 68,
        //   decoration: const BoxDecoration(),
        //   child: const Icon(
        //     Icons.search_rounded,
        //     color: offBlack,
        //     size: 24,
        //   ),
        // ),
      ],
    );
  }
}
