import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

bool hidden = true;
bool remember = false;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[100],
      body: Column(
        children: [
          const SizedBox(height: 225),
          const Icon(
            Icons.fitness_center,
            size: 90,
            color: Colors.blue,
          ),
          const SizedBox(height: 10),
          Center(
            child: Text(
              "Start today!",
              style: GoogleFonts.bebasNeue(
                fontSize: 70,
                color: Colors.blue,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.blue,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(60),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  style: GoogleFonts.robotoFlex(fontSize: 20),
                  decoration: InputDecoration(
                    hintText: 'Username',
                    border: InputBorder.none,
                    hintStyle: GoogleFonts.bebasNeue(fontSize: 20),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.blue,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(60),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  style: GoogleFonts.robotoFlex(fontSize: 20),
                  obscureText: hidden == true ? true : false,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    border: InputBorder.none,
                    hintStyle: GoogleFonts.bebasNeue(fontSize: 20),
                    suffixIcon: IconButton(
                      onPressed: () => setState(() {
                        hidden = !hidden;
                      }),
                      icon: Icon(
                        hidden == true ? Icons.lock : Icons.lock_open,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 15),
          ElevatedButton(
            onPressed: () => Navigator.pushNamed(context, '/home_page'),
            style: ElevatedButton.styleFrom(
              elevation: 0,
              minimumSize: const Size(370, 50),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(60)),
            ),
            child: Text(
              "Login",
              style: GoogleFonts.bebasNeue(fontSize: 28),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const SizedBox(width: 20),
              Switch(
                value: remember,
                onChanged: (value) {
                  setState(() {
                    remember = value;
                  });
                },
                activeTrackColor: Colors.blue[100],
                activeColor: Colors.blue,
                inactiveThumbColor: const Color.fromARGB(255, 35, 59, 78),
                inactiveTrackColor: Colors.red[300],
              ),
              Text(
                "Remember me",
                style: GoogleFonts.roboto(
                    fontSize: 14,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Dont't have account?",
                style: GoogleFonts.roboto(
                  color: Colors.grey[500],
                ),
              ),
              const SizedBox(width: 5),
              GestureDetector(
                child: Text(
                  "Register now!",
                  style: GoogleFonts.roboto(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () => Navigator.pushNamed(context, '/register_page'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
