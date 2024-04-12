import 'package:flutter/material.dart';

class Scientificpage extends StatefulWidget {
  const Scientificpage({Key? key}) : super(key: key);

  @override
  State<Scientificpage> createState() => _ScientificpageState();
}

class _ScientificpageState extends State<Scientificpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Scientific Program',
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
