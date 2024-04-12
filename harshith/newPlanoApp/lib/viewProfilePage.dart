import 'package:flutter/material.dart';
import 'package:ono/user.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Import shared_preferences

class viewProfilePage extends StatefulWidget {
  const viewProfilePage();

  @override
  _viewProfilePageState createState() => _viewProfilePageState();
}

class _viewProfilePageState extends State<viewProfilePage> {
  late Future<List<User>> futureUsers;
  late String authToken;
  late String storedUsername;
  late String storedEmail;

  @override
  void initState() {
    super.initState();
    _retrieveLoginData();
    futureUsers = User.fetchAllUsers(authToken);
  }

  // Method to retrieve stored login data
  _retrieveLoginData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    authToken = prefs.getString('authToken') ?? '';
    storedUsername = prefs.getString('username') ?? ''; // Retrieve stored username
    storedEmail = prefs.getString('email') ?? ''; // Retrieve stored email
    setState(() {}); // Update the UI after retrieving login data
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile Page',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.normal,
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
      body: FutureBuilder<List<User>>(
        future: futureUsers,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            // ignore: unused_local_variable
            User user = snapshot.data![0];
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    const SizedBox(height: 40),
                  itemProfile('Name', storedUsername, Icons.person),
                    const SizedBox(height: 10),
                    itemProfile('Email', storedEmail, Icons.email), // Display stored email
                    // Your existing code for displaying user profile data
                    // ...
                  ],
                ),
              ),
            );
          } else {
            return Center(child: Text('No data available'));
          }
        },
      ),
    );
  }

  Widget itemProfile(String title, String subtitle, IconData icon) {
  return Container(
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
              offset: Offset(0, 5),
              color: Color.fromARGB(255, 240, 221, 221),
              spreadRadius: 2,
              blurRadius: 10)
        ]),
    child: ListTile(
      title: Text(title),
      subtitle: TextFormField(
        initialValue: subtitle,
        readOnly: true,
        decoration: InputDecoration(
          border: InputBorder.none,
        ),
      ),
      leading: Icon(icon),
    ),
  );
}
}
