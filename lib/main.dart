import 'package:flutter/material.dart';
import 'package:flutter_web/pages/desktop_scaffold.dart';
import 'package:flutter_web/pages/mobile_scaffold.dart';
import 'package:flutter_web/pages/tables_scaffold.dart';
import 'package:flutter_web/responsive/responsive_layout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.

  //як widget месозем ки вакти алиш шидани размери экран 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ResponsiveLayout(
          desktopScaffold: DesktopScaffold(),
          mobileScaffold: MobileScaffold(),
          tabletScaffold: TabletScaffold(),
        ));
  }
}
