import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:soal_test/models/user_model.dart';
import 'package:http/http.dart' as http;

class GetUser extends ChangeNotifier {
  Future<List<UserModel>> getListUser() async {
    try {
      var response = await http.get(
        Uri.parse("https://reqres.in/api/users?page=2"),
      );

      if (response.statusCode == 200) {
        List<UserModel> userData = [];

        List parsedJson = (jsonDecode(response.body)['data']);

        parsedJson.forEach(
          (user) {
            userData.add(UserModel.fromJson(user));
          },
        );

        return userData;
      } else {
        return [];
      }
    } catch (e) {
      print(e);

      return [];
    }
  }
}
