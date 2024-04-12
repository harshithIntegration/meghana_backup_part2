import 'package:flutter/material.dart';

class Committee1Page extends StatefulWidget {
  @override
  _Committee1PageState createState() => _Committee1PageState();
}

class _Committee1PageState extends State<Committee1Page> {
  TextEditingController _searchController = TextEditingController();
  List<Map<String, String>> _filteredMembers = [];
  List<Map<String, String>> _allMembers = [
    {
      'name': 'Harshith G S',
      'designation': 'Devops engineer',
      'imagePath': 'assets/harshith.jpeg',
    },
    {
      'name': 'saikumar p gaddi',
      'designation': 'Fullstack developer',
      'imagePath': 'assets/sai.jpeg',
    },
    {
      'name': 'Meghana Shrikanth',
      'designation': 'Android developer',
      'imagePath': 'assets/meghana.jpg',
    },
    {
      'name': 'Nisarga K N',
      'designation': 'Android developer',
      'imagePath': 'assets/meghana.jpg',
    },
    {
      'name': 'sanket dani',
      'designation': 'Android developer',
      'imagePath': 'assets/sann.jfif',
    },
    {
  'name': 'mamata',
  'designation': 'Fullstack developer',
  'imagePath': 'assets/moms.jpeg',
},
{
  'name': 'shadman',
  'designation': 'React developer',
  'imagePath': 'assets/shadman.jpeg',
},
{
  'name': 'Faizan',
  'designation': 'React developer',
  'imagePath': 'assets/faizan1.jpeg',
},

  ];

  @override
  void initState() {
    _filteredMembers.addAll(_allMembers);
    super.initState();
  }

  void _filterMembers(String query) {
    setState(() {
      _filteredMembers = _allMembers
          .where((member) =>
              member['name']!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Committee'),
        centerTitle: true,
        backgroundColor: Colors.red.shade900,
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: SizedBox(
              height: 50, // Set the desired height here
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Search members...',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  filled: true,
                  fillColor: Colors.grey[100],
                ),
                onChanged: _filterMembers,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredMembers.length,
              itemBuilder: (context, index) {
                return _buildMember(_filteredMembers[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMember(Map<String, String> member) {
    String name = member['name']!;
    String designation = member['designation']!;
    String imagePath = member['imagePath']!;
    return ListTile(
      leading: CircleAvatar(
        radius: 25,
        backgroundImage: AssetImage(imagePath),
      ),
      title: Text(
        name,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        designation,
        style: TextStyle(
          fontSize: 16,
          fontStyle: FontStyle.italic,
        ),
      ),
    );
  }
}
