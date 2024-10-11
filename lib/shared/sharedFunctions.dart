import "dart:html" as html;

import "package:flutter/material.dart";

class Functions {
  static void navigateWithNewTab(String newScreen) {
    html.window.open("/#$newScreen", '_blank');
  }

  static void navigateWithInSameTab(
    BuildContext context,
    String newScreen, {
    Object? query,
  }) {
    // key.currentState!.isDrawerOpen ? key.currentState!.closeDrawer() : null;
    // context.go(newScreen, extra: query);
    Navigator.pushNamed(context, newScreen, arguments: query);
  }
}
