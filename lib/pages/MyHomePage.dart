import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_starter/models/Catalog.dart';
import 'package:flutter_starter/utils/MyRoutes.dart';
import 'package:flutter_starter/widgets/MyThemes.dart';
import 'package:flutter_starter/widgets/home_widgets/CatalogHeader.dart';
import 'package:flutter_starter/widgets/home_widgets/CatalogList.dart';
import 'package:velocity_x/velocity_x.dart';
import 'dart:convert';

class MyHomePage extends StatefulWidget {
  final title;

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    var catalogJson = await rootBundle.loadString("assets/files/catalog.json");
    var decodedData = jsonDecode(catalogJson);
    var products = decodedData["products"];
    CatalogModel.item =
        List.from(products).map<Item>((e) => Item.fromMap(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: context.canvasColor,
        floatingActionButton: FloatingActionButton(
          onPressed: ()=> Navigator.pushNamed(context, MyRoutes.cartPageRoutes),
          backgroundColor: context.theme.buttonColor,
          child: Icon(CupertinoIcons.cart,color: MyThemes.floatingButton,),
        ),
        body: SafeArea(
          child: Container(
            padding: Vx.m32,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CatalogHeader(),
                (CatalogModel.item != null && CatalogModel.item.isNotEmpty)
                    ? CatalogList().py16().expand()
                    : CircularProgressIndicator().centered().expand()
              ],
            ),
          ),
        ));
  }
}
