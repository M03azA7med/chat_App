import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:chat_app/screens/sigin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class splash_screen extends StatelessWidget {
  const splash_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterSplashScreen.gif(
      gifPath: 'images/welcome.jpg',
      gifWidth: 269,
      gifHeight: 474,
      nextScreen: const Sigin(),
      duration: const Duration(milliseconds: 3515),
      onInit: () async {
        debugPrint("onInit");
      },
      onEnd: () async {
        debugPrint("onEnd 1");

      },
      backgroundColor: Colors.white,
    );
  }
}
