import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_starter/models/Catalog.dart';
import 'package:flutter_starter/widgets/MyThemes.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_starter/widgets/ItemWidget.dart';
import 'package:flutter_starter/widgets/MyDrawer.dart';
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
        backgroundColor: MyThemes.creamColor,
        body: SafeArea(
          child: Container(
            padding: Vx.m32,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CatalogHeader(),
                (CatalogModel.item != null && CatalogModel.item.isNotEmpty)
                    ? CatalogList().expand()
                    : CircularProgressIndicator()
              ],
            ),
          ),
        ));
  }
}

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catalog App".text.xl5.bold.color(MyThemes.darkBluishColor).make(),
        "Trending products".text.make()
      ],
    );
  }
}

class CatalogList extends StatelessWidget {
  const CatalogList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (contex, index) {
        final catalog = CatalogModel.item[index];
        return CatalogItem(
          catalog: catalog,
        );
      },
      itemCount: CatalogModel.item.length,
    );
  }
}

class CatalogItem extends StatelessWidget {
  const CatalogItem({Key key, @required this.catalog})
      : assert(catalog != null),
        super(key: key);
  final Item catalog;

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        CatalogImage(catalogImage: catalog.image),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            catalog.name.text.color(MyThemes.darkBluishColor).bold.make(),
            catalog.desc.text.textStyle(context.captionStyle).make(),
            10.heightBox,
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              children: [
                "\$${catalog.price}".text.bold.xl.make(),
                ElevatedButton(
                  onPressed: () {},
                  child: "Buy".text.make(),
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(MyThemes.darkBluishColor),
                      shape: MaterialStateProperty.all(
                        StadiumBorder(),
                      )
                  ),
                )
              ],
            ).pOnly(right: 8.0)
          ],
        ))
      ],
    )).white.rounded.square(150).make().p16();
  }
}

class CatalogImage extends StatelessWidget {
  final catalogImage;

  const CatalogImage({Key key, @required this.catalogImage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(catalogImage)
        .box
        .rounded
        .p8
        .color(MyThemes.creamColor)
        .make()
        .p16()
        .w32(context);
  }
}
