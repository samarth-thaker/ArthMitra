import 'package:budgetplanner/Authentication/loginscreen.dart';
import 'package:budgetplanner/Authentication/signupscreen.dart';
import 'package:budgetplanner/Dashboard/dashboardScreen.dart';
import 'package:budgetplanner/Welcome/screens/welcomeScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const WelcomeScreen(),
      routes: {
        '/loginscreen': (context)=>const Loginscreen(),
        '/signupscreen' : (context) =>const Signupscreen(),
        '/dashboard' : (context) => const DashboardScreen(),
      },
    );
  }
}

