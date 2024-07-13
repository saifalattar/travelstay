import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelstay/bloc/cubit.dart';
import 'package:travelstay/bloc/states.dart';
import 'package:travelstay/shared/sharedVariables.dart';
import 'package:travelstay/shared/sharedWidgets.dart';

class LocationListTile extends StatelessWidget {
  final String? country, city;
  const LocationListTile(
      {super.key, required this.country, required this.city});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.location_pin,
          color: themeData.primaryColor,
        ),
        SizedBox(
          width: 15,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "$country",
              style: themeData.textTheme.titleSmall,
            ),
            Text("$city")
          ],
        )
      ],
    );
  }
}

class SearchCityBar extends StatelessWidget {
  const SearchCityBar({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;

    return FutureBuilder(
        future: TravelStayCubit.GET(context).getAvailableCities(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return BlocBuilder<TravelStayCubit, TravelStayStates>(
                builder: (context, state) {
              return DropdownMenu(
                hintText: "Where are you going?",
                width: width > 800 ? width / 3.5 : width * 0.9,
                enableFilter: true,
                inputDecorationTheme: InputDecorationTheme(
                  border: OutlineInputBorder(
                      gapPadding: 0,
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.white, width: 0)),
                  filled: true,
                  fillColor: Colors.white,
                ),
                dropdownMenuEntries:
                    (context.read<TravelStayCubit>().state as SearchCities)
                        .resultCities,
                leadingIcon: Icon(Icons.bed_outlined),
                enableSearch: true,
                searchCallback: (entries, query) {
                  int index = entries.indexWhere(
                      (element) => element.label.toLowerCase().contains(query));
                  if (index == -1) {
                    return null;
                  } else {
                    return index;
                  }
                },
              );
            });
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}

class SearchForHotelsBar extends StatelessWidget {
  const SearchForHotelsBar({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;

    List<Widget> children = [
      SearchCityBar(),
      SizedBox(
        height: 5,
      ),
      SearchCityBar(),
      SizedBox(
        height: 5,
      ),
      SearchCityBar(),
      SizedBox(
        height: 5,
      ),
      SizedBox(
        width: width > 800 ? 100 : width * 0.9,
        child: TravelStayButton(
          onPressed: () {},
          child: Text(
            "Search",
            style: themeData.textTheme.titleMedium,
          ),
          hasBorder: true,
        ),
      )
    ];
    return Container(
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
          color: Color(0xfffd7e14), //Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(15)),
      child: LayoutBuilder(builder: (context, constraints) {
        if (constraints.maxWidth < 800) {
          return Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: children);
        } else {
          return Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: children);
        }
      }),
    );
  }
}

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
      constraints: BoxConstraints(minWidth: 300),
      padding: EdgeInsets.all(3),
      margin: EdgeInsets.all(10),
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
              child: Center(
                child: Text(
                  "$day\n$date\n$nights Nights",
                  textAlign: TextAlign.center,
                  style: themeData.textTheme.headlineLarge,
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius:
                    BorderRadius.horizontal(left: Radius.circular(30)),
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
                "$city",
                style: themeData.textTheme.titleLarge,
              )
            ],
          ),
          SizedBox(
            width: 30,
          ),
          Icon(Icons.arrow_forward_ios)
        ],
      ),
    );
  }
}

class RecentSearches extends StatelessWidget {
  const RecentSearches({super.key});
  @override
  Widget build(BuildContext context) {
    ScrollController _scrollController = ScrollController();
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: double.infinity,
          margin: EdgeInsets.all(20),
          decoration: BoxDecoration(color: Colors.grey),
          child: SingleChildScrollView(
            controller: _scrollController,
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
                  await _scrollController.animateTo(
                      _scrollController.position.pixels - 250,
                      duration: Duration(seconds: 1),
                      curve: Curves.easeInOut);
                },
                icon: Icon(Icons.arrow_circle_left)),
            IconButton(
                onPressed: () async {
                  await _scrollController.animateTo(
                      _scrollController.position.pixels + 250,
                      duration: Duration(seconds: 1),
                      curve: Curves.easeInOut);
                },
                icon: Icon(Icons.arrow_circle_right))
          ],
        )
      ],
    );
  }
}
