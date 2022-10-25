import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_task_1/greeting_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({Key? key}) : super(key: key);

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  bool isRemembered = false;
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  String? errorText = '';

  void myAuthentification() {
    final myLogin = userNameController.text;
    final myPassword = passwordController.text;

    if (userIsAdmin(myLogin, myPassword)) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const GreetingWidget()),
      );
    } else {
      errorText = 'Невірне ім\'я чи пароль';
    }
    setState(() {});
  }

  bool userIsAdmin(String login, String password) {
    if (login == 'admin' && password == '123456') {
      return true;
    }
    return false;
  }

  Future<void> setLoginData() async {
    final SharedPreferences myPreferences =
        await SharedPreferences.getInstance();
    myPreferences.setString('userName', userNameController.text);
    myPreferences.setString('password', passwordController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(165, 177, 196, 1),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Моя перша домашка',
          style: TextStyle(color: Colors.black87),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.power_settings_new,
                size: 100,
              ),
              const SizedBox(
                height: 10,
              ),
               Text(
                'Привіт, козаче',
                style:
                GoogleFonts.oswald(fontSize: 42, color: Colors.black87, fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Мусиш залогiнитися!',
                style: TextStyle(fontSize: 20, color: Colors.black87),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(14.0, 5.0, 14.0, 5.0),
                child: TextField(
                  textInputAction: TextInputAction.next,
                  controller: userNameController,
                  decoration: InputDecoration(
                    hintText: 'Iм\'я',
                    suffixIcon: const Icon(Icons.person),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(14.0, 5.0, 14.0, 10.0),
                child: TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Пароль',
                    suffixIcon: const Icon(Icons.lock),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(5.0, 10, 0, 10),
                    child: Checkbox(
                      activeColor: Colors.grey,
                      value: isRemembered,
                      onChanged: (remembered) {
                        setState(() {
                          isRemembered = remembered!;
                        });
                      },
                    ),
                  ),
                  //const SizedBox(width: 10,),
                  const Text(
                    'Запам\'ятати',
                    style: TextStyle(fontSize: 16, color: Colors.black87),
                  ),
                  const SizedBox(
                    width: 148,
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      side: MaterialStateProperty.all(
                        const BorderSide(width: 1, color: Colors.black26),
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                      elevation: MaterialStateProperty.all(0),
                      backgroundColor: MaterialStateProperty.all(
                        const Color.fromRGBO(165, 177, 196, 1),
                      ),
                    ),
                    onPressed: () {
                      if (isRemembered == true &&
                          userIsAdmin(
                            userNameController.text,
                            passwordController.text,
                          )) {
                        setLoginData();
                      }
                      myAuthentification();
                    },
                    child: Text(
                      'Далі',
                      style: GoogleFonts.oswald(
                        fontWeight: FontWeight.w500,
                          fontSize: 20, color: Colors.black87),
                    ),
                  ),
                ],
              ),
              Text(
                errorText!,
                style: GoogleFonts.oswald(
                  fontSize: 27,
                  color: const Color.fromRGBO(158, 9, 9, 0.8),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
