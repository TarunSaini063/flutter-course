import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key key, this.title}) : super(key: key);
  final title;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
    child: Column(
      children: [
        SizedBox(
          height: 50,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            "assets/images/login.png",
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text('Welcome',style: TextStyle(color: Colors.deepPurple,fontSize: 24,fontWeight: FontWeight.bold),),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0,horizontal: 32.0),
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                    hintText: "enter username",
                    labelText: "username"
                ),
              ),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                    hintText: "enter password",
                    labelText: "password"
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: (){
                    print('login pressed');
                  },
                  child: Text('Login'),
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                  ),
              )
            ],
          ),
        )
      ],
    ),
    );
  }
}
