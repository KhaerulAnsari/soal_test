import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soal_test/theme.dart';

snackbarBox(String message) {
  return Get.snackbar(
    '',
    '',
    backgroundColor: const Color(0xFFFF5C83),
    icon: GestureDetector(
        onTap: () {
          Get.back();
        },
        child: const Icon(
          Icons.close,
        )),
    titleText: Text(
      'Kesalahan!',
      style: textStyle.copyWith(
        fontWeight: semiBold,
        fontSize: 16,
        color: whiteColor,
      ),
    ),
    messageText: Text(
      message,
      style: textStyle.copyWith(
        fontWeight: light,
        color: const Color(0xFFDCDADA),
      ),
    ),
  );
}
