import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soal_test/models/employee_model.dart';
import 'package:soal_test/theme.dart';
import 'package:soal_test/ui/pages/tab_view/detail_employee.dart';

class EmployeeCard extends StatelessWidget {
  EmployeeModel? data;
  EmployeeCard({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(
          DetailEmployee(
            dataEmployee: data,
          ),
        );
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Name : ${data!.name!}',
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                'Job : ${data!.job!}',
                style: greyTextStyle.copyWith(
                  fontSize: 14,
                  fontWeight: light,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                'Id : ${data!.id!}',
                style: greyTextStyle.copyWith(
                  fontSize: 14,
                  fontWeight: light,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                'CreatedAt : ${data!.createdAt!}',
                style: greyTextStyle.copyWith(
                  fontSize: 14,
                  fontWeight: light,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
