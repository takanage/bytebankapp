import 'package:flutter/material.dart';

class TransactionAuthDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Authenticate'),
      content: TextField(
        obscureText: true,
        maxLength: 4,
        decoration: InputDecoration(
          border: OutlineInputBorder()
        ),
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 64, letterSpacing: 32),
        keyboardType: TextInputType.number,

      ),
      actions: [
        TextButton(
          onPressed: () {
            print('Cancel');
          },
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            print('Confirm');
          },
          child: Text('Confirm'),
        ),
      ],
    );
  }
}
