import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Venuepage extends StatefulWidget {
  const Venuepage({Key? key}) : super(key: key);

  @override
  State<Venuepage> createState() => _VenuepageState();
}

class _VenuepageState extends State<Venuepage> {
  // void _openMaps() async {
  //   // Address to open in Google Maps
  //   String address =
  //       '49/A, 1st Floor Ravish Gardenia, Ravish Mangroves Vaderahalli, Post, Vidyaranyapura, Bengaluru, Karnataka 560097';
  //   String encodedAddress = Uri.encodeFull(address);
  //   String googleMapsUrl =
  //       'https://www.google.com/maps/search/?api=1&query=$encodedAddress';

  //   if (await canLaunch(googleMapsUrl)) {
  //     await launch(googleMapsUrl);
  //   } else {
  //     throw 'Could not launch $googleMapsUrl';
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Venue',
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
              height: 180, // Adjust the height of the image
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      'assets/blur.jpeg'), // Replace this with your image path
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: Text(
                  'Venue',
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
                    'Address',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    '49/A, 1st Floor Ravish Gardenia, Ravish Mangroves Vaderahalli, Post, Vidyaranyapura, Bengaluru, Karnataka 560097 Phone: 070192 49965',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                  // SizedBox(height: 16),
                  // ElevatedButton(
                  //   onPressed: _openMaps,
                  //   child: Text('DIRECTION'),
                  // ),
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
        'Venue',
        style: TextStyle(
          color: Colors.white, // Change the text color here
        ),
      ),
      centerTitle: true,
      backgroundColor: Colors.red.shade900,
    ),
  );
}
