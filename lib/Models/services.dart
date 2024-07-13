abstract class _ServiceProviderInterface {
  Future login_request();
  Future signup_request();
  Future getAvailableHotels_request();
  Future getAvailableCities_request();
}

class ServiceProvider implements _ServiceProviderInterface {
  // This class is going to be one of our data models
  // that any API call will be executed here and return its response
  // to our View-Model which will be our cubit class

  @override
  Future login_request() async {}

  @override
  Future signup_request() async {}

  @override
  Future getAvailableHotels_request() async {}

  @override
  Future getAvailableCities_request() async {}
}
