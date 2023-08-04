import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:psj_movies/view/home_screen.dart';
import 'package:psj_movies/view/signup.dart';

import '../services/auth_service.dart';

class Login extends StatefulWidget {
  Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController lemail = TextEditingController();

  TextEditingController passc = TextEditingController();
  bool loading = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Image.asset('assets/psj.png')),
          Text(
            "Login",
            style: GoogleFonts.aBeeZee(fontSize: 40),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: TextField(
              controller: lemail,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: "Email"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
            child: TextField(
              obscureText: true,
              controller: passc,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: "Password"),
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
                        if (lemail.text == "" || passc.text == "") {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("All field are requiered !"),
                            backgroundColor: Colors.red,
                          ));
                        } else {
                          User? result = await AuthService()
                              .Login(lemail.text, passc.text, context);
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
                        "Login",
                        style: GoogleFonts.aBeeZee(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ))),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 10,
          ),
          TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    PageRouteBuilder(
                        transitionDuration: Duration(seconds: 1),
                        transitionsBuilder:
                            (context, animation, animationTime, child) {
                          animation = CurvedAnimation(
                              parent: animation, curve: Curves.easeInToLinear);
                            return ScaleTransition(
                            scale: animation,
                            alignment: Alignment.center,
                            child: child,
                          );
                        },
                        pageBuilder: (context, animation, animationTime) {
                          return Signup();
                        }));
              },
              child: Text(
                "Don't have an account ?? ",
                style: GoogleFonts.aBeeZee(fontSize: 15),
              )),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {},
                child: CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.white,
                  backgroundImage: NetworkImage(
                      'https://tse2.mm.bing.net/th?id=OIP.HG6XtzIxf4Nbo_vZt8T3EAHaHa&pid=Api&P=0&h=180'),
                ),
              ),
              SizedBox(
                width: 30,
              ),
              InkWell(
                onTap: () {},
                child: CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.white,
                  backgroundImage: NetworkImage(
                      'https://cdn.onlinewebfonts.com/svg/img_378416.png'),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
