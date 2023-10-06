import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'Screens/Footprint Screen.dart';
import 'Screens/On landing Screen.dart';
import 'Screens/Water Cycle Screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //final prefs = await SharedPreferences.getInstance();
  //final showHome = prefs.getBool('showHome') ?? false;
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hydro Alert',
      debugShowCheckedModeBanner: false ,
      theme: ThemeData(
       colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF64B5F6), primary: const Color(0xFF64B5F6)),
        useMaterial3: true,
      ),
      home: OnLandingScreen(),
    );
  }
}
