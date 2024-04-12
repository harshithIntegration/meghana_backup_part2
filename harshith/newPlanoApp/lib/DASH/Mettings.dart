import 'package:flutter/material.dart';

class Mettingpage extends StatefulWidget {
  const Mettingpage({Key? key}) : super(key: key);

  @override
  State<Mettingpage> createState() => _MettingpageState();
}

class _MettingpageState extends State<Mettingpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Mettings',
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              height: 180,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      'assets/blur.jpeg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: Text(
                  'Mettings',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                  const Text(
                    'MEETINGS ARE SCHEDULED AT 5:30 PM',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

@override
Widget build(BuildContext context) {
  return Scaffold(
    // backgroundColor: Colors.grey[200],
    appBar: AppBar(
      title: Text(
        'Mettings',
        style: TextStyle(
          color: Colors.white, // Change the text color here
        ),
      ),
      centerTitle: true,
      backgroundColor: Colors.red.shade900,
    ),
  );
}
