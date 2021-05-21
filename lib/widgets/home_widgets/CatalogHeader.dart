import 'package:flutter_starter/widgets/MyThemes.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter/material.dart';
class CatalogHeader extends StatelessWidget {
  const CatalogHeader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catalog App".text.xl5.bold.color(context.theme.accentColor).make(),
        "Trending products".text.xl2.make()
      ],
    );
  }
}