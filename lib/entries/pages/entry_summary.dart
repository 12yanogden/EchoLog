import 'package:echolog/components/hamburger_menu.dart';
import 'package:echolog/components/top_bar.dart';
import 'package:flutter/material.dart';

class EntrySummary extends StatefulWidget {
  const EntrySummary({super.key});

  @override
  State<EntrySummary> createState() => _EntrySummaryState();
}

class _EntrySummaryState extends State<EntrySummary> {
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
        drawer: const HamburgerMenu(currentPageName: 'EntrySummary'),
        body: SafeArea(child: Column(children: [const TopBar(), Container()])));
  }
}
