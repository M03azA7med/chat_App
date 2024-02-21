import 'package:chat_app/screens/chat_screens.dart';
import 'package:chat_app/screens/register.dart';
import 'package:chat_app/screens/sigin.dart';
import 'package:chat_app/screens/splash_screen.dart';
import 'package:chat_app/screens/welcome.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget     {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home:FirebaseAuth.instance.currentUser != null ? ChatScreens():splash_screen(),

      // initialRoute: 'welcome',
      // routes: {
      //   'welcome':(context) => welcome(),
      //   'sigin':(context) => Sigin(),
      //   'register':(context) => register(),
      //   'chat_screens':(context) => ChatScreens(),
      // },
    );
  }
}