import 'dart:convert';
import 'dart:developer';

import 'package:flutter_application_1/models/usermodel.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class AuthService {
  Future<UserModel> getUserDetails() async {
    var url = Uri.parse('https://api.pexels.com/v1/search?query=people');
    var response = await http.get(url, headers: {
      "Authorization":
          "563492ad6f91700001000001218cf6c70eec418aa26d55c88409f759"
    });
    return UserModel.fromJson(json.decode(response.body));
  }
}
