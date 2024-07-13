import 'dart:html';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelstay/Models/services.dart';
import 'package:travelstay/bloc/states.dart';
import 'package:travelstay/views/HomeScreen/components.dart';

class TravelStayCubit extends Cubit<TravelStayStates> {
  TravelStayCubit() : super(InitialState());
  final ServiceProvider _services = ServiceProvider();

  static TravelStayCubit GET(context) =>
      BlocProvider.of<TravelStayCubit>(context);

  Future logIn() async {
    Response response = await _services.login_request();
    // Some logic
  }

  Future signUp() async {
    Response response = await _services.signup_request();
    // Some logic
  }

  Future getAvailableHotels() async {
    Response response = await _services.getAvailableHotels_request();
    // Some logic
  }

  Future<void> getAvailableCities() async {
    // List<String> resultCities = await _services.getAvailableCities_request();
    List<DropdownMenuEntry> resultCities = [
      DropdownMenuEntry(
          value: "Dubai",
          label: "Dubai",
          labelWidget: LocationListTile(country: "UAE", city: "Dubai")),
      DropdownMenuEntry(
          value: "Cairo",
          label: "Cairo",
          labelWidget: LocationListTile(country: "Egypt", city: "Cairo")),
      DropdownMenuEntry(
          value: "Mekkah",
          label: "MEkkah",
          labelWidget:
              LocationListTile(country: "Saudi Arabia", city: "Mekkah")),
    ];

    emit(SearchCities(resultCities: resultCities));
  }
}
