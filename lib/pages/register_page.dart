import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

bool hidden = true;

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[100],
      body: Column(
        children: [
          const SizedBox(height: 200),
          const Icon(
            Icons.fitness_center,
            size: 90,
            color: Colors.blue,
          ),
          const SizedBox(height: 10),
          Text(
            "Register now!",
            style: GoogleFonts.bebasNeue(fontSize: 70, color: Colors.blue),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.blue,
                  width: 2,
                ),
                color: Colors.white,
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
                  decoration: InputDecoration(
                    hintText: 'Email',
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
                    hintText: 'Confirm password',
                    border: InputBorder.none,
                    hintStyle: GoogleFonts.bebasNeue(fontSize: 20),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 15),
          ElevatedButton(
            onPressed: () => Navigator.pushNamed(context, '/login_page'),
            style: ElevatedButton.styleFrom(
              elevation: 0,
              minimumSize: const Size(370, 50),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(60)),
            ),
            child: Text(
              "Register",
              style: GoogleFonts.bebasNeue(fontSize: 28),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Already have an Account ',
                style: GoogleFonts.roboto(color: Colors.grey[500]),
              ),
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, '/login_page'),
                child: Text(
                  'Sign-up',
                  style: GoogleFonts.roboto(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
