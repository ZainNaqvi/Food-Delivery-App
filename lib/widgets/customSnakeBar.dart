import 'package:flutter/material.dart';

showSnakeBar(String content, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      action: SnackBarAction(
        label: '',
        onPressed: () {
          // Some code to undo the change.
        },
      ),
      content: Text(
        content,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      dismissDirection: DismissDirection.up,
      behavior: SnackBarBehavior.floating,
      elevation: 0,
      duration: Duration(
        seconds: 7,
      ),
      backgroundColor: Theme.of(context).backgroundColor,
    ),
  );
}
