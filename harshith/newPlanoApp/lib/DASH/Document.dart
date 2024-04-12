import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Documentpage extends StatefulWidget {
  const Documentpage({Key? key}) : super(key: key);

  @override
  State<Documentpage> createState() => _DocumentpageState();
}

class _DocumentpageState extends State<Documentpage> {
  List<Map<String, String>> quotes = [];

  void _addPDF() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        quotes.add({"text": "PDF File", "author": "Unknown"});
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Documents',
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: _addPDF,
                child: Text(
                  'Add PDF',
                  style: TextStyle(
                    color: Colors.red.shade900,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: quotes.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(quotes[index]['text'] ?? ''),
                  subtitle: Text(quotes[index]['author'] ?? ''),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
