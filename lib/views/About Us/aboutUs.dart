import 'package:flutter/material.dart';
import 'package:travelstay/shared/sharedVariables.dart';
import 'package:travelstay/shared/sharedWidgets.dart';
import 'package:travelstay/views/About%20Us/components.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      key: scaffoldKey,
      appBar: TravelStayAppBar(
        context: context,
      ),
      drawer: TravelStayDrawer(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const MasjidBanner(title: "About Us"),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Wrap(
                    runAlignment: WrapAlignment.spaceBetween,
                    alignment: WrapAlignment.center,
                    children: [
                      Container(
                        constraints: BoxConstraints(
                            maxWidth: width > 800 ? width / 2.5 : width),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "About Us\n",
                              style: themeData.textTheme.titleLarge,
                            ),
                            Text(
                              """Travelstay247 is an online travel agent company based in the UAE. We work with dedicated Suppliers around the globe who share our values and goals which is to provide exceptional customer service to our clients. We have put policies in place to ensure that our partners exceed the expectations of their clients, providing the highest value for money. Our success is not only due to our exceptional customer service which we pride ourselves in, but also about building and retaining good relationships with our clients over the long term.
                        
Our main drive and passion are to ensure our clients are satisfied with all the services we offer. Our optimum aim is your "goal" to provide the best travel services at a cheaper price and an outstanding customer service.
                        
When you book with Travelstay247, you will have access to our competitive rates, system reliability, incredible customer service, flexibility and ability to reach us 24/7.\n\n""",
                              softWrap: true,
                              style: themeData.textTheme.labelMedium,
                              textAlign: TextAlign.start,
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: width / 15,
                      ),
                      Container(
                        constraints: BoxConstraints(
                            maxWidth: width > 800 ? width / 2.5 : width),
                        child: const BeachImage(),
                      )
                    ],
                  ),
                  Text(
                    "\n\n Why Choose Us",
                    style: themeData.textTheme.displayLarge,
                  ),
                  SizedBox(
                    width: 175,
                    child: Divider(
                      thickness: 1,
                      color: themeData.primaryColor,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Text(
                      """\nWhen you book with Travelstay247, you will have access to our competitive rates of hotel services around the world, system reliability, incredible customer service, flexibility, and ability to reach us 24/7. We have values in place which makes us unique and different to other travel companies.""",
                      textAlign: TextAlign.center,
                      style: themeData.textTheme.labelMedium,
                    ),
                  ),
                  const Wrap(
                    children: [
                      InfoCard(
                          assetImage: "service-1.png",
                          title: "We Are Transparent",
                          description:
                              "Being transparent means doing the right thing for our clients. Book with us with confidence, we are transparent about our prices and the services we offer."),
                      InfoCard(
                          assetImage: "assets/service-2.png",
                          title: "We Put Our Clients First",
                          description:
                              "We are dedicated to putting our customers first and taking into consideration every feedback we receive from our clients, which is what made Travelstart247 a success story."),
                      InfoCard(
                          assetImage: "assets/service-3.png",
                          title: "We are Compassionate",
                          description:
                              "At Travelstay247, we are not just an online travel agency offering you the best services, but we are also flexible and compassionate about you as our clients. We will ensure we offer you the best services.")
                    ],
                  ),
                ],
              ),
            ),
            const TravelStayFooter(
              isUnbeatableStackShown: true,
            )
          ],
        ),
      ),
    );
  }
}
