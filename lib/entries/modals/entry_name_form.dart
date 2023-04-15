import 'package:echolog/components/checkmark_button.dart';
import 'package:echolog/components/modal_top_bar.dart';
import 'package:echolog/style/custom_colors.dart';
import 'package:echolog/style/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EntryNameForm extends StatefulWidget {
  final Function back;
  final Function setEntryName;

  const EntryNameForm(
      {super.key, required this.back, required this.setEntryName});

  @override
  EntryNameFormState createState() => EntryNameFormState();
}

class EntryNameFormState extends State<EntryNameForm> {
  late final TextEditingController _textEditingController;
  final String dateTime =
      DateFormat('M-d-y-h-m-a').format(DateTime.now()).toString();

  @override
  void initState() {
    super.initState();

    _textEditingController = TextEditingController(text: dateTime);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 64),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          ModalTopBar(back: widget.back),
          Text("Name for the entry?", style: xl),
          const SizedBox(
            height: 32,
          ),
          TextField(
              controller: _textEditingController,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.fromLTRB(18, 0, 0, 0),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: textFieldStroke),
                  borderRadius: BorderRadius.circular(10),
                ),
              )),
          const SizedBox(
            height: 32,
          ),
          InkWell(
              onTap: () =>
                  widget.setEntryName(_textEditingController.value.text),
              child: const CheckmarkButton())
        ]));
  }
}
