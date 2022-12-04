import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:soal_test/models/user_model.dart';
import 'package:soal_test/providers/get_user_provider.dart';
import 'package:soal_test/theme.dart';
import 'package:soal_test/ui/pages/create_employee_page.dart';
import 'package:soal_test/ui/widgets/log_out_dialog.dart';
import 'package:soal_test/ui/widgets/user_card.dart';

class ListUserPage extends StatelessWidget {
  const ListUserPage({super.key});

  @override
  Widget build(BuildContext context) {
    var getUser = Provider.of<GetUser>(context, listen: false);

    textHeader() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "List Users",
            style: blackTextStyle.copyWith(
              fontSize: 25,
              fontWeight: semiBold,
            ),
          ),
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (c) {
                  return const LogOutDialog();
                },
              );
            },
            icon: Icon(
              Icons.logout,
              color: orangeColor,
              size: 30,
            ),
          ),
        ],
      );
    }

    readDataUser() {
      return Expanded(
        child: FutureBuilder<List<UserModel>>(
          future: getUser.getListUser(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              int index = -1;

              return Column(
                children: snapshot.data!.map(
                  (category) {
                    index++;
                    return Container(
                      margin: EdgeInsets.only(
                        top: index == 0 ? 30 : 8,
                      ),
                      child: UserCard(
                        userData: category,
                      ),
                    );
                  },
                ).toList(),
              );
            }

            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      );
    }

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: blueColor,
        elevation: 0,
        onPressed: () {
          Get.to(const CreateEmployeePage());
        },
        child: const Icon(
          Icons.add,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
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
