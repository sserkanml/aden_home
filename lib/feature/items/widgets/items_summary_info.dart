
import 'package:aden/core/widgets/bodylarge.dart';
import 'package:aden/core/widgets/bodymedium.dart';
import 'package:aden/core/widgets/bodysmal.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class ItemsSummaryInfo extends StatelessWidget {
  const ItemsSummaryInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment : MainAxisAlignment.spaceBetween,
      children: [
        Column(
        
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            BodyLarge(
              data: "Malzeme",
              color: context.colorScheme.onSurface.withOpacity(.4),
            ),
            const BodyMedium(
              data: "12",
              fontWeight: FontWeight.bold,
            )
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            BodyLarge(
              data: "Klasör",
              color: context.colorScheme.onSurface.withOpacity(.4),
            ),
            const BodyMedium(
              data: "12",
              fontWeight: FontWeight.bold,
            )
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            BodyLarge(
              data: "Toplam Miktar",
              color: context.colorScheme.onSurface.withOpacity(.4),
            ),
            const BodyMedium(
              data: "104 birim",
              fontWeight: FontWeight.bold,
            )
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            BodyLarge(
              data: "Toplam Tutar",
              color: context.colorScheme.onSurface.withOpacity(.4),
            ),
            const BodyMedium(
              data: "₺43.4k",
              fontWeight: FontWeight.bold,
            )
          ],
        ),
        
      ],
    );
  }
}
