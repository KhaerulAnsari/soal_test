import 'package:flutter/material.dart';
import 'package:soal_test/theme.dart';

class NullData extends StatelessWidget {
  String message;
  NullData({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.width * 0.5,
        ),
        Image.asset(
          'images/empty.png',
          width: 200,
          fit: BoxFit.cover,
        ),
        Text(
          message,
          style: greyTextStyle.copyWith(
            fontSize: 16,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
