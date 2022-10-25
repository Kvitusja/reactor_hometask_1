import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_task_1/login_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GreetingWidget extends StatefulWidget {
  const GreetingWidget({Key? key}) : super(key: key);

  @override
  State<GreetingWidget> createState() => _GreetingWidgetState();
}

class _GreetingWidgetState extends State<GreetingWidget> {
  Future<void> logOut() async {
    final SharedPreferences myPreferences =
        await SharedPreferences.getInstance();
    myPreferences.remove('userName');
    myPreferences.remove('password');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(165, 177, 196, 1),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'First hometask',
          style: TextStyle(color: Colors.black87),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                        backgroundColor: const Color.fromRGBO(165, 177, 196, 1),
                        content: Container(
                          margin: const EdgeInsets.all(12),
                          height: 120,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Center(
                                child: Text(
                                  'Do you want to logout?',
                                  style: GoogleFonts.bebasNeue(
                                      fontSize: 24, color: Colors.black87),
                                ),
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
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
                                      logOut();
                                      Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                const LoginWidget()),
                                          (route) => false,
                                      );
                                    },
                                    child: Text(
                                      'Yes',
                                      style: GoogleFonts.bebasNeue(
                                          fontSize: 22, color: Colors.black87),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 100,
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
                                    onPressed: () =>
                                        Navigator.of(context).pop(),
                                    child: Text(
                                      'No',
                                      style: GoogleFonts.bebasNeue(
                                          fontSize: 22, color: Colors.black87),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ));
            },
          ),
        ],
      ),
      body: Center(
        child: Container(
          child: Text(
            'Glad to see you back',
            style: GoogleFonts.bebasNeue(fontSize: 36, color: Colors.black87),
          ),
        ),
      ),
    );
  }
}
