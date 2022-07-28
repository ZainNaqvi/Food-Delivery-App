import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String buttonText;
  final bool transparent;
  final EdgeInsets? margin;
  final double? height;
  final double? width;
  final double? fontSize;
  final double radius;
  final IconData? iconData;

  CustomButton(
      {Key? key,
      this.onPressed,
      required this.buttonText,
      this.transparent = false,
      this.margin,
      this.height,
      this.width = 280,
      this.fontSize,
      this.radius = 5,
      this.iconData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ButtonStyle style = TextButton.styleFrom(
      backgroundColor: onPressed == null
          ? Theme.of(context).disabledColor
          : transparent
              ? Colors.transparent
              : Colors.teal,
      minimumSize: Size(
        width == null ? MediaQuery.of(context).size.width : width!,
        height != null ? height! : 58,
      ),
      padding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
      ),
    );
    return Container(
      child: SizedBox(
        width: width ?? MediaQuery.of(context).size.width,
        height: height ?? 50.sp,
        child: TextButton(
          style: style,
          onPressed: onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              iconData != null
                  ? Padding(
                      padding: EdgeInsets.only(right: 5.w),
                      child: Icon(
                        iconData,
                        color: transparent ? Colors.black : Colors.white,
                      ),
                    )
                  : SizedBox(),
              Text(
                buttonText,
                style: TextStyle(
                  fontSize: fontSize != null ? fontSize : 16.sp,
                  color: transparent ? Colors.teal : Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
