import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelstay/Models/localDatabase.dart';
import 'package:travelstay/Models/services.dart';
import 'package:travelstay/bloc/states.dart';
import 'package:travelstay/shared/sharedVariables.dart';
import 'package:travelstay/views/HomeScreen/components.dart';

class TravelStayCubit extends Cubit<TravelStayStates> {
  TravelStayCubit() : super(InitialState());
  final ServiceProvider _services = ServiceProvider();

  static TravelStayCubit get(context) =>
      BlocProvider.of<TravelStayCubit>(context);

  TextEditingController searchCityController = TextEditingController();

  Future isSignedIn() async {
    var localData = LocalData();
    if (await localData.containsKey("token")) {
      USERTOKEN = await localData.getData("token");
      USEREMAIL = await localData.getData("email");
      print("true");

      return true;
    } else {
      print("FALSE");
      return false;
    }
  }

  Future get signOut async {
    LocalData localData = LocalData();
    await localData.deleteAll();
  }

  Future<Map?> logIn({
    required String? userEmail,
    required String? password,
  }) async {
    Map? response;

    await _services
        .login_request(userEmail: userEmail, password: password)
        .then((value) async {
      response = {"success": true, "token": value.data["payload"]["token"]};
      LocalData localData = LocalData();
      await localData.saveData("token", "${response!["token"]}");
      await localData.saveData("email", "$userEmail");
      USERTOKEN = response!["token"];
      USEREMAIL = userEmail;
    }).catchError((onError) {
      print(onError.response.data);
      response = {"success": false, "error": "Wrong email or password"};
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

  Future forgotPassword({required String? userEmail}) async {
    Response response = await _services.forgot_password(userEmail: userEmail);
    return response;
  }

  Response? response;
  List<DropdownMenuEntry>? resultCities;
  String? cityId;
  int? index;
  Future<void> getAvailableCities(
      {required String lastSearch, required String city}) async {
    if (lastSearch != city) {
      response = await _services.getAvailableCities_request(city: city);
      resultCities =
          (response?.data["payload"]["cities"]["content"] as List).map((val) {
        return DropdownMenuEntry(
            labelWidget: LocationListTile(
                cityId: val["id"],
                country: val["country"]["name"],
                city: val["name"]),
            value: val["country"]["name"],
            label: val["name"]);
      }).toList();

      emit(SearchCities(resultCities: resultCities!));
    }
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

  Future sendSupportForm(
      {required String email,
      required String message,
      required String mobile}) async {
    Response response = await _services.send_support_form(
        email: email, message: message, mobile: mobile);
    return response;
  }

  Future sendFeedbackForm(
      {required String email,
      required String message,
      required String mobile}) async {
    Response response = await _services.send_feedback_form(
        email: email, message: message, mobile: mobile);
    return response;
  }

  Future initiatePayment(
      {required double amount,
      required String paymentDescription,
      required String currency}) async {
    var response = await _services.initiatePayment(
        amount: amount,
        paymentDescription: paymentDescription,
        currency: currency);
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
