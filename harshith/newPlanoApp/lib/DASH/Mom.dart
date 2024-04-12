import 'package:flutter/material.dart';

class Mompage extends StatefulWidget {
  const Mompage({Key? key}) : super(key: key);

  @override
  State<Mompage> createState() => _MompageState();
}

class _MompageState extends State<Mompage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'MOM',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.red.shade900,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }
}
