import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelstay/Models/services.dart';
import 'package:travelstay/bloc/states.dart';

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
}
