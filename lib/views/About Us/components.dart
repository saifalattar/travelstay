import 'package:flutter/material.dart';
import 'package:travelstay/shared/sharedVariables.dart';

class BeachImage extends StatelessWidget {
  const BeachImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset("assets/abour_right.png");
  }
}

class InfoCard extends StatelessWidget {
  final String assetImage, title, description;
  const InfoCard(
      {super.key,
      required this.assetImage,
      required this.title,
      required this.description});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return Container(
      padding: const EdgeInsets.all(50),
      margin: const EdgeInsets.all(25),
      decoration: BoxDecoration(
          border: Border.all(width: 0.5, color: Colors.grey.shade400),
          borderRadius: BorderRadius.circular(10)),
      constraints:
          BoxConstraints(maxWidth: width < 800 ? width * 0.90 : width / 3.5),
      child: Column(
        children: [
          Image.asset(assetImage),
          Text(
            "\n$title",
            style: themeData.textTheme.titleLarge,
          ),
          SizedBox(
            width: 175,
            child: Divider(
              thickness: 1,
              color: themeData.primaryColor,
            ),
          ),
          Text(
            "\n$description",
            style: themeData.textTheme.labelMedium,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
