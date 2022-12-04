import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soal_test/theme.dart';
import 'package:soal_test/ui/pages/global.dart';
import 'package:soal_test/ui/pages/sing_in_page.dart';
import 'package:soal_test/ui/widgets/custom_button.dart';

class LogOutDialog extends StatelessWidget {
  const LogOutDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetAnimationDuration: Duration(milliseconds: 2000),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Text(
                'Anda yakin ingin keluar dari aplikasi?',
                style: blackTextStyle.copyWith(
                  fontSize: 18,
                  fontWeight: medium,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: SizedBox(
                height: 45,
                width: double.infinity,
                child: CustomButton(
                  title: 'Ya',
                  onPressed: () {
                    sharedPreferences!.remove('id');
                    Get.offAll(SignInPage());
                  },
                ),
              ),
            ),
            Center(
              child: TextButton(
                onPressed: () {
                  Get.back();
                },
                child: Text(
                  'Batal',
                  style: textStyle.copyWith(
                    color: orangeColor,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
