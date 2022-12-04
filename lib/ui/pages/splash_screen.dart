import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soal_test/theme.dart';
import 'package:soal_test/ui/pages/global.dart';
import 'package:soal_test/ui/pages/tab_page.dart';
import 'package:soal_test/ui/pages/tab_view/list_employee_page.dart';
import 'package:soal_test/ui/pages/sing_in_page.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  starTimer() {
    Timer(
      const Duration(seconds: 2),
      () {
        if (sharedPreferences!.getString('id') == null) {
          Get.off(SignInPage());
        } else {
          Get.off(TabPage());
        }
      },
    );
  }

  @override
  void initState() {
    starTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    imgIllustration() {
      return Center(
        child: Image.asset(
          'images/splash.png',
          fit: BoxFit.cover,
          width: 200,
        ),
      );
    }

    textTitle() {
      return Text(
        'Test App',
        style: textStyle.copyWith(
          fontSize: 28,
          fontWeight: semiBold,
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            imgIllustration(),
            const SizedBox(
              height: 25,
            ),
            textTitle(),
          ],
        ),
      ),
    );
  }
}
