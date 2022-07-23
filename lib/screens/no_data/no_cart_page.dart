import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NoData extends StatelessWidget {
  final String text;
  final String imageData;
  const NoData(
      {Key? key,
      this.imageData = 'assets/images/no-data.png',
      required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 0.h),
          Column(
            children: [
              Image.asset(
                imageData,
                width: MediaQuery.of(context).size.height * 0.44,
              ),
              Center(
                child: Text(
                  text,
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
            ],
          ),
          SizedBox(height: 0.h),
          SizedBox(height: 8.h),
        ],
      ),
    );
  }
}
