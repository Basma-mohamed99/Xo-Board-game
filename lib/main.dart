import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xoassig/bord_Screen.dart';
import 'package:xoassig/bord_Screen.dart';

import 'home_screen.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        HomeScreen.routeName: (_) => HomeScreen(),
        BordScreen.routeName: (_) => BordScreen(),
      },
      initialRoute: HomeScreen.routeName,
    );
  }
}
