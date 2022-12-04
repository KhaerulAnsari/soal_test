import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:soal_test/providers/auth_provider.dart';
import 'package:soal_test/providers/employee_provider.dart';
import 'package:soal_test/providers/get_user_provider.dart';
import 'package:soal_test/providers/user_provider.dart';
import 'package:soal_test/ui/pages/global.dart';
import 'package:soal_test/ui/pages/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  sharedPreferences = await SharedPreferences.getInstance();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider<UserProvider>(
          create: (context) => UserProvider(),
        ),
        ChangeNotifierProvider<EmployeeProvider>(
          create: (context) => EmployeeProvider(),
        ),
        ChangeNotifierProvider<GetUser>(
          create: (context) => GetUser(),
        ),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
