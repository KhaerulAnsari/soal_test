import 'package:flutter/material.dart';
import 'package:soal_test/theme.dart';
import 'package:soal_test/ui/pages/global.dart';
import 'package:soal_test/ui/widgets/employee_card.dart';
import 'package:soal_test/ui/widgets/null_data.dart';

class ListEmployeePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    textHeader() {
      return Text(
        "Welcome in List Employee",
        style: blackTextStyle.copyWith(
          fontSize: 25,
          fontWeight: semiBold,
        ),
        textAlign: TextAlign.center,
      );
    }

    readDataUser() {
      return listEmployee.length != 0
          ? Expanded(
              child: ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: listEmployee.length,
                itemBuilder: (context, index) {
                  return EmployeeCard(
                    data: listEmployee[index],
                  );
                },
              ),
            )
          : NullData(
              message:
                  'Data belum ditambahkan,\nSilahkan tambahkan di page sebelumnya.',
            );
    }

    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(
                height: 25,
              ),
              textHeader(),
              readDataUser(),
            ],
          ),
        ),
      ),
    );
  }
}
