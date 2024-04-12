// import 'dart:convert';
// import 'package:http/http.dart' as http;

// import 'package:flutter/material.dart';
// import 'package:ono/signUp.dart';

// import 'DASH/dashboard.dart';

// class LoginPage extends StatefulWidget {
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   bool passToggle = true;
//   String _loginMessage = '';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('LOGIN'),
//         centerTitle: true,
//         backgroundColor: Colors.red,
//         titleTextStyle: const TextStyle(
//           fontSize: 30,
//           fontWeight: FontWeight.bold,
//           color: Colors.white,
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               TextFormField(
//                 controller: _emailController,
//                 keyboardType: TextInputType.emailAddress,
//                 decoration: const InputDecoration(
//                   border: OutlineInputBorder(),
//                   labelText: 'Email',
//                   prefixIcon: Icon(Icons.email),
//                 ),
//                 validator: (value) {
//                   if (value!.isEmpty) {
//                     return 'Please enter your email';
//                   } else if (!RegExp(
//                           r"^[a-zA-Z0-9,a-zA-Z0-9,!#$%&'*+-/=?^_`{|~}]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
//                       .hasMatch(value)) {
//                     return 'Please enter a valid email';
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(height: 16.0),
//               TextFormField(
//                 controller: _passwordController,
//                 obscureText: passToggle,
//                 keyboardType: TextInputType.text,
//                 decoration: InputDecoration(
//                   labelText: 'Password',
//                   border: OutlineInputBorder(),
//                   prefixIcon: const Icon(Icons.lock),
//                   suffixIcon: InkWell(
//                     onTap: () {
//                       setState(() {
//                         passToggle = !passToggle;
//                       });
//                     },
//                     child: Icon(
//                         passToggle ? Icons.visibility_off : Icons.visibility),
//                   ),
//                 ),
//                 validator: (value) {
//                   if (value!.isEmpty) {
//                     return 'Please enter your password';
//                   } else if (value.length < 3) {
//                     return 'Password must be at least 6 characters';
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(height: 8.0), // Adjust spacing as needed
//               ElevatedButton(
//                 onPressed: () {
//                   if (_formKey.currentState!.validate()) {
//                     // Perform Login
//                     login();
//                   }
//                 },
//                 child: Text('Login'),
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.red,
//                   foregroundColor: Colors.white,
//                 ),
//               ),
//               const SizedBox(height: 8.0), // Adjust spacing as needed
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const Text("Don't have an account?"),
//                   TextButton(
//                     onPressed: () {
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => const SignUpPage()));
//                     },
//                     child: const Text('Sign up'),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 16),
//               Text(
//                 _loginMessage,
//                 style: TextStyle(
//                   color: _loginMessage.startsWith('Error') ? Colors.red.shade900 : Colors.red,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

// void login() async {
//   String email = _emailController.text;
//   String password = _passwordController.text;

//   try {
//     final response = await http.post(
//       Uri.parse("http://13.200.173.137:4040/qp/userLogin"),
//       headers: <String, String>{
//         'Content-Type': 'application/json; charset=UTF-8',
//       },
//       body: jsonEncode({
//         'userEmail': email,
//         'userPassword': password,
//       }),
//     );

//     if (response.statusCode == 200) {
//       var res = json.decode(response.body);
//       if (res['message'] == 'pass') {
//         // Navigate to dashboard
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => dashboard()),
//         );
//       } else {
//         // Invalid email or password
//         setState(() {
//           _loginMessage = "Invalid email or password";
//         });
//       }
//     } else {
//       // Server error
//       setState(() {
//         _loginMessage = "Error: ${response.statusCode}";
//       });
//     }
//   } catch (error) {
//     setState(() {
//       _loginMessage = "Error: $error";
//     });
//   }
// }
// }




import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ono/Admin/newUser.dart';
import 'package:ono/DASH/dashboard.dart';
import 'package:ono/signUp.dart';

class LoginCredentials {
  final String userEmail;
  final String userPassword;

  LoginCredentials({
    required this.userEmail,
    required this.userPassword,
  });

  Map<String, dynamic> toJson() {
    return {
      'userEmail': userEmail,
      'userPassword': userPassword,
    };
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
   bool passToggle = true;

  String? storedEmail; // Variable to store the stored email

  @override
  void initState() {
    super.initState();
    _retrieveLoginData(); // Retrieve stored login data when the page is initialized
  }

  // Method to retrieve stored login data
  _retrieveLoginData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    storedEmail = prefs.getString('email'); // Retrieve stored email
    // Set stored email in the email controller
    _emailController.text = storedEmail ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Login'),
        centerTitle: true,
        backgroundColor: Colors.red.shade900,
        titleTextStyle: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.normal,
          color: Colors.white,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your email';
                  } else if (!RegExp(
                          r"^[a-zA-Z0-9,a-zA-Z0-9,!#$%&'*+-/=?^_`{|~}]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(value)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _passwordController,
                obscureText: passToggle,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: const OutlineInputBorder(),
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: InkWell(
                    onTap: () {
                      setState(() {
                        passToggle = !passToggle;
                      });
                    },
                    child: Icon(
                        passToggle ? Icons.visibility_off : Icons.visibility),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your password';
                  } else if (value.length < 6) {
                    return 'Password must be at least 6 characters';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 8.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    LoginCredentials credentials = LoginCredentials(
                      userEmail: _emailController.text,
                      userPassword: _passwordController.text,
                    );
                    String jsonData = jsonEncode(credentials.toJson());
                    http
                        .post(
                      Uri.parse("http://3.6.109.119:4040/qp/userLogin"),
                      headers: <String, String>{
                        'Content-Type': 'application/json; charset=UTF-8',
                      },
                      body: jsonData,
                    )
                        .then((response) {
                      if (response.statusCode == 200) {
                        var res = json.decode(response.body);
                        print(res);
                        Map<String, dynamic> data = jsonDecode(response.body);
                        String message = data['message'];
                        print("--------------------");
                        print(message);
                        if (message == "pass") {
                          bool userStatus = data['user']['userStatus'];
                          print("-------");
                          if (userStatus) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RegisterPage(),
                              ),
                            );
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => dashboard(),
                              ),
                            );
                          }
                        } else if (message == "fail") {
                          String error = data['error'];
                          _showErrorSnackBar(context, error, _formKey);
                        } else {
                          print("Unknown message");
                        }
                      } else {
                        print('Login failed');
                      }
                    }).catchError((error) {
                      print('Error: $error');
                    });
                  }
                },
                child: Text('Login'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red.shade900,
                  foregroundColor: Colors.white,
                ),
              ),
              const SizedBox(height: 8.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account?"),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignUpPage(),
                        ),
                      );
                      print('Sign up now pressed');
                    },
                    child: const Text('Sign up'),
                  ),
                ],
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  void _showErrorSnackBar(
      BuildContext context, String error, GlobalKey<FormState> formKey) {
    final snackBar = SnackBar(
      content: Row(
        children: [
          Icon(Icons.error, color: Colors.white),
          SizedBox(width: 10),
          Text(
            error,
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
      backgroundColor: Colors.red,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);

    // Highlight the respective text field with red border
    formKey.currentState?.validate();
  }
}

