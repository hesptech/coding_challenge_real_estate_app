import 'package:coding_challenge_real_estate_app/config/config.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      /* home: Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      ), */
    );
  }
}
