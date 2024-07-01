import 'package:flutter/material.dart';

import '../features/home/home.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CV Maker',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
