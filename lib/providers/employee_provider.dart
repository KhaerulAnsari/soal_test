import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:soal_test/models/employee_model.dart';
import 'package:soal_test/ui/pages/global.dart';

class EmployeeProvider extends ChangeNotifier {
  Future<EmployeeModel?> createEmploye(String name, String job) async {
    try {
      var body = {
        "name": name,
        "job": job,
      };

      var response = await http.post(
        Uri.parse('https://reqres.in/api/users'),
        body: body,
      );

      if (response.statusCode == 201) {
        listEmployee.add(EmployeeModel.fromJson(jsonDecode(response.body)));
        return EmployeeModel.fromJson(jsonDecode(response.body));
      }
    } catch (e) {
      print(e);
      return null;
    }
  }
}
