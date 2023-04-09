import 'package:echolog/components/hamburger_menu_item.dart';
import 'package:echolog/emotion_ratings/pages/trends.dart';
import 'package:echolog/emotions/pages/settings.dart';
import 'package:echolog/entries/pages/home.dart';
import 'package:echolog/style/custom_colors.dart';
import 'package:flutter/material.dart';

class HamburgerMenu extends StatefulWidget {
  final String currentPageName;

  const HamburgerMenu({Key? key, required this.currentPageName})
      : super(key: key);

  @override
  _HamburgerMenuState createState() => _HamburgerMenuState();
}

class _HamburgerMenuState extends State<HamburgerMenu> {
  List<IconData> icons = [
    Icons.mic,
    Icons.bar_chart_rounded,
    Icons.settings_rounded
  ];
  List<String> pageNames = ['Home', 'Trends', 'Settings'];
  List<StatefulWidget> pages = [
    const Home(),
    const Trends(),
    const Settings(),
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: offWhite,
        elevation: 16,
        child: ListView.builder(
            itemCount: pageNames.length,
            itemBuilder: (BuildContext context, int index) {
              return HamburgerMenuItem(
                  icon: icons[index],
                  name: pageNames[index],
                  page: pages[index],
                  isCurrent: widget.currentPageName == pageNames[index]);
            }));
  }
}
