import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:soal_test/models/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:soal_test/ui/widgets/snackbar_box.dart';

class AuthProvider extends ChangeNotifier {
  Future<UserModel?> register(
      String name, String phone, String email, String password) async {
    try {
      var body = {
        'email': email,
        'password': password,
      };

      var response = await http.post(
        Uri.parse('https://reqres.in/api/register'),
        body: body,
      );
      if (response.statusCode == 200) {
        return UserModel.fromJson(jsonDecode(response.body));
      } else if (response.statusCode == 400) {
        snackbarBox("Only defined users succeed registration");
      } else {
        return null;
      }
    } catch (e) {
      snackbarBox(e.toString());
      return null;
    }
  }

  Future<UserModel?> login(String email, String password) async {
    try {
      var body = {
        'email': email,
        'password': password,
      };

      var response = await http.post(
        Uri.parse(
          'https://reqres.in/api/login',
        ),
        body: body,
      );

      if (response.statusCode == 200) {
        return UserModel.fromJson(
          jsonDecode(response.body),
        );
      } else if (response.statusCode == 400) {
        return snackbarBox("User not found");
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }
}
