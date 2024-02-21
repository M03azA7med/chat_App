import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class custemBtn extends StatelessWidget {
  final String BtnText;
  final Color BtnColor;
  final VoidCallback Onpressed;

  const custemBtn({super.key, required this.BtnText, required this.BtnColor, required this.Onpressed});

  @override
  Widget build(BuildContext context) {

    return Container(
        width: 300,
        decoration: BoxDecoration(
          color: BtnColor,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: MaterialButton(
          onPressed: Onpressed,
          child: Text(BtnText,style: TextStyle(
              color: Colors.white
          ),),
        ));
  }
}
