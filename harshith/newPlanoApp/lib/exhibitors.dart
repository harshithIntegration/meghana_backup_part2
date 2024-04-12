import 'package:flutter/material.dart';

class ExhibitorsPage extends StatefulWidget {
  @override
  _ExhibitorsPageState createState() => _ExhibitorsPageState();
}

class _ExhibitorsPageState extends State<ExhibitorsPage> {
  TextEditingController _searchController = TextEditingController();
  List<Map<String, String>> _filteredMembers = [];
  List<Map<String, String>> _allMembers = [
    {
      'name': 'John Doe',
      'designation': 'Chairperson',
      'imagePath': 'assets/johndoe.jpg',
    },
    {
      'name': 'Jane Smith',
      'designation': 'Vice Chairperson',
      'imagePath': 'assets/jane smith.jpg',
    },
    {
      'name': 'Michael Johnson',
      'designation': 'Secretary',
      'imagePath': 'assets/micheal johnson.jpg',
    },
    {
      'name': 'Emily Brown',
      'designation': 'Treasurer',
      'imagePath': 'assets/emilybrown.jpg',
    },
    {
      'name': 'Alice Johnson',
      'designation': 'Event Coordinator',
      'imagePath': 'assets/alice.jpg',
    },
    {
      'name': 'Bob Smith',
      'designation': 'Marketing Manager',
      'imagePath': 'assets/bobsmith.jpg',
    },
    {
      'name': 'Ella Davis',
      'designation': 'Public Relations Officer',
      'imagePath': 'assets/ella.jpg',
    },
    {
      'name': 'Jack Wilson',
      'designation': 'Finance Director',
      'imagePath': 'assets/jack.jpg',
    },
    {
      'name': 'Sophia Brown',
      'designation': 'Membership Secretary',
      'imagePath': 'assets/sophia.jpg',
    },
    {
      'name': 'William Taylor',
      'designation': 'Technical Lead',
      'imagePath': 'assets/william.jpg',
    },
    {
      'name': 'Sanketh Dani',
      'designation': 'Technical Lead',
      'imagePath': 'assets/sann.jfif',
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
        title: Text('Exhibitors'),
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
              height: 50,
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
