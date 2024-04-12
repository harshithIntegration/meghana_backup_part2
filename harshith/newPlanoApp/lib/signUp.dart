// import 'package:csc_picker/csc_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:ono/login.dart';
// // import 'package:ono/login.dart';
// import 'signupService.dart';

// class SignUpPage extends StatefulWidget {
//   const SignUpPage({Key? key}) : super(key: key);

//   @override
//   State<SignUpPage> createState() => _SignUpPageState();
// }

// class _SignUpPageState extends State<SignUpPage> {
//   bool passToggle = true;
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _countryController = TextEditingController();
//   final TextEditingController _stateController = TextEditingController();
//   final TextEditingController _mobileController = TextEditingController();
//     final TextEditingController _passwordController = TextEditingController();




  

//    Service service = Service();

// String _responseMessage = '';


   

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back),
//           color: Colors.white,
//           onPressed: () {
//             Navigator.of(context).pop();
//           },
//         ),
//         title: Text('SignUp'),
//         centerTitle: true,
//         backgroundColor: Colors.red.shade900,
//         titleTextStyle: TextStyle(
//           fontSize: 20,
//           fontWeight: FontWeight.normal,
//           color: Colors.white,
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Form(
//             key: _formKey,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 SizedBox(
//                   height: 50.0,
//                   child: TextFormField(
//                     controller: _nameController,
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter your name';
//                       }
//                       return null;
//                     },
//                     decoration: InputDecoration(
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       labelText: 'Name',
//                       labelStyle: TextStyle(
//                         color: Colors.black,
//                         fontSize: 14,

//                       ),
//                       prefixIcon: Icon(Icons.perm_identity,
//                           color: Color.fromARGB(255, 65, 63, 63)),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 15.0),
//                 SizedBox(
//                   height: 50.0,
//                   child: TextFormField(
//                     controller: _mobileController,
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter your mobile number';
//                       }
//                       if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
//                         return 'Please enter a valid 10-digit mobile number';
//                       }
//                       return null;
//                     },
//                     decoration: InputDecoration(
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       labelText: 'Mobile Number',
//                       labelStyle: TextStyle(
//                         color: Colors.black,
//                         fontSize: 14,

//                       ),
//                       prefixIcon: Icon(Icons.phone,
//                           color: Color.fromARGB(255, 65, 63, 63)),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 15.0),
//                 SizedBox(
//                   height: 50.0,
//                   child: TextFormField(
//                     controller: _emailController,
//                     decoration: InputDecoration(
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       labelText: 'Email',
//                       labelStyle: TextStyle(
//                         color: Colors.black,
//                         fontSize: 14,
//                       ),
//                       prefixIcon: Icon(Icons.email,
//                           color: Color.fromARGB(255, 65, 63, 63)),
//                     ),
//                     validator: (value) {
//                       if (value!.isEmpty) {
//                         return 'Please enter your email';
//                       } else if (!RegExp(
//                           r"^[a-zA-Z0-9,a-zA-Z0-9,!#$%&'*+-/=?^_`{|~}]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
//                           .hasMatch(value)) {
//                         return 'Please enter a valid email';
//                       }
//                       return null;
//                     },
//                   ),
//                 ),
//                 const SizedBox(height: 15.0),
//                 SizedBox(
//                   height: 50.0,
//                   child: TextFormField(
//                     controller: _passwordController,
//                     obscureText: passToggle,
//                     decoration: InputDecoration(
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       labelText: 'Password',
//                       labelStyle: TextStyle(
//                         color: Colors.black,
//                         fontSize: 14,
//                       ),
//                       prefixIcon: Icon(Icons.lock_outlined,
//                           color: Color.fromARGB(255, 65, 63, 63)),
//                       suffixIcon: InkWell(
//                         onTap: () {
//                           setState(() {
//                             passToggle = !passToggle;
//                           });
//                         },
//                         child: Icon(passToggle
//                             ? Icons.visibility_off
//                             : Icons.visibility),
//                       ),
//                     ),
//                     validator: (value) {
//                       if (value!.isEmpty) {
//                         return 'Please enter your password';
//                       } else if (value.length < 3) {
//                         return 'Password must be at least 3 characters';
//                       }
//                       return null;
//                     },
//                   ),
//                 ),
//                 const SizedBox(height: 20.0),
//                Container(
//   height: 110.0, // Adjust the height of CSCPicker
//   child: CSCPicker(
//     onCountryChanged: (country) {
//       setState(() {
//         _countryController.text = country; // Update country controller
//       });
//     },
//     onStateChanged: (state) {
//       setState(() {
//         _stateController.text = state ?? ''; // Update state controller
//       });
//     },
//     onCityChanged: (city) {}, // You can implement this if needed
//     layout: Layout.horizontal,
//     countrySearchPlaceholder: "Country",
//     stateSearchPlaceholder: "State",
//     citySearchPlaceholder: "City",
//     // defaultCountry: CscCountry.India,
//     showStates: true,
//     showCities: false,
//   ),
// ),

//                 const SizedBox(height: 10.0),

//                 SizedBox(
//                   height: 50,
//                   child: ElevatedButton(
//                     onPressed: () {
//                       if (_formKey.currentState!.validate()) {
                      


//                          service.saveUser(
//                           _nameController.text,
//                           _emailController.text,
//                           _countryController.text,
//                           _stateController.text,
//                             _mobileController.text,
//                            _passwordController.text,
                          
                         
//                         );

                        
//       Navigator.pop(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) =>  LoginPage()),
//                         );
//                         // Clear all text fields
//                         // _nameController.clear();
//                         // _emailController.clear();
//                         // _countryController.clear();
//                         // _stateController.clear();
//                         // _passwordController.clear();
//                         // _mobileController.clear();
//                       }
//                     },
//                     child: Text('SignUp'),
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.red.shade900,
//                       foregroundColor: Colors.white,
//                     ), 
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }






