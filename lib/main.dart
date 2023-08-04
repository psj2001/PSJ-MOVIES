import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:psj_movies/services/auth_service.dart';
import 'package:psj_movies/utils/colors.dart';
import 'package:psj_movies/view/home_screen.dart';
import 'package:psj_movies/view/login.dart';
import 'package:psj_movies/view/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PSJMOVIES',
      theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Colours.scaffoldBgColor,
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(primary: Colors.red))),
      home: StreamBuilder(
          stream: AuthService().firebaseAuth.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return User == null ? Login() : HomeScreen();
            }
            return SplashScreen();
          }),
    );
  }
}
