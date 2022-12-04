import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:soal_test/models/user_model.dart';
import 'package:soal_test/providers/auth_provider.dart';
import 'package:soal_test/providers/user_provider.dart';
import 'package:soal_test/theme.dart';
import 'package:soal_test/ui/pages/global.dart';
import 'package:soal_test/ui/pages/tab_page.dart';
import 'package:soal_test/ui/widgets/custom_button.dart';
import 'package:soal_test/ui/widgets/custom_textfield.dart';
import 'package:soal_test/ui/widgets/snackbar_box.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
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

    textAndButton() {
      return Row(
        children: [
          GestureDetector(
            onTap: () {
              Get.back();
            },
            child: const Icon(
              Icons.arrow_back,
              size: 30,
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            'Register',
            style: blackTextStyle.copyWith(
              fontSize: 25,
              fontWeight: semiBold,
            ),
          ),
        ],
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

    formName() {
      return CustomTextField(
        title: 'Name',
        hintText: 'Type your name...',
        textEditingController: nameController,
      );
    }

    formPhone() {
      return CustomTextField(
        title: 'Phone',
        hintText: 'Type your phone...',
        textEditingController: phoneController,
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
      if (nameController.text.isEmpty ||
          phoneController.text.isEmpty ||
          emailController.text.isEmpty ||
          passwordController.text.isEmpty) {
        return snackbarBox('form cannot be empty');
      } else {
        setState(() {
          isLoading = true;
        });

        UserModel? user = await authProvider.register(
          nameController.text,
          phoneController.text,
          emailController.text,
          passwordController.text,
        );

        setState(() {
          isLoading = false;
        });

        if (user == null) {
          snackbarBox("Periksa email atau password anda.");
        } else {
          userProvider.user = user;
          sharedPreferences!.setString('id', userProvider.user.id.toString());
          Get.offAll(TabPage());
        }
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
                title: 'Sign Up Now',
                onPressed: () {
                  formValidation();
                },
              ),
            );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              textAndButton(),
              imgIllustration(),
              const SizedBox(
                height: 20,
              ),
              formName(),
              const SizedBox(
                height: 20,
              ),
              formPhone(),
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
            ],
          ),
        ),
      ),
    );
  }
}
