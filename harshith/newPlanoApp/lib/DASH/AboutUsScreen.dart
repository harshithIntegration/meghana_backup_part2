import 'package:flutter/material.dart';

class AboutUspage extends StatefulWidget {
  const AboutUspage({Key? key}) : super(key: key);

  @override
  State<AboutUspage> createState() => _AboutUspageState();
}

class _AboutUspageState extends State<AboutUspage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'About Us',
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
                  'About Us',
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
                    'WELCOME TO PLANOTECH',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const Text(
                    '',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                  const Text('Our Story',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  const Text('Founded under the visionary leadership of Darshan Kumar K, Planotech Group of Companies has evolved into a beacon of innovation and diversity in the business world. From humble beginnings in event management, we have expanded our horizons to include digital marketing, media production, and philanthropy, consistently setting benchmarks for excellence and creativity.',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  const Text('  ',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  const Text('Our Vision',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  const Text('At Planotech, our vision is to be at the vanguard of industry innovation and societal transformation. We aim to lead by example, using our diverse business ventures as platforms for positive change and sustainable growth',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.justify,
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
        'About Us',
        style: TextStyle(
          color: Colors.white, // Change the text color here
        ),
      ),
      centerTitle: true,
      backgroundColor: Colors.red.shade900,
    ),
  );
}
