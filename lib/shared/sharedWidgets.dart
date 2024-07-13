import 'package:flutter/material.dart';
import 'package:travelstay/shared/sharedVariables.dart';
import "dart:html" as html;

// Here we are going to add the most used widgets in the website
// and change in their styles or functions depending on their use cases

class TravelStayButton extends ElevatedButton {
  final bool? hasBorder;
  final void Function() onPressed;
  final Widget child;
  TravelStayButton(
      {required this.onPressed, required this.child, this.hasBorder = false})
      : super(
            onPressed: onPressed,
            child: child,
            style: hasBorder!
                ? ButtonStyle(
                    minimumSize: MaterialStatePropertyAll(Size(120, 60)),
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(
                            color: themeData.primaryColor, width: 3))),
                    backgroundColor: MaterialStatePropertyAll(Colors.white))
                : ButtonStyle(
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
                    backgroundColor:
                        MaterialStatePropertyAll(Color(0xFF006ce4))));
}

class TravelStayAppBar extends PreferredSize {
  TravelStayAppBar()
      : super(
            preferredSize: Size(double.infinity, 150),
            child: Container(
              color: themeData.primaryColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        Row(
                          children: [
                            InkWell(
                                onTap: () {
                                  html.window.open(
                                      "https://www.facebook.com/people/TravelStay247/61558073497459/",
                                      "_blank");
                                },
                                child: Image.asset("assets/facebook.png",
                                    width: 30)),
                            SizedBox(
                              width: 10,
                            ),
                            InkWell(
                                onTap: () {
                                  html.window
                                      .open("https://www.google.com", "_blank");
                                },
                                child: Image.asset("assets/instagram.png",
                                    width: 30)),
                            SizedBox(
                              width: 10,
                            ),
                            InkWell(
                                onTap: () {
                                  html.window.open(
                                      "https://www.tiktok.com/@travelstay247?_t=8mVHB4k1LPc&_r=1",
                                      "_blank");
                                },
                                child:
                                    Image.asset("assets/tiktok.png", width: 30))
                          ],
                        ),
                        Row(
                          children: [],
                        )
                      ],
                    ),
                  ),
                  Divider(
                    thickness: 0.5,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        Image.asset(
                          "logo.png",
                          width: 250,
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              "Home",
                              style: themeData.textTheme.headlineMedium,
                            )),
                        TextButton(
                            onPressed: () {},
                            child: Text("About",
                                style: themeData.textTheme.headlineMedium)),
                        TextButton(
                            onPressed: () {},
                            child: Text("Charity",
                                style: themeData.textTheme.headlineMedium)),
                        TextButton(
                            onPressed: () {},
                            child: Text("Contact",
                                style: themeData.textTheme.headlineMedium))
                      ],
                    ),
                  ),
                ],
              ),
            ));
}

class HomeBanner extends StatelessWidget {
  const HomeBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset("assets/banner242.jpg");
  }
}
