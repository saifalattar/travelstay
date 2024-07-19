import 'package:flutter/material.dart';
import 'package:travelstay/shared/sharedVariables.dart';
import 'package:travelstay/shared/sharedWidgets.dart';
import 'package:travelstay/views/Contact%20Us/components.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      drawer: TravelStayDrawer(context),
      key: scaffoldKey,
      appBar: TravelStayAppBar(context: context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const MasjidBanner(title: "Contact Us"),
            Text(
              "\n\nContact with us",
              style: themeData.textTheme.displayLarge,
            ),
            SizedBox(
              width: 210,
              child: Divider(
                color: themeData.primaryColor,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Column(
              crossAxisAlignment: width < 800
                  ? CrossAxisAlignment.center
                  : CrossAxisAlignment.start,
              children: const [
                Text(
                  "Keep in touch",
                  style: TextStyle(fontSize: 25, color: Colors.black),
                ),
                Wrap(
                  alignment: WrapAlignment.center,
                  children: [
                    ContactInfoContainer(
                        title: "UK office",
                        description: "Birmingham, West Midlands, UK"),
                    ContactInfoContainer(
                      title: "Sharjah Office",
                      note: "XPLOR GROUP LLC",
                      description:
                          "Shams Business Center, Sharjah Media City Free Zone, Al Messaned, Sharjah, UAE",
                    ),
                    ContactInfoContainer(
                        title: "Dubai", description: "+971 (0) 52 964 0535"),
                    ContactInfoContainer(
                        title: "Email", description: "info@travelstay247.com")
                  ],
                ),
                SizedBox(
                  height: 70,
                ),
              ],
            ),
            Text(
              "Leave us a message",
              style: themeData.textTheme.displayLarge,
            ),
            SizedBox(
              width: 210,
              child: Divider(
                color: themeData.primaryColor,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            const ContactUsMessageContainer(),
            const TravelStayFooter(
              isUnbeatableStackShown: false,
            )
          ],
        ),
      ),
    );
  }
}
