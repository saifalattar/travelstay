import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import "package:travelstay/shared/sharedExtensions.dart";
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
        const SizedBox(
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
        future: context.read<TravelStayCubit>().getAvailableCities(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Container(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
              child: DropdownMenu(
                textStyle: themeData.textTheme.labelMedium,
                hintText: "Where are you going?",
                width: width > 800 ? width / 3.2 : width * 0.9,
                enableFilter: true,
                inputDecorationTheme: const InputDecorationTheme(
                  border: InputBorder.none,
                  filled: true,
                  fillColor: Colors.white,
                ),
                dropdownMenuEntries:
                    (context.read<TravelStayCubit>().state as SearchCities)
                        .resultCities,
                leadingIcon: const Icon(Icons.bed_outlined),
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
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}

class DateRangePicker extends StatefulWidget {
  const DateRangePicker({super.key});

  @override
  State<DateRangePicker> createState() => _DateRangePickerState();
}

String? checkInDate, checkOutDate;

class _DateRangePickerState extends State<DateRangePicker> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return BlocBuilder<TravelStayCubit, TravelStayStates>(
        builder: (context, state) {
      if (context.read<TravelStayCubit>().state is ChooseDateRange) {
        checkInDate = (context.read<TravelStayCubit>().state as ChooseDateRange)
            .start!
            .getDisplayedDate();

        checkOutDate =
            (context.read<TravelStayCubit>().state as ChooseDateRange)
                .end!
                .getDisplayedDate();
      }

      return InkWell(
        onTap: () async {
          context.read<TravelStayCubit>().chooseDateRange(context);
        },
        child: Container(
          height: 50,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.white),
          width: width > 800 ? width / 3.5 : width * 0.9,
          child: Row(
            children: [
              Icon(
                Icons.calendar_today_outlined,
                color: Colors.grey.shade800,
                size: 22,
              ),
              Text(
                "\t\t ${checkInDate ?? "Check-in date"} — ${checkOutDate ?? "Check-out date"}",
                style: checkInDate == null
                    ? themeData.textTheme.labelMedium
                    : themeData.textTheme.labelLarge,
              )
            ],
          ),
        ),
      );
    });
  }
}

int adults = 0;
int children = 0;
int rooms = 0;

class NumberOfPersons extends StatelessWidget {
  final void Function() onPressed;
  const NumberOfPersons({required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;

    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 50,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.white),
        width: width > 800 ? width / 3.5 : width * 0.9,
        child: Row(
          children: [
            Icon(
              Icons.person_outline_outlined,
              color: Colors.grey.shade800,
              size: 22,
            ),
            Text(
              "\t\t $adults adults . $children children . $rooms rooms",
              style: checkInDate == null
                  ? themeData.textTheme.labelMedium
                  : themeData.textTheme.labelLarge,
            )
          ],
        ),
      ),
    );
  }
}

bool isVisible = false;

class SearchForHotelsBar extends StatefulWidget {
  const SearchForHotelsBar({super.key});

  @override
  State<SearchForHotelsBar> createState() => _SearchForHotelsBarState();
}

class _SearchForHotelsBarState extends State<SearchForHotelsBar> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    List<Widget> children = [
      const SearchCityBar(),
      const SizedBox(
        height: 5,
      ),
      const DateRangePicker(),
      const SizedBox(
        height: 5,
      ),
      NumberOfPersons(
        onPressed: () {
          showDialog(
              context: context,
              builder: (c) {
                return const AlertDialog(
                    content: Column(
                  children: [
                    Row(
                      children: [Text("Adults")],
                    )
                  ],
                ));
              });
        },
      ),
      const SizedBox(
        height: 5,
      ),
      SizedBox(
        width: width > 1300 ? width / 15 : width * 0.91,
        height: 50,
        child: TravelStayButton(
          onPressed: () {},
          hasBorder: true,
          child: Text(
            "Search",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: themeData.textTheme.titleMedium,
          ),
        ),
      ),
    ];
    return Container(
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
          color: const Color(0xffffb700), //Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(15)),
      child: Wrap(
        runSpacing: 5,
        spacing: width > 800 ? 5 : 0,
        alignment: WrapAlignment.spaceBetween,
        runAlignment: WrapAlignment.spaceBetween,
        children: children,
      ),
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

class CountrySearchWidget extends StatelessWidget {
  const CountrySearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
