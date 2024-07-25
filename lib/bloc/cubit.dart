import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelstay/Models/services.dart';
import 'package:travelstay/bloc/states.dart';
import 'package:travelstay/shared/sharedVariables.dart';
import 'package:travelstay/views/HomeScreen/components.dart';

class TravelStayCubit extends Cubit<TravelStayStates> {
  TravelStayCubit() : super(InitialState());
  final ServiceProvider _services = ServiceProvider();

  static TravelStayCubit GET(context) =>
      BlocProvider.of<TravelStayCubit>(context);

  Future<Map?> logIn({
    required String? userEmail,
    required String? password,
  }) async {
    Map? response;

    await _services
        .login_request(userEmail: userEmail, password: password)
        .then((value) {
      response = {"success": true, "token": value.data["payload"]["token"]};
    }).catchError((onError) {
      print(onError.response.data);
      response = {"success": false, "error": "E-mail doesn't exists"};
    });
    return response;
  }

  Future<Map?> signUp(
      {required String? userEmail,
      required String? password,
      required String? userFirstName,
      required String? userLastName}) async {
    Map? response;
    await _services
        .signup_request(
            userEmail: userEmail,
            userFirstName: userFirstName,
            password: password,
            userLastName: userLastName)
        .then((value) {
      response = {"success": true};
    }).catchError((onError) {
      if (onError.response.statusCode == 400) {
        response = {"success": false, "error": "E-mail already exists"};
      } else {
        response = {
          "success": false,
          "error": "Something error happened, Try again later or contact us"
        };
      }
    });
    return response;
  }

  Future getAvailableHotels() async {
    Response response = await _services.getAvailableHotels_request();
    // Some logic
  }

  Future<void> getAvailableCities() async {
    // List<String> resultCities = await _services.getAvailableCities_request();
    List<DropdownMenuEntry> resultCities = [
      const DropdownMenuEntry(
          value: "Dubai",
          label: "Dubai",
          labelWidget: LocationListTile(country: "UAE", city: "Dubai")),
      const DropdownMenuEntry(
          value: "Cairo",
          label: "Cairo",
          labelWidget: LocationListTile(country: "Egypt", city: "Cairo")),
      const DropdownMenuEntry(
          value: "Mekkah",
          label: "MEkkah",
          labelWidget:
              LocationListTile(country: "Saudi Arabia", city: "Mekkah")),
    ];

    emit(SearchCities(resultCities: resultCities));
  }

  Future chooseDateRange(BuildContext context) async {
    await showCalendarDatePicker2Dialog(
      context: context,
      config: CalendarDatePicker2WithActionButtonsConfig(
          firstDate: DateTime.now(),
          selectedDayHighlightColor: themeData.primaryColor,
          selectedRangeHighlightColor: themeData.primaryColor.withOpacity(0.2),
          calendarType: CalendarDatePicker2Type.range),
      dialogSize: Size(context.size!.width * 0.8, context.size!.width * 0.8),
      value: [],
      borderRadius: BorderRadius.circular(15),
    ).then((value) {
      if (value != null) {
        emit(ChooseDateRange(start: value[0], end: value[1]));
      }
    });
  }

  void updateAdultNumber(int number, bool isIncrement) {
    isIncrement ? number += 1 : number -= 1;
    emit(AdultsNumber(number: number));
  }

  void updateChildrenNumber(int number, bool isIncrement) {
    isIncrement ? number += 1 : number -= 1;
    emit(ChildrenNumber(number: number));
  }

  void updateRoomNumber(int number, bool isIncrement) {
    isIncrement ? number += 1 : number -= 1;
    emit(RoomsNumber(number: number));
  }

  void updatePasswordVisibility(bool value) {
    emit(PasswordVisibility(value: value));
  }
}
