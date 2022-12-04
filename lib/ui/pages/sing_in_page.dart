import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:soal_test/models/user_model.dart';
import 'package:soal_test/providers/auth_provider.dart';
import 'package:soal_test/providers/user_provider.dart';
import 'package:soal_test/theme.dart';
import 'package:soal_test/ui/pages/global.dart';
import 'package:soal_test/ui/pages/tab_page.dart';
import 'package:soal_test/ui/pages/sing_up_page.dart';
import 'package:soal_test/ui/widgets/custom_button.dart';
import 'package:soal_test/ui/widgets/custom_textfield.dart';
import 'package:soal_test/ui/widgets/snackbar_box.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool _isVisiblePassword = false;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    var authProvider = Provider.of<AuthProvider>(context, listen: false);
    var userProvider = Provider.of<UserProvider>(context, listen: false);

    textLogin() {
      return Text(
        'Login',
        style: blackTextStyle.copyWith(
          fontSize: 25,
          fontWeight: semiBold,
        ),
      );
    }

    imgIllustration() {
      return Center(
        child: Image.asset(
          'images/register.png',
          width: 200,
        ),
      );
    }

    formEmail() {
      return CustomTextField(
        title: 'Email',
        hintText: 'Type your email...',
        textEditingController: emailController,
      );
    }

    formPassword() {
      return CustomTextField(
        title: 'Password',
        hintText: 'Type your password...',
        textEditingController: passwordController,
        obscureText: !_isVisiblePassword,
        widget: IconButton(
          onPressed: () {
            setState(
              () {
                _isVisiblePassword = !_isVisiblePassword;
              },
            );
          },
          icon: _isVisiblePassword
              ? Icon(
                  Icons.visibility,
                  color: blueColor,
                )
              : Icon(
                  Icons.visibility_off,
                  color: greyColor,
                ),
        ),
      );
    }

    formValidation() async {
      if (emailController.text.isEmpty || passwordController.text.isEmpty) {
        return snackbarBox('form cannot be empty');
      } else {
        setState(() {
          isLoading = true;
        });

        UserModel? user = await authProvider.login(
          emailController.text,
          passwordController.text,
        );

        setState(() {
          isLoading = false;
        });

        userProvider.user = user!;
        sharedPreferences!.getString('id') ??
            sharedPreferences!.setString('id', 4.toString());
        Get.offAll(TabPage());
      }
    }

    buttonSignUp() {
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
                title: 'Sign In Now',
                onPressed: () {
                  formValidation();
                },
              ),
            );
    }

    signUpButton() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Don't have account? ",
            style: greyTextStyle.copyWith(),
          ),
          GestureDetector(
            onTap: () {
              Get.to(SignUpPage());
            },
            child: Text(
              'Register Now',
              style: textStyle.copyWith(
                color: blueColor,
                fontWeight: semiBold,
              ),
            ),
          ),
        ],
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 50,
            ),
            textLogin(),
            imgIllustration(),
            const SizedBox(
              height: 20,
            ),
            formEmail(),
            const SizedBox(
              height: 20,
            ),
            formPassword(),
            const SizedBox(
              height: 50,
            ),
            buttonSignUp(),
            const SizedBox(
              height: 10,
            ),
            signUpButton(),
          ],
        ),
      ),
    );
  }
}
