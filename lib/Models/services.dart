import 'package:dio/dio.dart';
import 'package:travelstay/views/Hotels/models/hotels_info.dart';

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
        'https://travelstay247.co.uk/api/authenticate/',
        data: {"username": userEmail, "password": password});
    return loggedUser;
  }

  @override
  Future signup_request(
      {required String? userEmail,
      required String? password,
      required String? userFirstName,
      required String? userLastName}) async {
    Response createUser = await Dio()
        .post('https://travelstay247.co.uk/api/user/register', data: {
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
}
