import 'package:flutter/material.dart';
import 'package:flutterauth/screens/auth/login_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              // Clear user session or token and navigate to login
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) =>  LoginScreen()),
              );
            },
          ),
        ],
      ),
      body: const Center(
        child: Text(
          'Welcome to the Home Screen!',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
