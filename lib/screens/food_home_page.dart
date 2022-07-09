import 'package:flutter/material.dart';

class FoodHomePage extends StatelessWidget {
  const FoodHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Column(
                  children: [
                    Text(
                      "Pakistan",
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    Row(
                      children: [
                        Text(
                          "Wah Cantt",
                        ),
                        Icon(Icons.arrow_drop_down),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
