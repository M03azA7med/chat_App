import 'package:chat_app/screens/sigin.dart';
import 'package:chat_app/screens/welcome.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/widget.dart';

final _firestore=FirebaseFirestore.instance;

class ChatScreens extends StatefulWidget {
   ChatScreens({super.key});

  @override
  State<ChatScreens> createState() => _ChatScreensState();

}

class _ChatScreensState extends State<ChatScreens> {

  final _auth=FirebaseAuth.instance;
  late User signInUser;
  var massegeConttroler=TextEditingController();
  String? text;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }
  void getCurrentUser() {
   try{
     final user=_auth.currentUser;
     if(user!= null){
       signInUser=user;
     }
   }catch(e){
     print(e);
   };
  }
  // void getdata() async {
  //   final masseges=await _firestore.collection('massege').get();
  //   for(var massege in masseges.docs){
  //     print(massege.data());
  //   }
  //
  // }

  void getMassegeStream() async {
    await for( var snapshot in _firestore.collection('massege').snapshots()){
      for(var massege in snapshot.docs){
        print(massege.data());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MessageMe ${signInUser.email}' , style: TextStyle(color: Colors.white),),
        leading:Image.asset('images/welcome.jpg'),
        actions: [
          IconButton(onPressed: (){
            // getMassegeStream();
            _auth.signOut();
            Navigator.push(context, MaterialPageRoute(builder: (context) =>Sigin(),));
          },
           icon:Icon(Icons.close,color: Colors.white,) ,),
        ],
        backgroundColor: Colors.deepPurple,
      ),
      body: SafeArea(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            massegeStremBuilder(),
            Container(
              height: 75,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: massegeConttroler,
                      keyboardType: TextInputType.text,
                      onChanged: (value){
                        text=value;
                      },
                      decoration: InputDecoration(
                        label: Text('Message'),
                        prefixIcon: Icon(CupertinoIcons.textformat_abc),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  TextButton(onPressed: (){
                    massegeConttroler.clear();
                    _firestore.collection('massege').add({
                      'text':text,
                      'sender':signInUser.email,
                    });
                  }, child: Text('Send',style: TextStyle(color: Colors.deepPurple),))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
