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

class CurrenciesState extends TravelStayStates {
  final List currencies;
  CurrenciesState({required this.currencies});
}

class CurrencyState extends TravelStayStates {
  final String currency;
  CurrencyState({required this.currency});
}

class NationalityState extends TravelStayStates {
  final String nationality;
  NationalityState({required this.nationality});
}

class NationalitiesState extends TravelStayStates {
  final List nationalities;
  NationalitiesState({required this.nationalities});
}
