import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:travelstay/shared/sharedFunctions.dart';
import 'package:travelstay/shared/sharedVariables.dart';
import "dart:html" as html;

import 'package:url_launcher/url_launcher_string.dart';

// Here we are going to add the most used widgets in the website
// and change in their styles or functions depending on their use cases

class Logo extends StatelessWidget {
  final double width;
  const Logo({super.key, this.width = 400});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Functions.navigateWithInSameTab(context, "/");
      },
      child: Image.asset(
        "assets/logo.png",
        width: width,
      ),
    );
  }
}

class TravelStayButton extends ElevatedButton {
  final bool? hasBorder;
  final Color? color;
  @override
  final void Function() onPressed;
  @override
  final Widget child;
  TravelStayButton(
      {super.key,
      this.color,
      required this.onPressed,
      required this.child,
      this.hasBorder = false})
      : super(
            onPressed: onPressed,
            child: child,
            style: hasBorder!
                ? ButtonStyle(
                    minimumSize: const MaterialStatePropertyAll(Size(100, 50)),
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(
                            color: color ?? themeData.secondaryHeaderColor,
                            width: 3))),
                    backgroundColor:
                        const MaterialStatePropertyAll(Colors.white))
                : ButtonStyle(
                    minimumSize: const MaterialStatePropertyAll(Size(100, 50)),
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
                    backgroundColor: MaterialStatePropertyAll(
                        color ?? themeData.secondaryHeaderColor)));
}

class TravelStayAppBar extends PreferredSize {
  final BuildContext context;
  TravelStayAppBar({super.key, required this.context})
      : super(
            preferredSize: Size(double.infinity,
                MediaQuery.sizeOf(context).width < 800 ? 100 : 150),
            child: Container(
              color: themeData.primaryColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  MediaQuery.sizeOf(context).width < 800
                      ? const SizedBox()
                      : Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      InkWell(
                                          onTap: () {
                                            html.window.open(
                                                "https://www.facebook.com/people/TravelStay247/61558073497459/",
                                                "_blank");
                                          },
                                          child: Image.asset(
                                              "assets/facebook.png",
                                              width: 30)),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      InkWell(
                                          onTap: () {
                                            html.window.open(
                                                "https://www.google.com",
                                                "_blank");
                                          },
                                          child: Image.asset(
                                              "assets/instagram.png",
                                              width: 30)),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      InkWell(
                                          onTap: () {
                                            html.window.open(
                                                "https://www.tiktok.com/@travelstay247?_t=8mVHB4k1LPc&_r=1",
                                                "_blank");
                                          },
                                          child: Image.asset(
                                              "assets/tiktok.png",
                                              width: 30))
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      TravelStayButton(
                                          hasBorder: true,
                                          onPressed: () {},
                                          child: Text(
                                            "Sign Up",
                                            style:
                                                themeData.textTheme.titleMedium,
                                          )),
                                      TravelStayButton(
                                          hasBorder: true,
                                          onPressed: () {},
                                          child: Text(
                                            "Log In",
                                            style:
                                                themeData.textTheme.titleMedium,
                                          ))
                                    ],
                                  )
                                ],
                              ),
                            ),
                            const Divider(
                              thickness: 0.5,
                            ),
                          ],
                        ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MediaQuery.sizeOf(context).width > 800
                          ? MainAxisAlignment.start
                          : MainAxisAlignment.spaceBetween,
                      children: [
                        const Logo(width: 250),
                        const SizedBox(
                          width: 50,
                        ),
                        MediaQuery.sizeOf(context).width < 800
                            ? IconButton(
                                onPressed: () {
                                  scaffoldKey.currentState!.openDrawer();
                                },
                                icon: const Icon(
                                  Icons.menu,
                                  color: Colors.white,
                                ))
                            : Row(
                                children: [
                                  TextButton(
                                      onPressed: () {
                                        Functions.navigateWithInSameTab(
                                            context, "/");
                                      },
                                      child: Text(
                                        "Home",
                                        style:
                                            themeData.textTheme.headlineMedium,
                                      )),
                                  TextButton(
                                      onPressed: () {
                                        Functions.navigateWithInSameTab(
                                            context, "/AboutUs");
                                      },
                                      child: Text("About",
                                          style: themeData
                                              .textTheme.headlineMedium)),
                                  TextButton(
                                      onPressed: () {
                                        Functions.navigateWithInSameTab(
                                            context, "/Charity");
                                      },
                                      child: Text("Charity",
                                          style: themeData
                                              .textTheme.headlineMedium)),
                                  TextButton(
                                      onPressed: () {
                                        Functions.navigateWithInSameTab(
                                            context, "/ContactUs");
                                      },
                                      child: Text("Contact",
                                          style: themeData
                                              .textTheme.headlineMedium))
                                ],
                              )
                      ],
                    ),
                  ),
                ],
              ),
            ));
}

class TravelStayTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool isFullWidth;
  const TravelStayTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      this.isFullWidth = false});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return Container(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      constraints: BoxConstraints(
          maxWidth: isFullWidth
              ? width * 0.83
              : width > 1000
                  ? width * 0.4
                  : width * 0.83),
      margin: const EdgeInsets.all(15),
      child: DottedBorder(
        dashPattern: const [5, 4],
        padding: const EdgeInsets.all(1),
        color: Colors.grey.shade400,
        borderType: BorderType.RRect,
        radius: const Radius.circular(10),
        child: TextFormField(
          maxLines: isFullWidth ? 4 : 1,
          controller: controller,
          style: themeData.textTheme.labelLarge,
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText,
              filled: true,
              fillColor: const Color(0xFFF3F6FD)),
        ),
      ),
    );
  }
}

class HomeBanner extends StatelessWidget {
  const HomeBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset("assets/banner242.jpg");
  }
}

class Insight extends StatelessWidget {
  final String assetName, header, description;
  const Insight(
      {super.key,
      required this.assetName,
      required this.header,
      required this.description});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return Container(
      constraints:
          BoxConstraints(minWidth: width < 800 ? width * 0.8 : width / 6),
      child: Column(
        children: [
          Image.asset(assetName),
          Text(
            "$header+",
            style: TextStyle(color: themeData.primaryColor, fontSize: 25),
          ),
          Text(description, style: themeData.textTheme.labelLarge)
        ],
      ),
    );
  }
}

class InsightsContainer extends StatelessWidget {
  const InsightsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return Container(
      width: width * 0.85,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              offset: const Offset(0.2, 0.2),
              spreadRadius: 10,
              color: Colors.black.withOpacity(0.3),
              blurRadius: 10)
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(20),
      child: const Wrap(
        spacing: 50,
        runSpacing: 50,
        runAlignment: WrapAlignment.start,
        children: [
          Insight(
              assetName: "assets/user.png",
              header: "999",
              description: "999+ Happy Customers"),
          Insight(
              assetName: "assets/bank.png",
              header: "10000",
              description: "10000+ Cities"),
          Insight(
              assetName: "assets/world-map.png",
              header: "180",
              description: "180+ Countries"),
          Insight(
              assetName: "assets/calander.png",
              header: "500000",
              description: "500000+ Hotels")
        ],
      ),
    );
  }
}

class MountainImage extends StatelessWidget {
  const MountainImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/booknow.jpg",
      fit: BoxFit.fitHeight,
    );
  }
}

class MasjidBanner extends StatelessWidget {
  final String title;
  const MasjidBanner({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset(
          "assets/common-banner.png",
          height: 400,
          fit: BoxFit.fitHeight,
        ),
        Column(
          children: [
            Text(
              title,
              style: const TextStyle(color: Colors.white, fontSize: 30),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    Functions.navigateWithInSameTab(context, "/");
                  },
                  child: Text(
                    "Home",
                    style: TextStyle(color: Colors.grey.shade400),
                  ),
                ),
                Text("● $title", style: themeData.textTheme.headlineMedium)
              ],
            )
          ],
        )
      ],
    );
  }
}

