import 'package:flutter/material.dart';

// Here we are going to add the most used widgets in the website
// and change in their styles or functions depending on their use cases

class TravelStayButton extends ElevatedButton {
  final void Function() onPressed;
  final Widget child;
  TravelStayButton(this.onPressed, this.child)
      : super(onPressed: onPressed, child: child, style: ButtonStyle());
}

class TravelStayAppBar extends AppBar {
  TravelStayAppBar() : super();
}
