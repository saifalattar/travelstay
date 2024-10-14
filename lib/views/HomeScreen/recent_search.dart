import 'package:flutter/material.dart';
import 'package:travelstay/views/HomeScreen/recent_city.dart';

class RecentSearches extends StatelessWidget {
  const RecentSearches({super.key});
  @override
  Widget build(BuildContext context) {
    ScrollController scrollController = ScrollController();
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: double.infinity,
          margin: const EdgeInsets.all(20),
          decoration: const BoxDecoration(color: Colors.grey),
          child: SingleChildScrollView(
            controller: scrollController,
            scrollDirection: Axis.horizontal,
            child: const Row(
              children: [
                RecentCityWidget(
                    day: "Tue", date: "4 July 2024", nights: 6, city: "Dubai"),
                RecentCityWidget(
                    day: "Tue", date: "4 July 2024", nights: 6, city: "Dubai"),
                RecentCityWidget(
                    day: "Tue", date: "4 July 2024", nights: 6, city: "Dubai"),
                RecentCityWidget(
                    day: "Tue", date: "4 July 2024", nights: 6, city: "Dubai"),
                RecentCityWidget(
                    day: "Tue", date: "4 July 2024", nights: 6, city: "Dubai"),
                RecentCityWidget(
                    day: "Tue", date: "4 July 2024", nights: 6, city: "Dubai")
              ],
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () async {
                  await scrollController.animateTo(
                      scrollController.position.pixels - 250,
                      duration: const Duration(seconds: 1),
                      curve: Curves.easeInOut);
                },
                icon: const Icon(Icons.arrow_circle_left)),
            IconButton(
                onPressed: () async {
                  await scrollController.animateTo(
                      scrollController.position.pixels + 250,
                      duration: const Duration(seconds: 1),
                      curve: Curves.easeInOut);
                },
                icon: const Icon(Icons.arrow_circle_right))
          ],
        )
      ],
    );
  }
}
