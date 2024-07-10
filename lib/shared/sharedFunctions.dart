import "dart:html" as html;

import "package:flutter/material.dart";

class Functions {
  static void navigateWithNewTab(String newScreen) {
    html.window.open("/#$newScreen", '_blank');
  }

  static void navigateWithInSameTab(BuildContext context, String newScreen,
      {bool? canBack}) {
    if (canBack == null || canBack == true) {
      Navigator.pushNamed(context, newScreen);
    } else {
      Navigator.pushReplacementNamed(context, newScreen);
    }
  }
}
