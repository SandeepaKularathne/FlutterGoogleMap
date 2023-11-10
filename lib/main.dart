import 'package:flutter/material.dart';
import 'package:maps/pages/home_page.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.amber,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
      },
    );
  }

}