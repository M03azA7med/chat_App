import 'package:chat_app/screens/chat_screens.dart';
import 'package:chat_app/screens/register.dart';
import 'package:chat_app/screens/sigin.dart';
import 'package:chat_app/widgets/customBtn.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class welcome extends StatelessWidget {
  const welcome({super.key});

  Future signInWithGoogle(context) async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    // Once signed in, return the UserCredential
    await FirebaseAuth.instance.signInWithCredential(credential);
    Navigator.push(context, MaterialPageRoute(builder: (context) => ChatScreens(),));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Column(
            children: [
              Image.asset('images/welcome.jpg'),
              Text(
                "MessageMe",
                style: TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.w900,
                    color: Colors.deepPurple),
              ),
            ],
          ),
          SizedBox(height: 10.0,),
          Container(
            width: 300,
            decoration: BoxDecoration(
              color: Colors.deepPurple,
              borderRadius: BorderRadius.circular(10.0),
            ),
              child: MaterialButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Sigin(),));
                },
                child: Text('sign in',style: TextStyle(
                  color: Colors.white
                ),),
              )),
          SizedBox(height: 10.0,),
          custemBtn(BtnText: 'Register', BtnColor: Colors.yellow[700]!, Onpressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => register(),));
          }),
          SizedBox(height: 20.0,),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(11),
              color: Colors.grey.shade50,
            ),
            child: MaterialButton(
              onPressed: () {
                signInWithGoogle(context);
              },
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(10.0),
              ),

              child: Container(
                width: 300,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: Colors.grey,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    Container(
                      width: 50.0,
                        child: Image.asset('images/google.png',)),
                    SizedBox(
                      width: 10,
                    ),
                    Text('Sign In with Google'),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
