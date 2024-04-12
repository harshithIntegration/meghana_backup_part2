// --------------------->first normal code for shared preferences --------------------
// import 'dart:convert';

// import 'contact.dart';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   TextEditingController nameController = TextEditingController();
//   TextEditingController contactController = TextEditingController();
//   List<Contact> contacts = List.empty(growable: true);

//   int selectedIndex = -1;

//   late SharedPreferences sp;

//   getSharedPrefrences() async {
//     sp = await SharedPreferences.getInstance();
//     readFromSp();
//   }

//   saveIntoSp() {
//     //
//     List<String> contactListString =
//         contacts.map((contact) => jsonEncode(contact.toJson())).toList();
//     sp.setStringList('myData', contactListString);
//     //
//   }

//   readFromSp() {
//     //
//     List<String>? contactListString = sp.getStringList('myData');
//     if (contactListString != null) {
//       contacts = contactListString
//           .map((contact) => Contact.fromJson(json.decode(contact)))
//           .toList();
//     }
//     setState(() {});
//     //
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: const Text('Profile Information'),
//         backgroundColor: Color.fromARGB(255, 169, 204, 189),
//         foregroundColor: Colors.white,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: SingleChildScrollView(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               const SizedBox(height: 20),
//               TextField(
//                 controller: nameController,
//                 decoration: const InputDecoration(
//                   hintText: 'Contact Name',
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.all(
//                       Radius.circular(10),
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 25),
//               TextField(
//                 controller: contactController,
//                 keyboardType: TextInputType.number,
//                 maxLength: 10,
//                 decoration: const InputDecoration(
//                   hintText: 'Contact Number',
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.all(
//                       Radius.circular(10),
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 30),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   ElevatedButton(
//                     onPressed: () {
//                       String name = nameController.text.trim();
//                       String contact = contactController.text.trim();
//                       if (name.isNotEmpty && contact.isNotEmpty) {
//                         setState(() {
//                           nameController.text = '';
//                           contactController.text = '';
//                           contacts.add(Contact(name: name, contact: contact));
//                         });
//                         saveIntoSp();
//                       }
//                     },
//                     child: const Text('Save'),
//                   ),
//                   ElevatedButton(
//                     onPressed: () {
//                       String name = nameController.text.trim();
//                       String contact = contactController.text.trim();
//                       if (name.isNotEmpty && contact.isNotEmpty) {
//                         setState(() {
//                           nameController.text = '';
//                           contactController.text = '';
//                           contacts[selectedIndex].name = name;
//                           contacts[selectedIndex].contact = contact;
//                           selectedIndex = -1;
//                         });
//                         saveIntoSp();
//                       }
//                     },
//                     child: const Text('Update'),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 50),
//               contacts.isEmpty
//                   ? const Text(
//                       'No Contact yet..',
//                       style: TextStyle(fontSize: 22),
//                     )
//                   : ListView.builder(
//                       shrinkWrap: true,
//                       itemCount: contacts.length,
//                       itemBuilder: (context, index) => getRow(index),
//                     )
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget getRow(int index) {
//     return Card(
//       child: ListTile(
//         leading: CircleAvatar(
//           backgroundColor:
//               index % 2 == 0 ? Colors.deepPurpleAccent : Colors.purple,
//           foregroundColor: Colors.white,
//           child: Text(
//             contacts[index].name[0],
//             style: const TextStyle(fontWeight: FontWeight.bold),
//           ),
//         ),
//         title: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               contacts[index].name,
//               style: const TextStyle(fontWeight: FontWeight.bold),
//             ),
//             Text(contacts[index].contact),
//           ],
//         ),
//         trailing: SizedBox(
//           width: 70,
//           child: Row(
//             children: [
//               InkWell(
//                   onTap: () {
//                     //
//                     nameController.text = contacts[index].name;
//                     contactController.text = contacts[index].contact;
//                     setState(() {
//                       selectedIndex = index;
//                     });
//                     //
//                   },
//                   child: const Icon(Icons.edit)),
//               InkWell(
//                   onTap: (() {
//                     //
//                     setState(() {
//                       contacts.removeAt(index);
//                     });
//                     // Saving contacts list into Shared Prefrences
//                     saveIntoSp();
//                     //
//                   }),
//                   child: const Icon(Icons.delete)),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }









// ----------------------------------------------->updated shrared preferences code for contact name and contact number

// import 'dart:convert';

// import 'contact.dart';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   TextEditingController nameController = TextEditingController();
//   TextEditingController contactController = TextEditingController();
//   List<Contact> contacts = List.empty(growable: true);

//   int selectedIndex = -1;

//   late SharedPreferences sp;

//   @override
//   void initState() {
//     super.initState();
//     getSharedPreferences();
//   }

//   getSharedPreferences() async {
//     sp = await SharedPreferences.getInstance();
//     readFromSp();
//   }

//   saveIntoSp() {
//     List<String> contactListString =
//         contacts.map((contact) => jsonEncode(contact.toJson())).toList();
//     sp.setStringList('myData', contactListString);
//   }

//   readFromSp() {
//     List<String>? contactListString = sp.getStringList('myData');
//     if (contactListString != null) {
//       contacts = contactListString
//           .map((contact) => Contact.fromJson(json.decode(contact)))
//           .toList();
//     }
//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: const Text('Profile Information'),
//         backgroundColor: Color.fromARGB(255, 169, 204, 189),
//         foregroundColor: Colors.white,
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               const SizedBox(height: 20),
//               TextField(
//                 controller: nameController,
//                 decoration: const InputDecoration(
//                   hintText: 'Contact Name',
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.all(
//                       Radius.circular(10),
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 25),
//               TextField(
//                 controller: contactController,
//                 keyboardType: TextInputType.number,
//                 maxLength: 10,
//                 decoration: const InputDecoration(
//                   hintText: 'Contact Number',
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.all(
//                       Radius.circular(10),
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 30),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   ElevatedButton(
//                     onPressed: () {
//                       String name = nameController.text.trim();
//                       String contact = contactController.text.trim();
//                       if (name.isNotEmpty && contact.isNotEmpty) {
//                         setState(() {
//                           nameController.text = '';
//                           contactController.text = '';
//                           contacts.add(Contact(name: name, contact: contact));
//                         });
//                         saveIntoSp();
//                       }
//                     },
//                     child: const Text('Save'),
//                   ),
//                   ElevatedButton(
//                     onPressed: () {
//                       String name = nameController.text.trim();
//                       String contact = contactController.text.trim();
//                       if (name.isNotEmpty && contact.isNotEmpty) {
//                         setState(() {
//                           nameController.text = '';
//                           contactController.text = '';
//                           contacts[selectedIndex].name = name;
//                           contacts[selectedIndex].contact = contact;
//                           selectedIndex = -1;
//                         });
//                         saveIntoSp();
//                       }
//                     },
//                     child: const Text('Update'),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 50),
//               SizedBox(
//                 height: 300, // Adjust the height as needed
//                 child: ListView.builder(
//                   itemCount: contacts.length,
//                   itemBuilder: (context, index) => getRow(index),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget getRow(int index) {
//     return Card(
//       child: ListTile(
//         leading: CircleAvatar(
//           backgroundColor:
//               index % 2 == 0 ? Colors.deepPurpleAccent : Colors.purple,
//           foregroundColor: Colors.white,
//           child: Text(
//             contacts[index].name[0],
//             style: const TextStyle(fontWeight: FontWeight.bold),
//           ),
//         ),
//         title: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               contacts[index].name,
//               style: const TextStyle(fontWeight: FontWeight.bold),
//             ),
//             Text(contacts[index].contact),
//           ],
//         ),
//         trailing: SizedBox(
//           width: 70,
//           child: Row(
//             children: [
//               InkWell(
//                 onTap: () {
//                   nameController.text = contacts[index].name;
//                   contactController.text = contacts[index].contact;
//                   setState(() {
//                     selectedIndex = index;
//                   });
//                 },
//                 child: const Icon(Icons.edit),
//               ),
//               InkWell(
//                 onTap: (() {
//                   setState(() {
//                     contacts.removeAt(index);
//                   });
//                   saveIntoSp();
//                 }),
//                 child: const Icon(Icons.delete),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }








// ----------------------------------------->trying the shared preferences for the email and password


// import 'dart:convert';
// import 'contact.dart';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//   List<Contact> contacts = List.empty(growable: true);

//   int selectedIndex = -1;

//   late SharedPreferences sp;

//   @override
//   void initState() {
//     super.initState();
//     getSharedPreferences();
//   }

//   getSharedPreferences() async {
//     sp = await SharedPreferences.getInstance();
//     readFromSp();
//   }

//   saveIntoSp() {
//     List<String> contactListString =
//         contacts.map((contact) => jsonEncode(contact.toJson())).toList();
//     sp.setStringList('myData', contactListString);
//   }
//   readFromSp() {
//     List<String>? contactListString = sp.getStringList('myData');
//     if (contactListString != null) {
//       contacts = contactListString
//           .map((contact) => Contact.fromJson(json.decode(contact)))
//           .toList();
//     }
//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: const Text('Login'),

//         backgroundColor: Color.fromARGB(255, 169, 204, 189),
//         foregroundColor: Colors.white,

//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               const SizedBox(height: 20),
//               TextField(
//                 controller: emailController,
//                 decoration: const InputDecoration(
//                   hintText: 'Email',
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.all(
//                       Radius.circular(10),
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 25),
//               TextField(
//                 controller: passwordController,
//                 obscureText: true,
//                 decoration: const InputDecoration(
//                   hintText: 'Password',
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.all(
//                       Radius.circular(10),
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 30),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   ElevatedButton(
//                     onPressed: () {
//                       String email = emailController.text.trim();
//                       String password = passwordController.text.trim();
//                       if (email.isNotEmpty && password.isNotEmpty) {
//                         setState(() {
//                           emailController.text = '';
//                           passwordController.text = '';
//                           contacts.add(Contact(email: email, password: password));
//                         });
//                         saveIntoSp();
//                       }
//                     },
//                     child: const Text('Login'),
//                   ),
//                   ElevatedButton(
//                     onPressed: () {
//                       String email = emailController.text.trim();
//                       String password = passwordController.text.trim();
//                       if (email.isNotEmpty && password.isNotEmpty) {
//                         setState(() {
//                           emailController.text = '';
//                           passwordController.text = '';
//                           contacts[selectedIndex].email = email;
//                           contacts[selectedIndex].password = password;
//                           selectedIndex = -1;
//                         });
//                         saveIntoSp();
//                       }
//                     },
//                     child: const Text('Update'),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 50),
//               SizedBox(
//                 height: 360, // Adjust the height as needed
//                 child: ListView.builder(
//                   itemCount: contacts.length,
//                   itemBuilder: (context, index) => getRow(index),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget getRow(int index) {
//     return Card(
//       child: ListTile(
//         leading: CircleAvatar(
//           backgroundColor:
//               index % 2 == 0 ? Colors.deepPurpleAccent : Colors.purple,
//           foregroundColor: Colors.white,
//           child: Text(
//             contacts[index].email[0],
//             style: const TextStyle(fontWeight: FontWeight.bold),
//           ),
//         ),
//         title: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               contacts[index].email,
//               style: const TextStyle(fontWeight: FontWeight.bold),
//             ),
//             Text(contacts[index].password),
//           ],
//         ),
//         trailing: SizedBox(
//           width: 70,
//           child: Row(
//             children: [
//               InkWell(
//                 onTap: () {
//                   emailController.text = contacts[index].email;
//                   passwordController.text = contacts[index].password;
//                   setState(() {
//                     selectedIndex = index;
//                   });
//                 },
//                 child: const Icon(Icons.edit),
//               ),
//               InkWell(
//                 onTap: (() {
//                   setState(() {
//                     contacts.removeAt(index);
//                   });
//                   saveIntoSp();
//                 }),
//                 child: const Icon(Icons.delete),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }










// code to use local file storage instead of SharedPreferences

import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  List<Contact> contacts = [];

  late File contactsFile;
  late Directory directory;
  final String fileName = "contacts.json";

  @override
  void initState() {
    super.initState();
    getApplicationDocumentsDirectory().then((dir) {
      directory = dir;
      contactsFile = File("${directory.path}/$fileName");
      if (contactsFile.existsSync()) {
        readFromLocalFile();
      }
    });
  }

  Future<File> getLocalFile() async {
    directory = await getApplicationDocumentsDirectory();
    return File("${directory.path}/$fileName");
  }

  void readFromLocalFile() async {
    String contactsString = await contactsFile.readAsString();
    List<dynamic> jsonList = json.decode(contactsString);
    setState(() {
      contacts = jsonList.map((json) => Contact.fromJson(json)).toList();
    });
  }

  void saveToLocalFile() async {
    String contactsString = json.encode(contacts);
    File file = await getLocalFile();
    file.writeAsString(contactsString);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Login'),
        backgroundColor: Color.fromARGB(255, 169, 204, 189),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  hintText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 25),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      String email = emailController.text.trim();
                      String password = passwordController.text.trim();
                      if (email.isNotEmpty && password.isNotEmpty) {
                        setState(() {
                          emailController.clear();
                          passwordController.clear();
                          contacts.add(Contact(email: email, password: password));
                        });
                        saveToLocalFile();
                      }
                    },
                    child: const Text('Login'),
                  ),
                ],
              ),
              const SizedBox(height: 50),
              SizedBox(
                height: 360,
                child: ListView.builder(
                  itemCount: contacts.length,
                  itemBuilder: (context, index) => ListTile(
                    title: Text(contacts[index].email),
                    subtitle: Text(contacts[index].password),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Contact {
  String email;
  String password;

  Contact({required this.email, required this.password});

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }

  factory Contact.fromJson(Map<String, dynamic> json) {
    return Contact(
      email: json['email'],
      password: json['password'],
    );
  }
}




