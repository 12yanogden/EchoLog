import 'package:echolog/style/custom_colors.dart';
import 'package:echolog/style/custom_text.dart';
import 'package:flutter/material.dart';

class HamburgerMenuItem extends StatelessWidget {
  final IconData? icon;
  final String name;
  final StatefulWidget page;
  final bool isCurrent;

  // Pass in a Color object (eg. Color(0xFF0000FF))
  const HamburgerMenuItem(
      {Key? key,
      required this.icon,
      required this.name,
      required this.page,
      required this.isCurrent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          if (isCurrent) {
            Navigator.pop(context);
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => page),
            );
          }
        },
        child: Container(
            color: isCurrent ? quaternaryColor : Colors.transparent,
            child: Padding(
                padding: const EdgeInsets.all(32),
                child: Row(
                  children: [
                    Icon(icon, color: offBlack, size: 32),
                    const SizedBox(width: 32),
                    Text(name, style: medium)
                  ],
                ))));
  }
}