class TravelStayFooter extends StatelessWidget {
  final bool isUnbeatableStackShown;
  const TravelStayFooter({super.key, required this.isUnbeatableStackShown});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return Column(
      children: [
        isUnbeatableStackShown
            ? Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Column(
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          const MountainImage(),
                          Text(
                            "Unbeatable Hotel Prices\n",
                            style: themeData.textTheme.bodyLarge,
                          )
                        ],
                      ),
                      SizedBox(
                        height: width > 800
                            ? width > 1037
                                ? 100
                                : 250
                            : 600,
                      )
                    ],
                  ),
                  const InsightsContainer()
                ],
              )
            : const SizedBox(),
        const SizedBox(
          height: 100,
        ),
        Container(
          decoration: BoxDecoration(color: themeData.primaryColor),
          width: double.infinity,
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Logo(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Need any help?",
                          style: TextStyle(color: Colors.white, fontSize: 25)),
                      SizedBox(
                        width: 180,
                        child: Divider(
                          thickness: 1,
                          color: themeData.primaryColor.withGreen(100),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                        height: 110,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            VerticalDivider(
                              thickness: 1,
                              width: 2,
                              color: themeData.primaryColor.withGreen(100),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Call 24/7 for any help\n",
                                  style: themeData.textTheme.bodyMedium,
                                ),
                                InkWell(
                                    onTap: () async {
                                      await launchUrlString(
                                          "tel:+44 121 284 6264");
                                    },
                                    child: Text(
                                      "UK:  +44 121 284 6264",
                                      style: themeData.textTheme.bodyMedium,
                                    )),
                                InkWell(
                                    onTap: () {
                                      launchUrlString(
                                          "tel:+971 (0) 52 964 0535");
                                    },
                                    child: Text(
                                      "Dubai:  +971 (0) 52 964 0535",
                                      style: themeData.textTheme.bodyMedium,
                                    )),
                              ],
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 60,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            VerticalDivider(
                              thickness: 1,
                              width: 2,
                              color: themeData.primaryColor.withGreen(100),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Mail to our support team",
                                  style: themeData.textTheme.bodyMedium,
                                ),
                                InkWell(
                                    onTap: () {
                                      launchUrlString(
                                          "mailto:info@travelstay247.com");
                                    },
                                    child: Text(
                                      "info@travelstay247.com",
                                      style: themeData.textTheme.bodyMedium,
                                    ))
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Information",
                          style: TextStyle(color: Colors.white, fontSize: 25)),
                      SizedBox(
                        width: 150,
                        child: Divider(
                          thickness: 1,
                          color: themeData.primaryColor.withGreen(100),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      TextButton(
                          onPressed: () {
                            Functions.navigateWithInSameTab(
                                context, "/AboutUs");
                          },
                          child: Text("About Us",
                              style: themeData.textTheme.bodyMedium)),
                      TextButton(
                          onPressed: () {
                            Functions.navigateWithInSameTab(
                                context, "/Charity");
                          },
                          child: Text("Charity",
                              style: themeData.textTheme.bodyMedium)),
                      TextButton(
                          onPressed: () {
                            Functions.navigateWithInSameTab(
                                context, "/AboutUs");
                          },
                          child: Text("Contact Us",
                              style: themeData.textTheme.bodyMedium)),
                      TextButton(
                          onPressed: () {
                            Functions.navigateWithInSameTab(
                                context, "/TermsAndConditions");
                          },
                          child: Text("Terms And Conditions",
                              style: themeData.textTheme.bodyMedium))
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: Wrap(
            alignment: WrapAlignment.center,
            runSpacing: 20,
            children: [
              Text(
                "Copyright © 2024 All Rights Reserved",
                style: themeData.textTheme.labelLarge,
              ),
              Image.asset("assets/cards2.jpg")
            ],
          ),
        )
      ],
    );
  }
}

class TravelStayDrawer extends Drawer {
  final BuildContext context;
  TravelStayDrawer(this.context, {super.key})
      : super(
          backgroundColor: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  DrawerHeader(
                      decoration: BoxDecoration(
                        color: themeData.primaryColor,
                      ),
                      child: const Logo()),
                  ListTile(
                    title: Row(
                      children: [
                        Icon(
                          Icons.home,
                          color: themeData.primaryColor,
                        ),
                        Text(
                          '  Home',
                          style: themeData.textTheme.labelLarge,
                        ),
                      ],
                    ),
                    onTap: () {
                      Functions.navigateWithInSameTab(context, "/");
                    },
                  ),
                  ListTile(
                    title: Row(
                      children: [
                        Icon(
                          Icons.people,
                          color: themeData.primaryColor,
                        ),
                        Text(
                          '  About Us',
                          style: themeData.textTheme.labelLarge,
                        ),
                      ],
                    ),
                    onTap: () {
                      Functions.navigateWithInSameTab(context, "/AboutUs");
                    },
                  ),
                  ListTile(
                    title: Row(
                      children: [
                        Icon(
                          Icons.monetization_on,
                          color: themeData.primaryColor,
                        ),
                        Text(
                          '  Charity',
                          style: themeData.textTheme.labelLarge,
                        ),
                      ],
                    ),
                    onTap: () {
                      Functions.navigateWithInSameTab(context, "/Charity");
                    },
                  ),
                  ListTile(
                    title: Row(
                      children: [
                        Icon(
                          Icons.call,
                          color: themeData.primaryColor,
                        ),
                        Text(
                          '  Contact',
                          style: themeData.textTheme.labelLarge,
                        ),
                      ],
                    ),
                    onTap: () {
                      Functions.navigateWithInSameTab(context, "/ContactUs");
                    },
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                            onTap: () {
                              html.window.open(
                                  "https://www.facebook.com/people/TravelStay247/61558073497459/",
                                  "_blank");
                            },
                            child:
                                Image.asset("assets/facebook.png", width: 30)),
                        const SizedBox(
                          width: 10,
                        ),
                        InkWell(
                            onTap: () {
                              html.window
                                  .open("https://www.google.com", "_blank");
                            },
                            child:
                                Image.asset("assets/instagram.png", width: 30)),
                        const SizedBox(
                          width: 10,
                        ),
                        InkWell(
                            onTap: () {
                              html.window.open(
                                  "https://www.tiktok.com/@travelstay247?_t=8mVHB4k1LPc&_r=1",
                                  "_blank");
                            },
                            child: Image.asset("assets/tiktok.png", width: 30))
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Column(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: TravelStayButton(
                              hasBorder: true,
                              onPressed: () {},
                              child: Text(
                                "Sign Up",
                                style: themeData.textTheme.titleMedium,
                              )),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: TravelStayButton(
                              hasBorder: true,
                              onPressed: () {},
                              child: Text(
                                "Log In",
                                style: themeData.textTheme.titleMedium,
                              )),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        );
}
