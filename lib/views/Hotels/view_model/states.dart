abstract class HotelsStates {}

class HotelsInitialState extends HotelsStates {}

class HotelsSuccessState extends HotelsStates {}

class HotelsErrorState extends HotelsStates {
  final String error;
  HotelsErrorState(this.error);
}

class HotelsSaveArgsState extends HotelsStates {}
