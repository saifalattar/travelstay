import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/web.dart';
import 'package:travelstay/shared/sharedWidgets.dart';
import 'package:travelstay/shared_prefrences.dart';
import 'package:travelstay/views/Hotels/view_model/cubit.dart';
import 'package:travelstay/views/Hotels/view_model/states.dart';
import 'package:travelstay/views/Hotels/widgets/hotel_card.dart';

class HotelsScreen extends StatefulWidget {
  const HotelsScreen({
    super.key,
  });

  @override
  State<HotelsScreen> createState() => _HotelsScreenState();
}

class _HotelsScreenState extends State<HotelsScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Map<dynamic, dynamic>? args;

    args = ModalRoute.of(context)?.settings.arguments as Map?;

    if (args == null) {
    } else {
      CacheHelper.saveDate(
          key: 'argsKey', value: jsonEncode(args)); // Convert Map to JSON
    }

    final argsJson = CacheHelper.getActualData(key: 'argsKey');
    args = Map<String, dynamic>.from(
        jsonDecode(argsJson)); // Convert JSON back to Map

    Logger().e(args);
    return BlocProvider(
      create: (context) => HotelsCubit()
        ..getAvailableHotels(
            cityId: args?["cityId"],
            checkIn: args?["checkInDate"],
            checkOut: args?["checkoutDate"],
            roomCount: args?["roomCount"],
            adultCount: args?["adultCount"],
            childCount: args?["childCount"],
            roomNum: args?["roomNum"],
            childAgeDetails: args?["childAgeDetails"],
            currency: args?["currency"],
            nationality: args?["nationality"]),
      child: BlocBuilder<HotelsCubit, HotelsStates>(builder: (context, state) {
        final cubit = HotelsCubit.get(context);
        Logger().e(MediaQuery.of(context).size.width);
        Logger().e(MediaQuery.of(context).size.height);
        return Scaffold(
          // key: scaffoldKey,
          appBar: TravelStayAppBar(
            context: context,
          ),
          drawer: TravelStayDrawer(context),
          body: state is HotelsInitialState
              ? const Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const MasjidBanner(title: "Hotels"),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${cubit.hotelApiResponse?.payload.priceDetails.hotelList.length ?? 0} Results Found",
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            const SizedBox(height: 20),
                            GridView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                childAspectRatio:
                                    MediaQuery.of(context).size.width >= 1200
                                        ? (MediaQuery.of(context).size.width /
                                                MediaQuery.of(context)
                                                    .size
                                                    .height) *
                                            0.72
                                        : (MediaQuery.of(context).size.width /
                                                MediaQuery.of(context)
                                                    .size
                                                    .height) *
                                            0.5,
                              ),
                              // Add itemCount to avoid index out of range issues
                              itemCount: cubit.hotelApiResponse?.payload
                                      .priceDetails.hotelList.length ??
                                  0,
                              itemBuilder: (context, index) {
                                Logger().e("a7aaaaaaaaaaaaaa");
                                return HotelCard(
                                    image: cubit
                                            .hotelApiResponse
                                            ?.payload
                                            .priceDetails
                                            .hotelList[index]
                                            .hotelDetailsList
                                            .imageUrl ??
                                        "",
                                    currency: cubit
                                            .hotelApiResponse
                                            ?.payload
                                            .priceDetails
                                            .hotelList[index]
                                            .ratePlanList[0]
                                            .currency ??
                                        "",
                                    mealTypeName: cubit
                                            .hotelApiResponse
                                            ?.payload
                                            .priceDetails
                                            .hotelList[index]
                                            .ratePlanList[0]
                                            .priceList[0]
                                            .mealType
                                            .name ??
                                        "",
                                    roomName: cubit
                                            .hotelApiResponse
                                            ?.payload
                                            .priceDetails
                                            .hotelList[index]
                                            .ratePlanList[0]
                                            .roomName ??
                                        "",
                                    hotelName: cubit
                                            .hotelApiResponse
                                            ?.payload
                                            .priceDetails
                                            .hotelList[index]
                                            .hotelName ??
                                        "",
                                    location: args!["cityName"] ?? "",
                                    pricePerNight: cubit.hotelApiResponse?.payload.priceDetails.hotelList[index].ratePlanList[0].priceList[0].price.toString() ?? "",
                                    price: cubit.hotelApiResponse?.payload.priceDetails.hotelList[index].ratePlanList[0].totalPrice.toString() ?? "");
                              },
                            ),
                            const SizedBox(height: 40),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
        );
      }),
    );
  }
}

// int getCrossAxisCount(BuildContext context) {
//   double screenWidth = MediaQuery.of(context).size.width;

//   // Adjust number of columns based on screen width
//   if (screenWidth >= 1200) {
//     return 3; // For larger screens, show 4 items per row
//   } else if (screenWidth >= 800) {
//     return 2; // For medium screens, show 3 items per row
//   } else {
//     return 1; // For small screens, show 2 items per row
//   }
// }

// double getChildAspectRatio(BuildContext context) {
//   double screenWidth = MediaQuery.of(context).size.width;
//   log("screen width: $screenWidth");
//   // Adjust aspect ratio based on screen width
//   if (screenWidth >= 1890) {
//     return MediaQuery.of(context).size.width * MediaQuery.of(context).size.height /; 
//   } else if (screenWidth >= 1515) {
//     return 1.2; // Default aspect ratio for medium screens
//   } else if (screenWidth >= 1270) {
//     return 1.0; // For smaller screens, slightly taller cards
//   } else if (screenWidth >= 800) {
//     return 0.7;
//   } else {
//     return 0.5;
//   }
// }
