import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelstay/bloc/cubit.dart';
import 'package:travelstay/bloc/states.dart';
import 'package:travelstay/shared/sharedVariables.dart';

class LocationListTile extends StatelessWidget {
  final String? country, city, cityId;
  const LocationListTile(
      {super.key,
      required this.country,
      required this.city,
      required this.cityId});

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
          controller: context.read<TravelStayCubit>().searchCityController,
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
            if (query.length >= 3) {
              context
                  .read<TravelStayCubit>()
                  .getAvailableCities(lastSearch: lastQuery, city: query);
              lastQuery = query;
              context.read<TravelStayCubit>().index = entries.indexWhere(
                  (element) => element.label.toLowerCase().contains(query));
              if (context.read<TravelStayCubit>().index == -1) {
                return null;
              } else {
                return context.read<TravelStayCubit>().index;
              }
            }
            return null;
          },
        ),
      );
    });
  }
}

String? checkInDate, checkOutDate;
DateTime? checkIn, checkOut;
int adultsNumbers = 1;
int childrenNumbers = 0;
int roomsNumbers = 1;

bool isVisible = false;
