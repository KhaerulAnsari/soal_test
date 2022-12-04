import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soal_test/theme.dart';
import 'package:soal_test/ui/widgets/custom_button.dart';

class InfoDIalog extends StatelessWidget {
  String? name;
  String? job;
  String? id;
  String? createdAt;
  InfoDIalog({super.key, this.name, this.job, this.id, this.createdAt});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Text(
                'Berhasil mengirim data ke server',
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              'Name : ' + name!,
              style: greyTextStyle.copyWith(),
            ),
            const SizedBox(
              height: 3,
            ),
            Text(
              'Job : ' + job!,
              style: greyTextStyle.copyWith(),
            ),
            const SizedBox(
              height: 3,
            ),
            Text(
              'id : ' + id!,
              style: greyTextStyle.copyWith(),
            ),
            const SizedBox(
              height: 3,
            ),
            Text(
              'CreatedAt : ' + createdAt!,
              style: greyTextStyle.copyWith(),
            ),
            const SizedBox(
              height: 15,
            ),
            Center(
              child: SizedBox(
                height: 45,
                width: double.infinity,
                child: CustomButton(
                  title: 'Ok',
                  onPressed: () {
                    Get.back();
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
