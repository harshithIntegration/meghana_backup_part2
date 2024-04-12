import 'package:flutter/material.dart';
import 'package:ono/login.dart';

class OTPController {
  bool validateOTP(String otp) {
    return otp.length == 6;
  }
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  final TextEditingController _otpController = TextEditingController();
  final OTPController otpController = OTPController();

  var context;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            title: const Text('Confirm OTP'),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            centerTitle: true,
            backgroundColor: Colors.red,
            titleTextStyle: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            )),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                  controller: _otpController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Enter OTP',
                    hintText: 'Enter your valid OTP',
                    border: OutlineInputBorder(),
                  ),
                  maxLength: 6,
                ),
                const SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                  child: const Text('Validate OTP'),
                  style: ButtonStyle(
                    backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.red),
                    foregroundColor:
                    MaterialStateProperty.all<Color>(Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
