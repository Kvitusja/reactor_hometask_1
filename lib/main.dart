import 'dart:async';
import 'package:flutter/material.dart';
import 'package:home_task_1/greeting_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login_widget.dart';

void main() {
  runApp(const MyApp());
}

String userName = '';
String password = '';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MySplashWidget(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MySplashWidget extends StatefulWidget {
  const MySplashWidget({Key? key}) : super(key: key);

  @override
  State<MySplashWidget> createState() => _MySplashWidgetState();
}

class _MySplashWidgetState extends State<MySplashWidget> {
  @override
  void initState() {
    validateLoginDate().whenComplete(() async {
      Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) {
              if (userName == '' && password == '') {
                return const LoginWidget();
              }
              return const GreetingWidget();
            },
          ),
        ),
      );
    });
    super.initState();
  }

  Future<void> validateLoginDate() async {
    final SharedPreferences myPreferences =
        await SharedPreferences.getInstance();
    var obtainedName = myPreferences.getString('userName');
    var obtainedPassword = myPreferences.getString('password');
    setState(() {
      userName = obtainedName!;
      password = obtainedPassword!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(165, 177, 196, 1),
      body: Padding(
        padding: const EdgeInsets.only(left: 12.0, right: 12.0),
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('lib/image/flutter_logo.png'),
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
      ),
    );
  }
}
