import 'package:flutter/material.dart';
import 'package:soal_test/models/employee_model.dart';
import 'package:soal_test/theme.dart';

class DetailEmployee extends StatelessWidget {
  EmployeeModel? dataEmployee;
  DetailEmployee({super.key, this.dataEmployee});

  @override
  Widget build(BuildContext context) {
    textName() {
      return Text(
        'Name : ${dataEmployee!.name!}',
        style: blackTextStyle.copyWith(),
      );
    }

    textJob() {
      return Text(
        'Job : ${dataEmployee!.job!}',
        style: blackTextStyle.copyWith(),
      );
    }

    textId() {
      return Text(
        'Id : ${dataEmployee!.id!}',
        style: blackTextStyle.copyWith(),
      );
    }

    textCreatedAt() {
      return Text(
        'CreatedAt : ${dataEmployee!.createdAt!}',
        style: blackTextStyle.copyWith(),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  textName(),
                  textJob(),
                  textId(),
                  textCreatedAt(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
