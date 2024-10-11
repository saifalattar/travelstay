import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';

class CountrySearchWidget extends StatelessWidget {
  final String countryFlag, countryName, imageURL;
  const CountrySearchWidget(
      {super.key,
      required this.countryName,
      required this.countryFlag,
      required this.imageURL});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return Container(
      margin: const EdgeInsets.all(10),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      constraints: BoxConstraints(
          maxWidth: width < 700 ? width * 0.9 : width * 0.3,
          minWidth: width < 700 ? width * 0.8 : width * 0.2,
          minHeight: 50,
          maxHeight: 250),
      child: InkWell(
        onTap: () {},
        child: Stack(
          children: [
            Image.network(
              imageURL,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                children: [
                  Text(
                    "$countryName ",
                    style: const TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  CountryFlag.fromCountryCode(
                    countryFlag,
                    width: 30,
                    height: 20,
                    shape: const RoundedRectangle(5),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
