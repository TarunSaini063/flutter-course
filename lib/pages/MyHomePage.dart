import 'package:flutter/material.dart';
import 'package:flutter_starter/widgets/MyDrawer.dart';

class MyHomePage extends StatelessWidget {
  final title;
  const MyHomePage({Key key,this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('win95'),
      ),
      body: Center(
        child: Container(
          child: Text('Title of this app is $title',style: TextStyle(fontSize: 24,color: Colors.blue),),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
