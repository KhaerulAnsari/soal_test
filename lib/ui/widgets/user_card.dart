import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soal_test/models/user_model.dart';
import 'package:soal_test/theme.dart';
import 'package:soal_test/ui/pages/tab_view/detail_user.dart';

class UserCard extends StatelessWidget {
  UserModel? userData;
  UserCard({super.key, this.userData});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(
          DetailUser(
            userData: userData,
          ),
        );
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              SizedBox(
                width: 80,
                height: 80,
                child: Hero(
                  tag: userData!.avatar!,
                  child: CircleAvatar(
                    backgroundColor: Colors.grey,
                    backgroundImage: NetworkImage(
                      userData!.avatar!,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userData!.firstName! + ' ' + userData!.lastName!,
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: medium,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    userData!.email!,
                    style: greyTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: light,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
