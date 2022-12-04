import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:soal_test/models/employee_model.dart';
import 'package:soal_test/providers/employee_provider.dart';
import 'package:soal_test/theme.dart';
import 'package:soal_test/ui/pages/global.dart';
import 'package:soal_test/ui/widgets/custom_button.dart';
import 'package:soal_test/ui/widgets/custom_textfield.dart';
import 'package:soal_test/ui/widgets/info_dialog.dart';

class CreateEmployeePage extends StatefulWidget {
  const CreateEmployeePage({super.key});

  @override
  State<CreateEmployeePage> createState() => _CreateEmployeePageState();
}

class _CreateEmployeePageState extends State<CreateEmployeePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController jobController = TextEditingController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    var employeeProvider =
        Provider.of<EmployeeProvider>(context, listen: false);

    textHeader() {
      return Text(
        "Create Employee",
        style: blackTextStyle.copyWith(
          fontSize: 25,
          fontWeight: semiBold,
        ),
        textAlign: TextAlign.center,
      );
    }

    formName() {
      return CustomTextField(
        title: 'Name',
        hintText: 'Type name employee...',
        textEditingController: nameController,
      );
    }

    formJob() {
      return CustomTextField(
        title: 'Job',
        hintText: 'Type  job employee...',
        textEditingController: jobController,
      );
    }

    button() {
      return isLoading
          ? Center(
              child: CircularProgressIndicator(
                color: blueColor,
              ),
            )
          : SizedBox(
              height: 45,
              width: double.infinity,
              child: CustomButton(
                title: 'Create Employe',
                onPressed: () async {
                  setState(() {
                    isLoading = true;
                  });

                  EmployeeModel? newEmploye =
                      await employeeProvider.createEmploye(
                    nameController.text,
                    jobController.text,
                  );

                  employeeModel = newEmploye;

                  Get.back();

                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (c) {
                      return InfoDIalog(
                        name: employeeModel!.name,
                        job: employeeModel!.job,
                        id: employeeModel!.id,
                        createdAt: employeeModel!.createdAt,
                      );
                    },
                  );
                },
              ),
            );
    }

    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: defaultMargin,
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              textHeader(),
              formName(),
              const SizedBox(
                height: 20,
              ),
              formJob(),
              const SizedBox(
                height: 40,
              ),
              button(),
            ],
          ),
        ),
      ),
    );
  }
}
