import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_task_1/login_widget.dart';

class GreetingWidget extends StatelessWidget {
  const GreetingWidget({Key? key}) : super(key: key);

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
        leading: IconButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const LoginWidget()),
          ),
          icon: const Icon(Icons.arrow_back),
        ),
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
