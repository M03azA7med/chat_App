import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
final _firestore=FirebaseFirestore.instance;

class massegeStremBuilder extends StatelessWidget {
  const massegeStremBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: _firestore.collection('massege').snapshots(),
        builder:(context,snapshot){
          List<massgesenderWidget> TextMasseges = [];
          final masseges=snapshot.data!.docs;
          for(var massege in masseges){
            final massegeText=massege.get('text');
            final massegesender=massege.get('sender');
            final massegewidget=massgesenderWidget(text: massegeText, sender: massegesender);
            TextMasseges.add(massegewidget);
          }
          return Expanded(
            child: ListView(
              children: TextMasseges,
            ),
          );

        });

  }
}
class massgesenderWidget extends StatelessWidget {
  const massgesenderWidget({super.key, required this.text, required this.sender});
  final String text;
  final String sender;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text("$sender",style: TextStyle(color: Colors.black26),),
          Material(
              color: Colors.blue,
              elevation: 10,
              borderRadius: BorderRadius.circular(20),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                child: Text('$text',style: TextStyle(color: Colors.white),),
              )),
        ],
      ),
    ) ;
  }
}

