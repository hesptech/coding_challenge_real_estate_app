import 'package:flutter/material.dart';
import '/presentation/screens/screens.dart';

var customRoutes = <String, WidgetBuilder>{

  '/': ( _ ) => const HomeScreen(),
  'listings': ( _ ) => const ListingsScreen(),
  'description': ( _ ) => const DescriptionScreen(),

};
