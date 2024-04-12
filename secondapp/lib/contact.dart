// class Contact {
//   String name;
//   String contact;
//   Contact({required this.name, required this.contact});

//   factory Contact.fromJson(Map<String, dynamic> json) => Contact(
//         name: json["name"],
//         contact: json["contact"],
//     );
//     Map<String, dynamic> toJson() => {
//         "name": name,
//         "contact": contact,
//     };
// }




import 'dart:convert';

List<Contact> contactFromJson(String str) => List<Contact>.from(json.decode(str).map((x) => Contact.fromJson(x)));

String contactToJson(List<Contact> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Contact {
    String email;
    String password;

    Contact({
        required this.email,
        required this.password,
    });

    factory Contact.fromJson(Map<String, dynamic> json) => Contact(
        email: json["email"],
        password: json["password"],
    );

    Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
    };
}
