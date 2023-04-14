import 'package:echolog/style/custom_colors.dart';
import 'package:flutter/material.dart';

class CheckmarkButton extends StatelessWidget {
  final double size = 48;

  const CheckmarkButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Icon(Icons.check_rounded, color: offBlack, size: size * (2 / 3)),
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: offBlack, width: 3),
          ),
        )
      ],
    );
  }
}
