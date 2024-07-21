import 'package:animated_rating_stars/animated_rating_stars.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:travelstay/shared/sharedVariables.dart';
import 'package:travelstay/shared/sharedWidgets.dart';

class HotelWidget extends StatelessWidget {
  final String title,
      location,
      typeOfReservation,
      typeOfRoom,
      date,
      typeOfRefunding;
  final double fromPrice, totalPrice;
  final int rating;
  final List<String> images;
  const HotelWidget(
      {super.key,
      required this.title,
      required this.typeOfReservation,
      required this.typeOfRoom,
      required this.date,
      required this.typeOfRefunding,
      required this.fromPrice,
      required this.totalPrice,
      required this.rating,
      required this.images,
      required this.location});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return InkWell(
      onTap: () {
        // var i = ["dwdw", "ekkrj"];
        // Uri url = Uri(
        //     path: "/HotelDetails",
        //     queryParameters: {"data": i, "name": "saif"});
        // print(url);
        // Functions.navigateWithNewTab("$url");
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        constraints:
            BoxConstraints(maxWidth: width > 800 ? width * 0.5 : width * 0.7),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSlider(
                items: images.map((e) => Image.network(e)).toList(),
                options: CarouselOptions()),
            Text(title, style: themeData.textTheme.labelLarge),
            AnimatedRatingStars(
                starSize: 20,
                initialRating: double.parse("$rating"),
                readOnly: true,
                onChanged: (value) {},
                customFilledIcon: Icons.star,
                filledColor: Colors.yellow.shade600,
                emptyColor: Colors.grey,
                customHalfFilledIcon: Icons.star_half,
                customEmptyIcon: Icons.star_outline_outlined),
            Text("$location\n", style: themeData.textTheme.labelMedium),
            Row(
              children: [
                Icon(
                  Icons.restaurant,
                  color: themeData.secondaryHeaderColor,
                  size: 18,
                ),
                Text("  $typeOfReservation",
                    style: themeData.textTheme.labelMedium),
              ],
            ),
            Row(
              children: [
                Icon(
                  Icons.bed,
                  color: themeData.secondaryHeaderColor,
                  size: 18,
                ),
                Text("  $typeOfRoom", style: themeData.textTheme.labelMedium),
              ],
            ),
            Row(
              children: [
                Icon(
                  Icons.calendar_month,
                  color: themeData.secondaryHeaderColor,
                  size: 18,
                ),
                Text("  $date", style: themeData.textTheme.labelMedium),
              ],
            ),
            Divider(
              color: Colors.grey.shade300,
            ),
            SizedBox(
              width: width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("from \$$fromPrice per night",
                      style: themeData.textTheme.displayMedium),
                  Text("\$$totalPrice Total Price\n",
                      style: themeData.textTheme.labelLarge),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: const Color(0xFF81C784),
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(typeOfRefunding,
                        style: themeData.textTheme.bodyMedium),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: double.infinity,
              child: TravelStayButton(
                onPressed: () {},
                color: Colors.black.withOpacity(0.75),
                child:
                    Text("See Details", style: themeData.textTheme.bodyMedium),
              ),
            ),
            const SizedBox(height: 5),
            SizedBox(
                width: double.infinity,
                child: TravelStayButton(
                    onPressed: () {},
                    child: Text("Add To List",
                        style: themeData.textTheme.bodyMedium)))
          ],
        ),
      ),
    );
  }
}

class HotelFullScreen extends StatelessWidget {
  final Map<String, List> i;
  const HotelFullScreen({super.key, required this.i});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text(
        "${i["data"].runtimeType}",
        style: const TextStyle(color: Colors.red, fontSize: 40),
      ),
    );
  }
}
