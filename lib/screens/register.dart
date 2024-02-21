import 'package:chat_app/screens/chat_screens.dart';
import 'package:chat_app/widgets/customBtn.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class register extends StatefulWidget {
    const register({super.key});

  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {
  late String email;
  late String password;
  final _auth =FirebaseAuth.instance;
  bool spiner=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: spiner,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('images/welcome.jpg'),
            Container(
              width: 400,
              child:
              TextFormField(
                textAlign: TextAlign.center,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Name  must be write';
                  }
                },
                keyboardType: TextInputType.emailAddress,
                onChanged: (value){
                  email=value;
                },
                decoration: InputDecoration(
                  hintText: 'mo.......@gmail.com',
                  label: Text('Email'),
                  prefixIcon: Icon(Icons.email_outlined),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.deepPurple
                    )
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.yellow[800]!
                    ),
                  )
                ),
              ),

            ),
            SizedBox(height: 30.0,),
            Container(
              width: 400,
              child: TextFormField(
                obscureText: true,
                textAlign: TextAlign.center,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Name  must be write';
                  }
                },
                keyboardType: TextInputType.visiblePassword,
                onChanged: (value){
                  password=value;
                },
                decoration: InputDecoration(
                    label: Text('Password'),

                    prefixIcon: Icon(Icons.lock_outline),
                    suffixIcon: Icon(Icons.visibility_outlined),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.deepPurple
                        )
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.yellow[800]!
                      ),
                    )
                ),
              ),

            ),
            SizedBox(height: 30.0,),
            custemBtn(BtnText: 'Register', BtnColor: Colors.deepPurple,
                Onpressed: () async {
              setState(() {
                spiner=true;
              });
             final newUser = await _auth.createUserWithEmailAndPassword(email: email, password: password).then((value){
               Navigator.push(context, MaterialPageRoute(builder: (context) => ChatScreens(),));
             setState(() {
               spiner=false;
             });
             }).catchError((error){
               print(error);
             });
            }),

          ],
        ),
      ),
    );
  }
}
