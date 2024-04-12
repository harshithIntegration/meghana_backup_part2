import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Service {
  //create the method to save user

  Future<http.Response> saveUser(
      String userName,
      String userEmail,
      String userCountry,
      String userState,
      String userPhone,
       String userPassword,
      ) async {
    //create uri
    var uri = Uri.parse("http://13.200.173.137:4040/qp/userSignUp");

    //header
    Map<String, String> headers = {"Content-Type": "application/json"};
    //body
    Map data = {
      'userName': '$userName',
      'userEmail': '$userEmail',
      "userCountry": '$userCountry',
      "userState": '$userState',
      'userPhone': '$userPhone',
       "userPassword": '$userPassword',
    };
    //convert the above data into json
    var body = json.encode(data);
    print(body);
    var response = await http.post(uri, headers: headers, body: body);
    print("${response.body}");
    print(response);

    return response;
  }
}



