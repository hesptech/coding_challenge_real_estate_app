import 'package:flutter/material.dart';
import 'package:coding_challenge_real_estate_app/config/config.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //routerConfig: appRouter,
      initialRoute: '/',
      routes: customRoutes,
      debugShowCheckedModeBanner: false,
      theme: AppTheme().getTheme(),
    );
  }
}
