import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_application/constants.dart';

class ExpandedTextWidget extends StatefulWidget {
  final String text;

  const ExpandedTextWidget({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  State<ExpandedTextWidget> createState() => _ExpandedTextWidgetState();
}

class _ExpandedTextWidgetState extends State<ExpandedTextWidget> {
  late String firstHalf;
  late String secondHalf;
  bool hiddenText = true;

  @override
  void initState() {
    super.initState();
    if (widget.text.length > 70) {
      firstHalf = widget.text.substring(0, 70);
      secondHalf = widget.text.substring(70 + 1, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty
          ? Text(
              firstHalf,
              style: Theme.of(context).textTheme.headline6,
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  hiddenText ? firstHalf + "..." : firstHalf + secondHalf,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        setState(() {
                          hiddenText = !hiddenText;
                        });
                      },
                      child: Text(
                        hiddenText ? "Show more" : "Show less",
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                    SizedBox(
                      width: 3.w,
                    ),
                    hiddenText
                        ? Icon(
                            Icons.keyboard_arrow_down_sharp,
                            color: kLightTextColor,
                          )
                        : Icon(
                            Icons.keyboard_arrow_up_sharp,
                            color: kLightTextColor,
                          ),
                  ],
                ),
                SizedBox(
                  height: 8.h,
                ),
              ],
            ),
    );
  }
}
