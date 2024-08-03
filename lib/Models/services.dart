import 'package:dio/dio.dart';

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
  Future getAvailableHotels_request();
  Future getAvailableCities_request();
}

class ServiceProvider implements _ServiceProviderInterface {
  // This class is going to be one of our data models
  // that any API call will be executed here and return its response
  // to our View-Model which will be our cubit class

  @override
  Future login_request(
      {required String? userEmail, required String? password}) async {
    Response loggedUser = await Dio().post(
        'http://cloudcft.com:8048/api/authenticate/',
        data: {"username": userEmail, "password": password});
    return loggedUser;
  }

  @override
  Future signup_request(
      {required String? userEmail,
      required String? password,
      required String? userFirstName,
      required String? userLastName}) async {
    Response createUser =
        await Dio().post('http://cloudcft.com:8048/api/user/register/', data: {
      "email": userEmail,
      "firstName": userFirstName,
      "lastName": userLastName,
      "password": password
    });
    return createUser;
  }

  @override
  Future getAvailableHotels_request() async {}

  @override
  Future getAvailableCities_request() async {}
}
