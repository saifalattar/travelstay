import 'package:flutter/material.dart';
import 'package:travelstay/shared/sharedVariables.dart';

class RecentCityWidget extends StatelessWidget {
  final String day, date, city;
  final int nights;
  const RecentCityWidget(
      {super.key,
      required this.day,
      required this.date,
      required this.nights,
      required this.city});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      constraints: const BoxConstraints(minWidth: 300),
      padding: const EdgeInsets.all(3),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              width: 100,
              height: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.red,
                borderRadius:
                    BorderRadius.horizontal(left: Radius.circular(30)),
              ),
              child: Center(
                child: Text(
                  "$day\n$date\n$nights Nights",
                  textAlign: TextAlign.center,
                  style: themeData.textTheme.headlineLarge,
                ),
              )),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Accomodation",
                style: themeData.textTheme.titleSmall,
              ),
              Text(
                city,
                style: themeData.textTheme.titleLarge,
              )
            ],
          ),
          const SizedBox(
            width: 30,
          ),
          const Icon(Icons.arrow_forward_ios)
        ],
      ),
    );
  }
}
