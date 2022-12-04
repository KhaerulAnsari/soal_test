import 'package:flutter/material.dart';
import 'package:soal_test/models/user_model.dart';
import 'package:soal_test/theme.dart';

class DetailUser extends StatelessWidget {
  UserModel? userData;

  DetailUser({super.key, this.userData});

  @override
  Widget build(BuildContext context) {
    textHeader() {
      return Text(
        "Detail User",
        style: blackTextStyle.copyWith(
          fontSize: 25,
          fontWeight: semiBold,
        ),
        textAlign: TextAlign.center,
      );
    }

    imgProvile() {
      return SizedBox(
        width: 200,
        height: 200,
        child: Hero(
          tag: userData!.avatar!,
          child: CircleAvatar(
            backgroundColor: greyColor,
            backgroundImage: NetworkImage(
              userData!.avatar!,
            ),
          ),
        ),
      );
    }

    textName() {
      return Text(
        userData!.firstName! + ' ' + userData!.lastName!,
        style: blackTextStyle.copyWith(
          fontSize: 28,
          fontWeight: medium,
        ),
      );
    }

    textEmail() {
      return Text(
        userData!.email!,
        style: greyTextStyle.copyWith(
          fontSize: 18,
          fontWeight: light,
        ),
      );
    }

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              textHeader(),
              imgProvile(),
              const SizedBox(
                height: 15,
              ),
              textName(),
              const SizedBox(
                height: 2,
              ),
              textEmail(),
            ],
          ),
        ),
      ),
    );
  }
}
