import 'package:chat_app/screens/chat_screens.dart';
import 'package:chat_app/screens/register.dart';
import 'package:chat_app/widgets/customBtn.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class Sigin extends StatefulWidget {
  const Sigin({super.key});

  @override
  State<Sigin>createState() => _SiginState();
}

class _SiginState extends State<Sigin> {
  late String email;
  late String password;
  final _auth = FirebaseAuth.instance;
  bool spiner=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: spiner,
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0,50,0,0),
              child: Column(

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
                  custemBtn(BtnText: 'Login', BtnColor: Colors.deepPurple,
                      Onpressed: (){
                    setState(() {
                      spiner=true;
                    });
                    final user=_auth.signInWithEmailAndPassword(email: email, password: password).then((value){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ChatScreens(),));
                      setState(() {
                        spiner=false;
                      });
                    }).catchError((error){
                      print(error);
                    });
                  }),
                  TextButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => register(),));
                  }, child: Text('Register',style: TextStyle(color: Colors.blue),)),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
