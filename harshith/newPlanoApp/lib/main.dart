import 'package:flutter/material.dart';
import 'package:ono/DASH/dashboard.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
// import 'package:ono/saveimage/imageprofile.dart';


void main() async{
   WidgetsFlutterBinding.ensureInitialized();
   OneSignal.shared.setLogLevel(OSLogLevel.verbose,OSLogLevel.none);
await  OneSignal.shared.setAppId("2d219663-4659-49fa-818e-f69424257b90");
await  OneSignal.shared.promptUserForPushNotificationPermission().then((accepted){
    print("Accepted permission: $accepted");
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: dashboard(),
// home:NewUser1(),
    );
  }
}








// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:image_picker/image_picker.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Image Upload Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const ImageUploadPage(),
//     );
//   }
// }

// class ImageUploadPage extends StatefulWidget {
//   const ImageUploadPage({Key? key}) : super(key: key);

//   @override
//   State<ImageUploadPage> createState() => _ImageUploadPageState();
// }

// class _ImageUploadPageState extends State<ImageUploadPage> {
//   File? _imageFile;
//   final ImagePicker _picker = ImagePicker();

//   Future<void> _pickImage() async {
//     final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
//     if (pickedFile != null) {
//       setState(() {
//         _imageFile = File(pickedFile.path);
//       });
//     }
//   }

//   Future<void> _uploadImage() async {
//     if (_imageFile == null) {
//       return;
//     }

//     // Replace the URL with your backend server URL
//     final url = Uri.parse('http://192.168.175.94:4040/qp/image');
//     try {
//       var request = http.MultipartRequest('POST', url);
//       request.files.add(await http.MultipartFile.fromPath('file', _imageFile!.path));
//       var response = await request.send();
//       if (response.statusCode == 200) {
//         print('Image uploaded successfully');
//       } else {
//         print('Failed to upload image: ${response.reasonPhrase}');
//       }
//     } catch (e) {
//       print('Failed to upload image: $e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Image Upload'),
//       ),
//       body: SingleChildScrollView(
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               _imageFile != null
//                   ? Image.file(_imageFile!)
//                   : const Icon(Icons.image, size: 100),
//               ElevatedButton(
//                 onPressed: _pickImage,
//                 child: const Text('Pick Image'),
//               ),
//               ElevatedButton(
//                 onPressed: _uploadImage,
//                 child: const Text('Upload Image'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }





// import 'package:flutter/material.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:path/path.dart' as path;
// import 'package:flutter_pdfview/flutter_pdfview.dart';

// class Documentpage extends StatefulWidget {
//   const Documentpage({Key? key}) : super(key: key);

//   @override
//   State<Documentpage> createState() => _DocumentpageState();
// }

// class _DocumentpageState extends State<Documentpage> {
//   List<String> pdfPaths = [];

//   Future<void> _addPDF() async {
//     try {
//       FilePickerResult? result = await FilePicker.platform.pickFiles(
//         type: FileType.custom,
//         allowedExtensions: ['pdf'],
//       );

