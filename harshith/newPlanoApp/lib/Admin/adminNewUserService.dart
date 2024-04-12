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
      String userCity,
      String userPassword,
      String userMobile,
      String userGender,
      String userPosition,
      String userDepartment,
      String userSubDepartment,
      String userAddress,
      String userPhotoLink) async {
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
      "userCity": '$userCity',
      "userPassword": '$userPassword',
      'userMobile': '$userMobile',
      "userGender": '$userGender',
      "userPosition": '$userPosition',
      "userDepartment": '$userDepartment',
      "userSubDepartment": '$userSubDepartment',
      "userAddress": '$userAddress',
      "userPhotoLink": '$userPhotoLink',
    };
    //convert the above data into json
    var body = json.encode(data);
    print("hi");
    print(body);
    var response = await http.post(uri, headers: headers, body: body);

    //print the response body
    print("${response.body}");

    return response;
  }
}
