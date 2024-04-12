import 'package:flutter/material.dart';
import './adminPanel/adminuser.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Simulate user authentication. In a real app, you would replace this with actual authentication logic.
    final currentUser = User(isAdmin: true); // Assuming the user is an admin

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RegisterPage(user: currentUser),
    );
  }
}
