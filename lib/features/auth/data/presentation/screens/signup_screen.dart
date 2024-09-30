import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // automaticallyImplyLeading: true, // هذا يجعل السهم يظهر تلقائيًا
          ),
      body: const Center(
        child: Text('Welcome to the Sign Up Screen'),
      ),
    );
  }
}
