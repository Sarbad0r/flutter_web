import 'package:flutter/material.dart';
import 'package:flutter_web/utils/constants.dart';

class TabletScaffold extends StatefulWidget {
  TabletScaffold({Key? key}) : super(key: key);

  @override
  State<TabletScaffold> createState() => _MobileScaffoldState();
}

class _MobileScaffoldState extends State<TabletScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldColor,
      appBar: myAppBar,
      drawer: myDrawer,
      body: tabletBody,
    );
  }
}
