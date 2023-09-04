import 'package:flutter/material.dart';
import 'package:omar_flutter/route_manager.dart';
import 'package:omar_flutter/screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator().getRoute,
      home: const LoginScreen(),
    );
  }
}
