import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/web.dart';
import 'package:travelstay/shared/sharedWidgets.dart';
import 'package:travelstay/shared_prefrences.dart';
import 'package:travelstay/views/Hotels_Details/view_model/cubit.dart';
import 'package:travelstay/views/Hotels_Details/view_model/states.dart';

class HotelDetailsScreen extends StatelessWidget {
  const HotelDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Map<dynamic, dynamic>? args;

    args = ModalRoute.of(context)?.settings.arguments as Map?;
    Logger().e(args);
    if (args == null) {
    } else {
      CacheHelper.saveDate(
          key: 'argsHotelDetailsKey',
          value: jsonEncode(args)); // Convert Map to JSON
    }

    final argsJson = CacheHelper.getActualData(key: 'argsHotelDetailsKey');
    args = Map<String, dynamic>.from(jsonDecode(argsJson));
    return BlocProvider(
      create: (context) => HotelDetailsCubit()..init(hotelId: args!["hotelId"]),
      child: BlocBuilder<HotelDetailsCubit, HotelDetailsStates>(
          builder: (context, state) {
        final cubit = HotelDetailsCubit.get(context);
        Logger().d(state);
        Logger().d(cubit.hotelImagesResponse);
        Logger().d(cubit.hotelPoliciesResponse);

        return PopScope(
          onPopInvokedWithResult: (didPop, result) {
            if (didPop) {
              CacheHelper.removeData(key: "argsHotelDetailsKey");
            }
          },
          child: Scaffold(
            appBar: TravelStayAppBar(
              context: context,
            ),
            drawer: TravelStayDrawer(context),
            body: state is HotelsDetailsLoadingState ||
                    state is HotelsPoliciesLoadingState ||
                    state is HotelsImagesLoadingState ||
                    state is HotelDetailsInitial
                ? const Center(child: CircularProgressIndicator())
                : Container(),
          ),
        );
      }),
    );
  }
}