import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:csc_picker/csc_picker.dart';
import 'package:ono/login.dart';
import 'signupService.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool passToggle = true;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Service service = Service();
  String _responseMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text('SignUp'),
        centerTitle: true,
        backgroundColor: Colors.red.shade900,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 50.0,
                  child: TextFormField(
                    controller: _nameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: 'Name',
                      labelStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                      prefixIcon: Icon(Icons.perm_identity,
                          color: Color.fromARGB(255, 65, 63, 63)),
                    ),
                  ),
                ),
                const SizedBox(height: 15.0),
                SizedBox(
                  height: 50.0,
                  child: TextFormField(
                    controller: _mobileController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your mobile number';
                      }
                      if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
                        return 'Please enter a valid 10-digit mobile number';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: 'Mobile Number',
                      labelStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                      prefixIcon: Icon(Icons.phone,
                          color: Color.fromARGB(255, 65, 63, 63)),
                    ),
                  ),
                ),
                const SizedBox(height: 15.0),
                SizedBox(
                  height: 50.0,
                  child: TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: 'Email',
                      labelStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                      prefixIcon: Icon(Icons.email,
                          color: Color.fromARGB(255, 65, 63, 63)),
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
                ),
                const SizedBox(height: 15.0),
                SizedBox(
                  height: 50.0,
                  child: TextFormField(
                    controller: _passwordController,
                    obscureText: passToggle,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: 'Password',
                      labelStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                      prefixIcon: Icon(Icons.lock_outlined,
                          color: Color.fromARGB(255, 65, 63, 63)),
                      suffixIcon: InkWell(
                        onTap: () {
                          setState(() {
                            passToggle = !passToggle;
                          });
                        },
                        child: Icon(passToggle
                            ? Icons.visibility_off
                            : Icons.visibility),
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
                ),
                const SizedBox(height: 20.0),
                Container(
                  height: 110.0,
                  child: CSCPicker(
                    onCountryChanged: (country) {
                      setState(() {
                        _countryController.text = country;
                      });
                    },
                    onStateChanged: (state) {
                      setState(() {
                        _stateController.text = state ?? '';
                      });
                    },
                    onCityChanged: (city) {},
                    layout: Layout.horizontal,
                    countrySearchPlaceholder: "Country",
                    stateSearchPlaceholder: "State",
                    citySearchPlaceholder: "City",
                    showStates: true,
                    showCities: false,
                  ),
                ),
                const SizedBox(height: 10.0),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      var response = await service.saveUser(
                        _nameController.text,
                        _emailController.text,
                        _countryController.text,
                        _stateController.text,
                        _mobileController.text,
                        _passwordController.text,
                      );

                      var responseBody = json.decode(response.body);

                      setState(() {
                        _responseMessage = responseBody['message'] ?? '';
                      });

                      if (_responseMessage == 'pass') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                      }
                    }
                  },
                  child: Text('SignUp'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red.shade900,
                    foregroundColor: Colors.white,
                  ),
                ),
                if (_responseMessage.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      _responseMessage == 'pass'
                          ? 'Registration successful!'
                          : 'Registration failed: Account already exists',
                      style: TextStyle(
                        color: _responseMessage == 'pass'
                            ? Colors.green
                            : Colors.red,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
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
