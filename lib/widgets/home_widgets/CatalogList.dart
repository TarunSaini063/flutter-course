import 'package:flutter/material.dart';
import 'package:flutter_starter/models/Catalog.dart';
import 'package:flutter_starter/pages/home_detail_page.dart';
import 'package:flutter_starter/utils/MyRoutes.dart';
import 'package:flutter_starter/widgets/MyThemes.dart';
import 'package:velocity_x/velocity_x.dart';

import 'CatalogImage.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (contex, index) {
        final catalog = CatalogModel.item[index];
        return InkWell(
          onTap: () => {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomePageDetail(
                  catalog: catalog,
                ),
              ),
            )
          },
          child: CatalogItem(
            catalog: catalog,
          ),
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
          Hero(
            tag: Key(catalog.id.toString()),
            child: CatalogImage(catalogImage: catalog.image),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                catalog.name.text.color(context.theme.accentColor).bold.make(),
                catalog.desc.text.textStyle(context.captionStyle).make(),
                10.heightBox,
                ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  children: [
                    "\$${catalog.price}".text.bold.xl.make(),
                    ElevatedButton(
                      onPressed: () => Navigator.pushNamed(context, MyRoutes.cartPageRoutes),
                      child: "Add to cart".text.make(),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(context.theme.buttonColor),
                        shape: MaterialStateProperty.all(
                          StadiumBorder(),
                        ),
                      ),
                    ),
                  ],
                ).pOnly(right: 8.0)
              ],
            ),
          ),
        ],
      ),
    ).color(context.cardColor).rounded.square(150).make().py16();
  }
}
