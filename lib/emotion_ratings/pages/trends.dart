import 'package:echolog/components/hamburger_menu.dart';
import 'package:echolog/components/top_bar.dart';
import 'package:echolog/entries/pages/entry_summary.dart';
import 'package:echolog/style/custom_colors.dart';
import 'package:flutter/material.dart';

class Trends extends StatefulWidget {
  const Trends({super.key});

  @override
  State<Trends> createState() => _TrendsState();
}

class _TrendsState extends State<Trends> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const HamburgerMenu(currentPageName: 'Trends'),
        body: SafeArea(
            child: Column(children: [
          const TopBar(),
          ElevatedButton(
              onPressed: () async {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const EntrySummary()));
              },
              child: const Text("To EntrySummary"))
        ])));
  }
}
