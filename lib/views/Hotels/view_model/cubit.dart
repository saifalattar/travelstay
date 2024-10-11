import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelstay/views/Hotels/models/hotels_info.dart';
import 'package:travelstay/views/Hotels/view_model/states.dart';

class HotelsCubit extends Cubit<HotelsStates> {
  HotelsCubit() : super(HotelsInitialState());
  static HotelsCubit get(context) => BlocProvider.of(context);
  HotelApiResponse? hotelApiResponse;
  Map<dynamic, dynamic> globalArgs = {};

  Future getAvailableHotels(
      {required String cityId,
      required String checkIn,
      required String checkOut,
      required int roomCount,
      required int adultCount,
      required int childCount,
      required int roomNum,
      required List childAgeDetails,
      required String currency,
      required String nationality}) async {
    try {
      var response = await Dio()
          .post("https://travelstay247.co.uk/hotel/api/hotel/price", data: {
        "cityId": cityId,
        "checkInDate": checkIn,
        "checkOutDate": checkOut,
        "roomCount": roomCount,
        "occupancy": {
          "adultCount": adultCount,
          "childCount": childCount,
          "roomNum": roomNum,
          "childAgeDetails": childAgeDetails
        },
        "currency": currency,
        "nationality": nationality
      });
      hotelApiResponse = HotelApiResponse.fromJson(response.data);
      emit(HotelsSuccessState());
    } catch (e) {
      print(e.toString());
      emit(HotelsErrorState(e.toString()));
    }
  }
}
