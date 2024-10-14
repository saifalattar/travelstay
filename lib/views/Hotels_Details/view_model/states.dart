abstract class HotelDetailsStates {}

class HotelDetailsInitial extends HotelDetailsStates {}

class HotelsDetailsLoadingState extends HotelDetailsStates {}

class HotelsDetailsSuccessState extends HotelDetailsStates {}

class HotelsDetailsErrorState extends HotelDetailsStates {
  final String error;
  HotelsDetailsErrorState(this.error);
}

class HotelsPoliciesLoadingState extends HotelDetailsStates {}

class HotelsPoliciesSuccessState extends HotelDetailsStates {}

class HotelsPoliciesErrorState extends HotelDetailsStates {
  final String error;
  HotelsPoliciesErrorState(this.error);
}

class HotelsImagesLoadingState extends HotelDetailsStates {}

class HotelsImagesSuccessState extends HotelDetailsStates {}

class HotelsImagesErrorState extends HotelDetailsStates {
  final String error;
  HotelsImagesErrorState(this.error);
}
