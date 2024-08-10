import 'package:country_flags/country_flags.dart';
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
    String lastQuery = "";
    return BlocBuilder<TravelStayCubit, TravelStayStates>(
        builder: (context, state) {
      return Container(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        child: DropdownMenu(
          textStyle: themeData.textTheme.labelLarge,
          hintText: "Where are you going?",
          width: width > 800 ? width / 3.2 : width * 0.9,
          enableFilter: true,
          inputDecorationTheme: const InputDecorationTheme(
            border: InputBorder.none,
            filled: true,
            fillColor: Colors.white,
          ),
          dropdownMenuEntries:
              (context.read<TravelStayCubit>().state is SearchCities)
                  ? (context.read<TravelStayCubit>().state as SearchCities)
                      .resultCities
                  : [],
          leadingIcon: const Icon(Icons.bed_outlined),
          enableSearch: true,
          searchCallback: (entries, query) {
            context
                .read<TravelStayCubit>()
                .getAvailableCities(lastSearch: lastQuery, city: query);
            lastQuery = query;
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

int adultsNumbers = 1;
int childrenNumbers = 0;
int roomsNumbers = 1;

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
            BlocBuilder<TravelStayCubit, TravelStayStates>(
                builder: (context, state) {
              return Text(
                "\t\t $adultsNumbers adults . $childrenNumbers children . $roomsNumbers rooms",
                style: checkInDate == null
                    ? themeData.textTheme.labelMedium
                    : themeData.textTheme.labelLarge,
              );
            })
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
                return AlertDialog(
                    backgroundColor: Colors.white,
                    content: SizedBox(
                      height: 250,
                      width: 300,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Adults : ",
                                    style: themeData.textTheme.labelLarge,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 0.5, color: Colors.black),
                                        borderRadius: BorderRadius.circular(4)),
                                    child: Row(
                                      children: [
                                        BlocBuilder<TravelStayCubit,
                                                TravelStayStates>(
                                            builder: (context, state) {
                                          if (context
                                              .read<TravelStayCubit>()
                                              .state is AdultsNumber) {
                                            adultsNumbers = (context
                                                    .read<TravelStayCubit>()
                                                    .state as AdultsNumber)
                                                .number!;
                                          }
                                          return IconButton(
                                              color: themeData.primaryColor,
                                              disabledColor: Colors.grey,
                                              onPressed: adultsNumbers == 1
                                                  ? null
                                                  : () {
                                                      TravelStayCubit.GET(
                                                              context)
                                                          .updateAdultNumber(
                                                              adultsNumbers,
                                                              false);
                                                    },
                                              icon: const Icon(
                                                Icons.remove,
                                              ));
                                        }),
                                        BlocBuilder<TravelStayCubit,
                                                TravelStayStates>(
                                            builder: (ctx, state) {
                                          if (context
                                              .read<TravelStayCubit>()
                                              .state is AdultsNumber) {
                                            adultsNumbers = (context
                                                    .read<TravelStayCubit>()
                                                    .state as AdultsNumber)
                                                .number!;
                                          }
                                          return Text(
                                            "  $adultsNumbers  ",
                                            style:
                                                themeData.textTheme.labelLarge,
                                          );
                                        }),
                                        IconButton(
                                            color: themeData.primaryColor,
                                            disabledColor: Colors.grey,
                                            onPressed: () {
                                              TravelStayCubit.GET(context)
                                                  .updateAdultNumber(
                                                      adultsNumbers, true);
                                            },
                                            icon: const Icon(
                                              Icons.add,
                                            )),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Children : ",
                                    style: themeData.textTheme.labelLarge,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 0.5, color: Colors.black),
                                        borderRadius: BorderRadius.circular(4)),
                                    child: Row(
                                      children: [
                                        BlocBuilder<TravelStayCubit,
                                                TravelStayStates>(
                                            builder: (context, state) {
                                          if (context
                                              .read<TravelStayCubit>()
                                              .state is ChildrenNumber) {
                                            childrenNumbers = (context
                                                    .read<TravelStayCubit>()
                                                    .state as ChildrenNumber)
                                                .number!;
                                          }
                                          return IconButton(
                                              color: themeData.primaryColor,
                                              disabledColor: Colors.grey,
                                              onPressed: childrenNumbers == 0
                                                  ? null
                                                  : () {
                                                      TravelStayCubit.GET(
                                                              context)
                                                          .updateChildrenNumber(
                                                              childrenNumbers,
                                                              false);
                                                    },
                                              icon: const Icon(
                                                Icons.remove,
                                              ));
                                        }),
                                        BlocBuilder<TravelStayCubit,
                                                TravelStayStates>(
                                            builder: (ctx, state) {
                                          if (context
                                              .read<TravelStayCubit>()
                                              .state is ChildrenNumber) {
                                            childrenNumbers = (context
                                                    .read<TravelStayCubit>()
                                                    .state as ChildrenNumber)
                                                .number!;
                                          }
                                          return Text(
                                            "  $childrenNumbers  ",
                                            style:
                                                themeData.textTheme.labelLarge,
                                          );
                                        }),
                                        IconButton(
                                            color: themeData.primaryColor,
                                            disabledColor: Colors.grey,
                                            onPressed: () {
                                              TravelStayCubit.GET(context)
                                                  .updateChildrenNumber(
                                                      childrenNumbers, true);
                                            },
                                            icon: const Icon(
                                              Icons.add,
                                            )),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Rooms : ",
                                    style: themeData.textTheme.labelLarge,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 0.5, color: Colors.black),
                                        borderRadius: BorderRadius.circular(4)),
                                    child: Row(
                                      children: [
                                        BlocBuilder<TravelStayCubit,
                                                TravelStayStates>(
                                            builder: (context, state) {
                                          if (context
                                              .read<TravelStayCubit>()
                                              .state is RoomsNumber) {
                                            roomsNumbers = (context
                                                    .read<TravelStayCubit>()
                                                    .state as RoomsNumber)
                                                .number!;
                                          }
                                          return IconButton(
                                              color: themeData.primaryColor,
                                              disabledColor: Colors.grey,
                                              onPressed: roomsNumbers == 1
                                                  ? null
                                                  : () {
                                                      TravelStayCubit.GET(
                                                              context)
                                                          .updateRoomNumber(
                                                              roomsNumbers,
                                                              false);
                                                    },
                                              icon: const Icon(
                                                Icons.remove,
                                              ));
                                        }),
                                        BlocBuilder<TravelStayCubit,
                                                TravelStayStates>(
                                            builder: (ctx, state) {
                                          if (context
                                              .read<TravelStayCubit>()
                                              .state is RoomsNumber) {
                                            roomsNumbers = (context
                                                    .read<TravelStayCubit>()
                                                    .state as RoomsNumber)
                                                .number!;
                                          }
                                          return Text(
                                            "  $roomsNumbers  ",
                                            style:
                                                themeData.textTheme.labelLarge,
                                          );
                                        }),
                                        IconButton(
                                            color: themeData.primaryColor,
                                            disabledColor: Colors.grey,
                                            onPressed: () {
                                              TravelStayCubit.GET(context)
                                                  .updateRoomNumber(
                                                      roomsNumbers, true);
                                            },
                                            icon: const Icon(
                                              Icons.add,
                                            )),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                          TravelStayButton(
                              color: themeData.primaryColor,
                              hasBorder: true,
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                "Done",
                                style: themeData.textTheme.titleMedium,
                              ))
                        ],
                      ),
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
          color: themeData.primaryColor,
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
