import 'package:flutter/material.dart';

abstract class TravelStayStates {}

class InitialState extends TravelStayStates {}

class SearchCities extends TravelStayStates {
  final List<DropdownMenuEntry> resultCities;

  SearchCities({required this.resultCities});
}

class ChooseDateRange extends TravelStayStates {
  final DateTime? start, end;
  ChooseDateRange({required this.start, required this.end});
}

class AdultsNumber extends TravelStayStates {
  final int? number;
  AdultsNumber({this.number = 0});
}

class ChildrenNumber extends TravelStayStates {
  final int? number;
  ChildrenNumber({this.number = 0});
}

class RoomsNumber extends TravelStayStates {
  final int? number;
  RoomsNumber({this.number = 0});
}

class PasswordVisibility extends TravelStayStates {
  final bool value;
  PasswordVisibility({required this.value});
}
