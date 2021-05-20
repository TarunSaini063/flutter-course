import 'package:flutter/material.dart';
import 'package:flutter_starter/models/Catalog.dart';
import 'package:flutter_starter/widgets/ItemWidget.dart';
import 'package:flutter_starter/widgets/MyDrawer.dart';

class MyHomePage extends StatelessWidget {
  final title;
  MyHomePage({Key key,this.title}) : super(key: key);
  final dummyList = List.generate(50, (index) => products[0]);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('win95'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: dummyList.length,
          itemBuilder: (context,index){
            return ItemWidget(item: dummyList[index]);
          },
          ),
      ),
      drawer: MyDrawer(),
    );
  }
}
