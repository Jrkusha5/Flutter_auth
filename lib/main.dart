import 'package:flutter/material.dart';
import 'package:flutterauth/screens/auth/login_screen.dart';
import 'package:flutterauth/screens/auth/register_screen.dart'; // Add your LoginScreen import
import 'package:provider/provider.dart';
import 'package:flutterauth/providers/auth_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AuthProvider(),
      child: MaterialApp(
        title: 'Flutter Auth App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: RegisterScreen(), // Starting screen is RegisterScreen
        routes: {
          '/login': (context) => LoginScreen(), // Define the /login route
          // Add any other routes here if needed
        },
      ),
    );
  }
}
