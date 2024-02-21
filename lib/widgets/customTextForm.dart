import 'package:flutter/material.dart';

class customTextForm extends StatelessWidget {
  final String lableText;

  const customTextForm({super.key, required this.lableText});

  @override
  Widget build(BuildContext context) {

    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return 'Name  must be write';
        }
      },
      keyboardType: TextInputType.emailAddress,
      onChanged: (value){},
      decoration: InputDecoration(
        hintText: 'mo.......@gmail.com',
        label: Text('Email'),
        prefixIcon: Icon(Icons.email_outlined),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),

      ),
    );
  }
}
