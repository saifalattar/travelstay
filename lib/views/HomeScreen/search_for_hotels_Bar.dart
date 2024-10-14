import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelstay/bloc/cubit.dart';
import 'package:travelstay/bloc/states.dart';
import 'package:travelstay/bloc_currency_nat/cubit.dart';
import 'package:travelstay/shared/sharedFunctions.dart';
import 'package:travelstay/shared/sharedVariables.dart';
import 'package:travelstay/shared/sharedWidgets.dart';
import 'package:travelstay/shared_prefrences.dart';
import 'package:travelstay/views/HomeScreen/components.dart';
import 'package:travelstay/views/HomeScreen/date_range.dart';
import 'package:travelstay/views/HomeScreen/number_of_persons.dart';

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
                                                      TravelStayCubit.get(
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
                                              TravelStayCubit.get(context)
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
                                                      TravelStayCubit.get(
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
                                              TravelStayCubit.get(context)
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
                                                      TravelStayCubit.get(
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
                                              TravelStayCubit.get(context)
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
          onPressed: () {
            String cityId = TravelStayCubit.get(context)
                .response!
                .data["payload"]["cities"]["content"]
                .where((element) => element["name"].toString().contains(
                    TravelStayCubit.get(context).searchCityController.text))
                .first["id"];
            final List<int> childAgeDetails = [];
            DateTime dateCheckInOnly =
                DateTime(checkIn!.year, checkIn!.month, checkIn!.day);
            DateTime dateCheckOutOnly =
                DateTime(checkOut!.year, checkOut!.month, checkOut!.day);
            String formattedCheckInDate =
                "${dateCheckInOnly.year}-${dateCheckInOnly.month.toString().padLeft(2, '0')}-${dateCheckInOnly.day.toString().padLeft(2, '0')}";

            String formattedCheckOutDate =
                "${dateCheckOutOnly.year}-${dateCheckOutOnly.month.toString().padLeft(2, '0')}-${dateCheckOutOnly.day.toString().padLeft(2, '0')}";
            Functions.navigateWithInSameTab(context, "/Hotels", query: {
              "cityId": cityId,
              "checkInDate": formattedCheckInDate,
              "checkoutDate": formattedCheckOutDate,
              "roomCount": roomsNumbers,
              "adultCount": adultsNumbers,
              "childCount": childrenNumbers,
              "roomNum": roomsNumbers,
              "childAgeDetails": childAgeDetails,
              'cityName':
                  context.read<TravelStayCubit>().searchCityController.text,
              "currency": CacheHelper.getData(key: "currency")
                  ? CacheHelper.getActualData(key: "currency")
                  : context.read<BlocCurrenciesNatCubit>().selectedCurrency,
              "nationality": CacheHelper.getData(key: "nationality")
                  ? CacheHelper.getActualData(key: "nationality")
                  : context.read<BlocCurrenciesNatCubit>().selectedNationality
            });
          },
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
