import 'package:echo_log/backend/entry_service.dart';
import 'package:echo_log/components/play_button.dart';
import 'package:flutter/material.dart';

import '../models/entry.dart';
import 'date_stamp.dart';
import 'entry_graph.dart';

class EntrySummaryListView extends StatelessWidget {
  final ScrollController _controller = ScrollController();
  final double totalHeight;
  final double buttonSize = 50;
  final double dateStampSize = 100;
  final double dateStampPadding = 5;
  late final double graphHeight;
  final double wrapPadding = 20;
  final double itemWidth = 140;

  EntrySummaryListView(this.totalHeight) {
    this.graphHeight = this.totalHeight -
        2 * wrapPadding -
        2 * dateStampPadding -
        dateStampSize -
        buttonSize;
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () {
      _controller.jumpTo(_controller.position.maxScrollExtent);
    });
    List<Entry> entries = EntryService().entries;

    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: entries.length,
      controller: this._controller,
      itemBuilder: (BuildContext context, int i) {
        return Container(
            width: this.itemWidth,
            height: this.totalHeight,
            padding: EdgeInsets.all(this.wrapPadding),
            decoration: BoxDecoration(
              border: Border(
                  left: BorderSide(
                color: Colors.grey,
              )),
            ),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.all(this.dateStampPadding),
                    height: this.dateStampSize, // standard height
                    child: DateStamp(date: EntryService().entries[i].date),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        top: (this.graphHeight * 0.05),
                        bottom: (this.graphHeight * 0.05)),
                    height: this.graphHeight,
                    child: EntryGraph(EntryService().entries[i].ratings),
                  ),
                  Container(
                    width: this.buttonSize,
                    height: this.buttonSize,
                    child: PlayButton(
                        recordingPath: EntryService().entries[i].recordingPath),
                  ),
                ]));
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }
}
