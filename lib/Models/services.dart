import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:travelstay/shared/sharedVariables.dart';
import 'package:travelstay/views/Hotels/models/hotels_info.dart';
import 'package:http/http.dart' as http;

abstract class _ServiceProviderInterface {
  Future login_request({
    required String? userEmail,
    required String? password,
  });
  Future signup_request(
      {required String? userEmail,
      required String? password,
      required String? userFirstName,
      required String? userLastName});

  Future initiatePayment(
      {required double amount,
      required String paymentDescription,
      required String currency});

  Future send_support_form(
      {required String email, required String message, required String mobile});

  Future getAvailableRoom(
      {required String hotelId,
      required bool preBook,
      required String checkInDate,
      required String checkoutDate,
      required int numberOfRooms,
      required int adultCount,
      required int childCount,
      required int roomNum,
      required List childAgeDetails,
      required String currency,
      required String nationality,
      required String ratePlanId,
      required int provider,
      required bool needOnRequest});
  Future getAvailableCities_request({required String city});
}

class ServiceProvider implements _ServiceProviderInterface {
  HotelApiResponse? hotelApiResponse;
  @override
  Future login_request(
      {required String? userEmail, required String? password}) async {
    Response loggedUser = await Dio().post(
        'http://cloudcft.com:8048/api/authenticate',
        data: {"username": userEmail, "password": password});
    return loggedUser;
  }

  @override
  Future signup_request(
      {required String? userEmail,
      required String? password,
      required String? userFirstName,
      required String? userLastName}) async {
    print("dfdd");
    Response createUser =
        await Dio().post('http://cloudcft.com:8048/api/user/register', data: {
      "email": userEmail,
      "firstName": userFirstName,
      "lastName": userLastName,
      "password": password
    });
    return createUser;
  }

  @override
  @override
  Future getAvailableCities_request({required String city}) async {
    Response response = await Dio().get(
        "https://travelstay247.co.uk/hotel/api/util/cities/by-name?name=$city");
    return response;
  }

  @override
  Future getAvailableRoom(
      {required String hotelId,
      required bool preBook,
      required String checkInDate,
      required String checkoutDate,
      required int numberOfRooms,
      required int adultCount,
      required int childCount,
      required int roomNum,
      required List childAgeDetails,
      required String currency,
      required String nationality,
      required String ratePlanId,
      required int provider,
      required bool needOnRequest}) async {}

  @override
  Future send_support_form(
      {required String email,
      required String message,
      required String mobile}) async {
    Response response = await Dio().post(
        "http://cloudcft.com:8048/api/auth/user/support",
        options: Options(headers: {"authorization": "Bearer $USERTOKEN"}),
        data: {
          "subject": "Account issue",
          "email": email,
          "mobile": mobile,
          "message": message
        });
    return response;
  }

  @override
  Future initiatePayment(
      {required double amount,
      required String paymentDescription,
      required String currency}) async {
    var response = await http.post(
        Uri.http("cloudcft.com:8048", "/api/payment/telr/initiate"),
        headers: {
          "Authorization": "Bearer $USERTOKEN",
          "Content-Type": "application/json"
        },
        body: jsonEncode({
          "amount": "$amount",
          "currency": currency,
          "description": paymentDescription,
          "email": USEREMAIL.toString()
        }));
    return response;
  }
}