//       if (result != null && result.files.isNotEmpty) {
//         setState(() {
//           pdfPaths.add(result.files.first.path!);
//         });
//       }
//     } catch (e) {
//       print("Error picking PDF: $e");
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Documents',
//           style: TextStyle(
//             color: Colors.white,
//           ),
//         ),
//         centerTitle: true,
//         backgroundColor: Colors.red.shade900,
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back),
//           color: Colors.white,
//           onPressed: () {
//             Navigator.of(context).pop();
//           },
//         ),
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Expanded(
//             child: Align(
//               alignment: Alignment.center,
//               child: ElevatedButton(
//                 onPressed: _addPDF,
//                 child: Text(
//                   'Add PDF',
//                   style: TextStyle(
//                     color: Colors.red.shade900,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           Expanded(
//             child: ListView.builder(
//               itemCount: pdfPaths.length,
//               itemBuilder: (BuildContext context, int index) {
//                 return ListTile(
//                   title: Text(path.basename(pdfPaths[index])),
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => PDFScreen(filePath: pdfPaths[index]),
//                       ),
//                     );
//                   },
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class PDFScreen extends StatelessWidget {
//   final String filePath;

//   const PDFScreen({required this.filePath});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'PDF Viewer',
//           style: TextStyle(
//             color: Colors.white,
//           ),
//         ),
//         backgroundColor: Colors.red.shade900,
//         foregroundColor: Colors.white,
//         centerTitle: true,
//       ),
//       body: PDFView(
//         filePath: filePath,

//       ),
//     );
//   }
// }

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'File Upload Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const Documentpage(),
//     );
//   }
// }















// import 'package:flutter/material.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:path/path.dart' as path;
// import 'package:flutter_pdfview/flutter_pdfview.dart';
// import 'dart:io';
// import 'package:open_file/open_file.dart';
// import 'package:http/http.dart' as http;

// class Documentpage extends StatefulWidget {
//   const Documentpage({Key? key}) : super(key: key);

//   @override
//   State<Documentpage> createState() => _DocumentpageState();
// }

// class _DocumentpageState extends State<Documentpage> {
//   List<String> filePaths = [];

//   Future<void> _addFiles() async {
//     try {
//       FilePickerResult? result = await FilePicker.platform.pickFiles(
//         allowMultiple: true, // Allow selecting multiple files
//       );

//       if (result != null && result.files.isNotEmpty) {
//         setState(() {
//           filePaths.addAll(result.files.map((file) => file.path!));
//         });
//       }
//     } catch (e) {
//       print("Error picking files: $e");
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Documents',
//           style: TextStyle(
//             color: Colors.white,
//           ),
//         ),
//         centerTitle: true,
//         backgroundColor: Colors.red.shade900,
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back),
//           color: Colors.white,
//           onPressed: () {
//             Navigator.of(context).pop();
//           },
//         ),
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Expanded(
//             child: Align(
//               alignment: Alignment.center,
//               child: ElevatedButton(
//                 onPressed: _addFiles,
//                 child: Text(
//                   'Add Files',
//                   style: TextStyle(
//                     color: Colors.red.shade900,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           Expanded(
//             child: ListView.builder(
//               itemCount: filePaths.length,
//               itemBuilder: (BuildContext context, int index) {
//                 return ListTile(
//                   title: Text(path.basename(filePaths[index])),
//                   onTap: () {
//                     _openFile(context, filePaths[index]);
//                   },
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   void _openFile(BuildContext context, String filePath) {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => FileViewer(filePath: filePath),
//       ),
//     );
//   }
// }

// class FileViewer extends StatelessWidget {
//   final String filePath;

//   const FileViewer({required this.filePath});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'File Viewer',
//           style: TextStyle(
//             color: Colors.white,
//           ),
//         ),
//         backgroundColor: Colors.red.shade900,
//         foregroundColor: Colors.white,
//         centerTitle: true,
//       ),
//       body: _buildFileViewer(context),
//     );
//   }

//   Widget _buildFileViewer(BuildContext context) {
//     if (filePath.toLowerCase().endsWith('.pdf')) {
//       // Display PDF file using PDFView widget
//       return PDFView(filePath: filePath);
//     } else if (filePath.toLowerCase().endsWith('.doc') ||
//         filePath.toLowerCase().endsWith('.docx') ||
//         filePath.toLowerCase().endsWith('.xlsx')) {
//       // Open document file using open_file package
//       OpenFile.open(filePath);
//       return Container(); // Return an empty container as the document will be opened externally
//     } else if (filePath.toLowerCase().endsWith('.jpg') ||
//         filePath.toLowerCase().endsWith('.jpeg') ||
//         filePath.toLowerCase().endsWith('.png')) {
//       // Display image file
//       return Image.file(File(filePath));
//     } else {
//       // Unsupported file type
//       return Center(
//         child: Text(
//           'Unsupported file type',
//           style: TextStyle(fontSize: 18.0),
//         ),
//       );
//     }
//   }
// }


// Future<void> uploadFile(String filePath) async {
//   try {
//     var url = Uri.parse('http://192.168.175.94:9090/file/upload');
//     var request = http.MultipartRequest('POST', url)
//       ..files.add(await http.MultipartFile.fromPath('file', filePath));
//     var response = await request.send();
//     print(response);
//     if (response.statusCode == 200) {
//       print('File uploaded successfully');
//     } else {
//       print('Failed to upload file: ${response.reasonPhrase}');
//     }
//   } catch (e) {
//     print('Error uploading file: $e');
//   }
// }


// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'File Upload Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const Documentpage(),
//     );
//   }
// }








// import 'package:flutter/material.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:path/path.dart' as path;
// import 'package:flutter_pdfview/flutter_pdfview.dart';
// import 'dart:io';
// import 'package:open_file/open_file.dart';
// import 'package:http/http.dart' as http;

// class Documentpage extends StatefulWidget {
//   const Documentpage({Key? key}) : super(key: key);

//   @override
//   State<Documentpage> createState() => _DocumentpageState();
// }

// class _DocumentpageState extends State<Documentpage> {
//   List<String> filePaths = [];

//   Future<void> _addFiles() async {
//     try {
//       FilePickerResult? result = await FilePicker.platform.pickFiles(
//         allowMultiple: true, // Allow selecting multiple files
//       );

//       if (result != null && result.files.isNotEmpty) {
//         setState(() {
//           filePaths.addAll(result.files.map((file) => file.path!));
//         });
//       }
//     } catch (e) {
//       print("Error picking files: $e");
//     }
//   }

//   void _saveFiles() {
//     for (String filePath in filePaths) {
//       uploadFile(filePath);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Documents',
//           style: TextStyle(
//             color: Colors.white,
//           ),
//         ),
//         centerTitle: true,
//         backgroundColor: Colors.red.shade900,
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back),
//           color: Colors.white,
//           onPressed: () {
//             Navigator.of(context).pop();
//           },
//         ),
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Expanded(
//             child: Align(
//               alignment: Alignment.center,
//               child: ElevatedButton(
//                 onPressed: _addFiles,
//                 child: Text(
//                   'Add Files',
//                   style: TextStyle(
//                     color: Colors.red.shade900,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           Expanded(
//             child: ListView.builder(
//               itemCount: filePaths.length,
//               itemBuilder: (BuildContext context, int index) {
//                 return ListTile(
//                   title: Text(path.basename(filePaths[index])),
//                   onTap: () {
//                     _openFile(context, filePaths[index]);
//                   },
//                 );
//               },
//             ),
//           ),
//           ElevatedButton(
//             onPressed: _saveFiles,
//             child: Text('Save'),
//           ),
//         ],
//       ),
//     );
//   }

//   void _openFile(BuildContext context, String filePath) {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => FileViewer(filePath: filePath),
//       ),
//     );
//   }
// }

// class FileViewer extends StatelessWidget {
//   final String filePath;

//   const FileViewer({required this.filePath});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'File Viewer',
//           style: TextStyle(
//             color: Colors.white,
//           ),
//         ),
//         backgroundColor: Colors.red.shade900,
//         foregroundColor: Colors.white,
//         centerTitle: true,
//       ),
//       body: _buildFileViewer(context),
//     );
//   }

//   Widget _buildFileViewer(BuildContext context) {
//     if (filePath.toLowerCase().endsWith('.pdf')) {
//       // Display PDF file using PDFView widget
//       return PDFView(filePath: filePath);
//     } else if (filePath.toLowerCase().endsWith('.doc') ||
//         filePath.toLowerCase().endsWith('.docx') ||
//         filePath.toLowerCase().endsWith('.xlsx')) {
//       // Open document file using open_file package
//       OpenFile.open(filePath);
//       return Container(); // Return an empty container as the document will be opened externally
//     } else if (filePath.toLowerCase().endsWith('.jpg') ||
//         filePath.toLowerCase().endsWith('.jpeg') ||
//         filePath.toLowerCase().endsWith('.png')) {
//       // Display image file
//       return Image.file(File(filePath));
//     } else {
//       // Unsupported file type
//       return Center(
//         child: Text(
//           'Unsupported file type',
//           style: TextStyle(fontSize: 18.0),
//         ),
//       );
//     }
//   }
// }

// Future<void> uploadFile(String filePath) async {
//   try {
//     var url = Uri.parse('http://192.168.175.94:9090/file/upload');
//     var request = http.MultipartRequest('POST', url)
//       ..files.add(await http.MultipartFile.fromPath('file', filePath));
//     var response = await request.send();
//     if (response.statusCode == 200) {
//       print('File uploaded successfully');
//     } else {
//       print('Failed to upload file: ${response.reasonPhrase}');
//     }
//   } catch (e) {
//     print('Error uploading file: $e');
//   }
// }

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'File Upload Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const Documentpage(),
//     );
//   }
// }
