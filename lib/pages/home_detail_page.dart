import 'package:flutter/material.dart';
import 'package:flutter_starter/models/Catalog.dart';
import 'package:flutter_starter/utils/MyRoutes.dart';
import 'package:flutter_starter/widgets/MyThemes.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePageDetail extends StatelessWidget {
  final Item catalog;

  const HomePageDetail({Key key, this.catalog})
      : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      bottomNavigationBar: Container(
        color: context.cardColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          children: [
            "\$${catalog.price}".text.bold.xl3.red800.make(),
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
            ).wh(130, 50),
          ],
        ).p32(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
              tag: Key(catalog.id.toString()),
              child: Image.network(catalog.image),
            ).h32(context),
            Expanded(
              child: VxArc(
                height: 30,
                arcType: VxArcType.CONVEY,
                edge: VxEdge.TOP,
                child: Container(
                  color: context.cardColor,
                  width: context.screenWidth,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        catalog.name.text.xl4
                            .color(context.accentColor)
                            .bold
                            .make(),
                        catalog.desc.text.xl
                            .textStyle(context.captionStyle)
                            .make(),
                        10.heightBox,
                        "Lorem Ipsum is simply dummy text of  took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
                            .text
                            .textStyle(context.captionStyle)
                            .make().p16()
                      ],
                    ).py64(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
