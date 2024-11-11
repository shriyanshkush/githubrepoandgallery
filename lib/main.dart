import 'package:flutter/material.dart';
import 'package:githubrepoandgallery/screens/home_screen.dart';
import 'package:githubrepoandgallery/screens/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GitHub & Unsplash App',
      theme: ThemeData(
        primaryColor: Color(0xFF1E88E5),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue.shade400),
        appBarTheme: AppBarTheme(
            centerTitle: true,
            color: Color(0xFF1E88E5),
            foregroundColor: Colors.white
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/home': (context) => HomeScreen(),
      },
    );
  }
}
