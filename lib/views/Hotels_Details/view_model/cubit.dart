import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelstay/views/Hotels_Details/models/hotel_image_model.dart';
import 'package:travelstay/views/Hotels_Details/models/hotel_policy_model.dart';
import 'package:travelstay/views/Hotels_Details/view_model/states.dart';

class HotelDetailsCubit extends Cubit<HotelDetailsStates> {
  HotelDetailsCubit() : super(HotelDetailsInitial());

  static HotelDetailsCubit get(context) => BlocProvider.of(context);

  // Future getDetailsHotels(
  //     {required String cityId,
  //     required String checkIn,
  //     required String checkOut,
  //     required int roomCount,
  //     required int adultCount,
  //     required int childCount,
  //     required int roomNum,
  //     required List childAgeDetails,
  //     required String currency,
  //     required String nationality}) async {
  //   try {
  //     emit(HotelsDetailsLoadingState());
  //     hotelApiResponse = null;
  //     var response = await Dio()
  //         .post("https://travelstay247.co.uk/hotel/api/hotel/price", data: {
  //       "cityId": cityId,
  //       "checkInDate": checkIn,
  //       "checkOutDate": checkOut,
  //       "roomCount": roomCount,
  //       "occupancy": {
  //         "adultCount": adultCount,
  //         "childCount": childCount,
  //         "roomNum": roomNum,
  //         "childAgeDetails": childAgeDetails
  //       },
  //       "currency": currency,
  //       "nationality": nationality
  //     });

  //     // hotelApiResponse = HotelApiResponse.fromJson(response.data);
  //     emit(HotelsDetailsSuccessState());
  //   } catch (e) {
  //     emit(HotelsDetailsErrorState(e.toString()));
  //   }
  // }

  HotelImageModel? hotelImagesResponse;
  Future getHotelImages({required String hotelId}) async {
    try {
      emit(HotelsImagesLoadingState());
      hotelImagesResponse = null;
      var response = await Dio().get(
          "https://travelstay247.co.uk/hotel/api/util/hotel/images/$hotelId");
      hotelImagesResponse = HotelImageModel.fromJson(response.data);
      emit(HotelsImagesSuccessState());
    } catch (e) {
      emit(HotelsImagesErrorState(e.toString()));
    }
  }

  HotelPolicyModel? hotelPoliciesResponse;
  Future getHotelPolicies({required String hotelId}) async {
    try {
      emit(HotelsPoliciesLoadingState());
      hotelPoliciesResponse = null;
      var response = await Dio().get(
          "https://travelstay247.co.uk/hotel/api/util/hotel/policies/$hotelId");
      hotelPoliciesResponse = HotelPolicyModel.fromJson(response.data);
      emit(HotelsPoliciesSuccessState());
    } catch (e) {
      emit(HotelsPoliciesErrorState(e.toString()));
    }
  }

  Future init({required String hotelId}) async {
    emit(HotelsDetailsLoadingState());
    await Future.wait(
        [getHotelImages(hotelId: hotelId), getHotelPolicies(hotelId: hotelId)]);
    emit(HotelsDetailsSuccessState());
  }
}
