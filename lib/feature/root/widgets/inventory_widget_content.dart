
import 'package:aden/core/widgets/bodysmal.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class InventoryWidgetContent extends StatelessWidget {
  const InventoryWidgetContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment : MainAxisAlignment.spaceBetween,
      children: [
        Column(
        
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            BodySmall(
              data: "Malzeme",
              color: context.colorScheme.onSurface.withOpacity(.4),
            ),
            const BodySmall(
              data: "12",
              fontWeight: FontWeight.bold,
            )
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            BodySmall(
              data: "Klasör",
              color: context.colorScheme.onSurface.withOpacity(.4),
            ),
            const BodySmall(
              data: "12",
              fontWeight: FontWeight.bold,
            )
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            BodySmall(
              data: "Toplam Miktar",
              color: context.colorScheme.onSurface.withOpacity(.4),
            ),
            const BodySmall(
              data: "104 birim",
              fontWeight: FontWeight.bold,
            )
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            BodySmall(
              data: "Toplam Tutar",
              color: context.colorScheme.onSurface.withOpacity(.4),
            ),
            const BodySmall(
              data: "₺43.4k",
              fontWeight: FontWeight.bold,
            )
          ],
        ),
        
      ],
    );
  }
}
