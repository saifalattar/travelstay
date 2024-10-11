import 'package:flutter/material.dart';
import 'package:travelstay/shared/sharedVariables.dart';
import 'package:travelstay/shared/sharedWidgets.dart';
import 'package:travelstay/views/Charity/components.dart';

class Charity extends StatelessWidget {
  const Charity({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      drawer: TravelStayDrawer(context),
      appBar: TravelStayAppBar(context: context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const MasjidBanner(title: "Supporting the needy"),
            Text(
              "\n\nSupporting the needy\n",
              style: themeData.textTheme.displayLarge,
            ),
            Text(
              "TravelStay247 is an online hotel booking service\n",
              style: themeData.textTheme.titleLarge,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Wrap(
                spacing: 5,
                alignment: WrapAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: width > 800 ? width * 0.75 : width,
                    child: Text(
                      """
TravelStay247 has a truly exceptional business model.
                        
The most satisfying feeling is when you book with us you know that you will have contributed towards a shelter for a homeless person.
                        
To help the homeless we promise to give 20% of our profit to certified and registered shelters charities aroud the world.
                        
If you would like to recommend a charity please complete the below providing as much information a possible one of our representatives will be in contact with you to discuss and thankyou.
                        """,
                      style: themeData.textTheme.labelMedium,
                    ),
                  ),
                  const CrisisImage()
                ],
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            Text(
              "Get In Touch",
              style: themeData.textTheme.displayLarge,
            ),
            SizedBox(
              width: 180,
              child: Divider(
                color: themeData.primaryColor,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            const CharityMessageContainer(),
            const SizedBox(
              height: 100,
            ),
            const TravelStayFooter(isUnbeatableStackShown: true)
          ],
        ),
      ),
    );
  }
}
