import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/web.dart';
import 'package:travelstay/shared/sharedExtensions.dart';
import 'package:travelstay/shared/sharedFunctions.dart';
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
          key: 'argsHotelKey', value: jsonEncode(args)); // Convert Map to JSON
    }

    final argsJson = CacheHelper.getActualData(key: 'argsHotelKey');
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
        Logger().e("Screen Width is:${MediaQuery.of(context).size.width}");
        Logger().e("Screen Height is:${MediaQuery.of(context).size.height}");
        Logger()
            .e("Aspect Ratio is:${MediaQuery.of(context).size.aspectRatio}");
        Logger().e(state.toString());

        return PopScope(
          onPopInvokedWithResult: (didPop, result) {
            if (didPop) {
              CacheHelper.removeData(key: "argsHotelKey");
              Logger().e("agjj");
            }
          },
          child: Scaffold(
            // key: scaffoldKey,
            appBar: TravelStayAppBar(
              context: context,
            ),
            drawer: TravelStayDrawer(context),
            body: state is HotelsInitialState || state is HotelsLoadingState
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
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount:
                                            MediaQuery.of(context).size.width <
                                                    750
                                                ? 2
                                                : 3,
                                        childAspectRatio:
                                            MediaQuery.of(context).size.height <
                                                    600
                                                ? 0.6
                                                : MediaQuery.of(context)
                                                        .size
                                                        .aspectRatio *
                                                    .6,
                                        // crossAxisSpacing: 10,
                                        mainAxisSpacing: 10),

                                itemCount: cubit.hotelApiResponse?.payload
                                        .priceDetails.hotelList.length ??
                                    1, // total number of items
                                itemBuilder: (context, index) {
                                  if (state is HotelsErrorState) {
                                    return null;
                                  } else {
                                    return HotelCard(
                                        onPressed: () {
                                          Functions.navigateWithNewTabQuery(
                                              context, "/HotelDetails", {
                                            "HotelId": cubit
                                                .hotelApiResponse
                                                ?.payload
                                                .priceDetails
                                                .hotelList[index]
                                                .hotelId
                                          });
                                        },
                                        image: cubit
                                                .hotelApiResponse
                                                ?.payload
                                                .priceDetails
                                                .hotelList[0]
                                                .hotelDetailsList
                                                .imageUrl ??
                                            "",
                                        currency: cubit
                                                .hotelApiResponse
                                                ?.payload
                                                .priceDetails
                                                .hotelList[0]
                                                .ratePlanList[0]
                                                .currency ??
                                            "",
                                        mealTypeName: cubit
                                                .hotelApiResponse
                                                ?.payload
                                                .priceDetails
                                                .hotelList[0]
                                                .ratePlanList[0]
                                                .priceList[0]
                                                .mealType
                                                .name ??
                                            "",
                                        roomName: cubit
                                                .hotelApiResponse
                                                ?.payload
                                                .priceDetails
                                                .hotelList[0]
                                                .ratePlanList[0]
                                                .roomName ??
                                            "",
                                        hotelName: cubit
                                                .hotelApiResponse
                                                ?.payload
                                                .priceDetails
                                                .hotelList[0]
                                                .hotelName ??
                                            "",
                                        checkInDate:
                                            cubit.hotelApiResponse?.payload.priceDetails.checkInDate.getDisplayedDate() ?? "",
                                        checkOutDate: cubit.hotelApiResponse?.payload.priceDetails.checkOutDate.getDisplayedDate() ?? "",
                                        location: args?["cityName"] ?? "",
                                        pricePerNight: cubit.hotelApiResponse?.payload.priceDetails.hotelList[0].ratePlanList[0].priceList[0].price.toString() ?? "",
                                        price: cubit.hotelApiResponse?.payload.priceDetails.hotelList[0].ratePlanList[0].totalPrice.toString() ?? "");
                                  }
                                },
                              ),
                              const SizedBox(height: 40),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
          ),
        );
      }),
    );
  }
}
