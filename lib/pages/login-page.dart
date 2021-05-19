import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key key, this.title}) : super(key: key);
  final title;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Text('this is $title',
            style: TextStyle(
                fontSize: 24,
                color: Colors.deepPurple,
                fontWeight: FontWeight.bold
            )
        ),
      ),
    );
  }
}
