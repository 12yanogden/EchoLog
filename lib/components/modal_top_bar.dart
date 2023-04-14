import 'package:echolog/style/custom_colors.dart';
import 'package:flutter/material.dart';

class ModalTopBar extends StatelessWidget {
  final Function? back;
  final Function? close;

  const ModalTopBar({Key? key, this.back, this.close}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 32),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            back != null
                ? InkWell(
                    onTap: () => back!(),
                    child: const Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: offBlack,
                      size: 24,
                    ),
                  )
                : Container(),
            close != null
                ? InkWell(
                    onTap: () => back!(),
                    child: const Icon(
                      Icons.close_rounded,
                      color: offBlack,
                      size: 32,
                    ),
                  )
                : Container()
          ],
        ));
  }
}
