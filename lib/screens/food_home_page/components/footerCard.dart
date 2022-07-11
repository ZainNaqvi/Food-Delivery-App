import 'package:flutter/material.dart';

import 'iconandtext.dart';

Row bottomOfCard(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      IconAndTextWidget(
        context: context,
        title: "Normal",
        iconData: Icons.circle_sharp,
        iconColor: Colors.orangeAccent,
      ),
      IconAndTextWidget(
        context: context,
        title: "1.2 km",
        iconData: Icons.location_on,
        iconColor: Colors.teal,
      ),
      IconAndTextWidget(
        context: context,
        title: "Normal",
        iconData: Icons.lock_clock,
        iconColor: Colors.redAccent,
      ),
    ],
  );
}
