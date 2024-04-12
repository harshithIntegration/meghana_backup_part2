import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ChangePic extends StatefulWidget {
  const ChangePic({Key? key}) : super(key: key);

  @override
  State<ChangePic> createState() => _ChangePicState();
}

class _ChangePicState extends State<ChangePic> {
  Map<String, Uint8List?> _profileImages = {};
  Map<String, TextEditingController> _nameControllers = {};
  Map<String, TextEditingController> _designationControllers = {};
  Map<String, TextEditingController> _infoControllers = {};

  @override
  void dispose() {
    _nameControllers.values.forEach((controller) => controller.dispose());
    _designationControllers.values.forEach((controller) => controller.dispose());
    _infoControllers.values.forEach((controller) => controller.dispose());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100.0),
        child: AppBar(
          toolbarHeight: 100.0,
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
          title: Row(
            children: [
              GestureDetector(
                onTap: () {
                  _selectProfileImage('p');
                },
                child: Container(
                  width: 100,
                  height: 100,
                  child: _profileImages['p'] != null
                      ? Image.memory(
                          _profileImages['p']!,
                          fit: BoxFit.cover,
                        )
                      : Image.asset(
                          'assets/p.jpeg',
                          fit: BoxFit.contain,
                        ),
                ),
              ),
              const SizedBox(width: 2), // Add some space between the image and text
             const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Planotech',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Group of Companies',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            Center(
              child: _buildProfile(
                'sir',
                'assets/sir.jpg',
                _nameControllers['sir']?.text ?? '',
                _designationControllers['sir']?.text ?? '',
                _infoControllers['sir']?.text ?? '',
              ),
            ),
            const SizedBox(height: 50), // Add some space between containers
            Center(
              child: _buildProfile(
                'nir',
                'assets/nir.jpg',
                _nameControllers['nir']?.text ?? '',
                _designationControllers['nir']?.text ?? '',
                _infoControllers['nir']?.text ?? '',
              ),
            ),
            const SizedBox(height: 50), // Add some space between containers
            Center(
              child: _buildProfile(
                'sann',
                'assets/sann.jfif',
                _nameControllers['sann']?.text ?? '',
                _designationControllers['sann']?.text ?? '',
                _infoControllers['sann']?.text ?? '',
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfile(
    String key,
    String defaultImagePath,
    String name,
    String designation,
    String info,
  ) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            _selectProfileImage(key);
          },
          child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: _profileImages[key] != null
                  ? Image.memory(
                      _profileImages[key]!,
                      fit: BoxFit.cover,
                      width: 120,
                      height: 120,
                    )
                  : Image.asset(
                      defaultImagePath,
                      fit: BoxFit.cover,
                      width: 120,
                      height: 120,
                    ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Container(
          width: 200, // Set the width as per your requirement
          child: TextField(
            controller: _getNameController(key),
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            decoration: const InputDecoration(
              hintText: 'Name',
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
              border: InputBorder.none,
            ),
            maxLines: null, // Allow multiline input
          ),
        ),
        Container(
          width: 250, // Set the width as per your requirement
          child: TextField(
            controller: _getDesignationController(key),
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            decoration: const InputDecoration(
              hintText: 'Designation',
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
              border: InputBorder.none,
            ),
            maxLines: null, // Allow multiline input
          ),
        ),
        Container(
          width: 250, // Set the width as per your requirement
          child: TextField(
            controller: _getInfoController(key),
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
            decoration: const InputDecoration(
              hintText: 'Info',
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
              border: InputBorder.none,
            ),
            maxLines: null, // Allow multiline input
          ),
        ),
      ],
    );
  }

  TextEditingController _getNameController(String key) {
    if (!_nameControllers.containsKey(key)) {
      _nameControllers[key] = TextEditingController();
    }
    return _nameControllers[key]!;
  }

  TextEditingController _getDesignationController(String key) {
    if (!_designationControllers.containsKey(key)) {
      _designationControllers[key] = TextEditingController();
    }
    return _designationControllers[key]!;
  }

  TextEditingController _getInfoController(String key) {
    if (!_infoControllers.containsKey(key)) {
      _infoControllers[key] = TextEditingController();
    }
    return _infoControllers[key]!;
  }

  Future<void> _selectProfileImage(String key) async {
    final ImagePicker _imagePicker = ImagePicker();
    final XFile? image = await _imagePicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _profileImages[key] = File(image.path).readAsBytesSync();
      });
    } else {
      print('No image selected');
    }
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ChangePic(),
  ));
}
