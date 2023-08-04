import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:psj_movies/view/home_screen.dart';
import 'package:psj_movies/view/login.dart';

import '../services/auth_service.dart';

class Signup extends StatefulWidget {
  Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool loading = false;
  TextEditingController emailc = TextEditingController();

  TextEditingController passc = TextEditingController();

  TextEditingController cpassc = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Image.asset('assets/psj.png')),
          Text(
            "Signup",
            style: GoogleFonts.aBeeZee(fontSize: 40),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: TextField(
              controller: emailc,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: "Email"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
            child: TextField(
              controller: passc,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: "Password"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
            child: TextField(
              controller: cpassc,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: "Confirm Password "),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
              width: 350,
              height: 50,
              child: loading
                  ? CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: () async {
                        setState(() {
                          loading = true;
                        });
                        if (emailc.text == "" || passc.text == "") {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("All field are requiered !"),
                            backgroundColor: Colors.red,
                          ));
                        } else if (passc.text != cpassc.text) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("Password mismatch"),
                            backgroundColor: Colors.red,
                          ));
                        } else {
                          User? result = await AuthService()
                              .register(emailc.text, passc.text, context);
                          if (result != null) {
                            print("Success");
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomeScreen()),
                                (route) => false);
                          }
                        }
                        setState(() {
                          loading = false;
                        });
                      },
                      child: Text(
                        "Sign Up",
                        style: GoogleFonts.aBeeZee(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ))),
          SizedBox(
            height: 10,
          ),
          TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                );
              },
              child: Text(
                "Already have an Account ??",
                style: GoogleFonts.aBeeZee(fontSize: 15),
              ))
        ],
      ),
    );
  }
}
