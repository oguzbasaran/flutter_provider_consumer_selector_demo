import 'package:flutter/material.dart';
import 'package:flutter_provider_consumer_selector_demo/providers/user_provider.dart';
import 'package:flutter_provider_consumer_selector_demo/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
