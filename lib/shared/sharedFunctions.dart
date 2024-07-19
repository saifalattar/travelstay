import "dart:html" as html;

import "package:flutter/material.dart";
import "package:go_router/go_router.dart";
import "package:travelstay/shared/sharedVariables.dart";

class Functions {
  static void navigateWithNewTab(String newScreen) {
    html.window.open("/#$newScreen", '_blank');
  }

  static void navigateWithInSameTab(
    BuildContext context,
    String newScreen,
  ) {
    scaffoldKey.currentState!.isDrawerOpen
        ? scaffoldKey.currentState!.closeDrawer()
        : null;
    context.go(newScreen);
  }
}
