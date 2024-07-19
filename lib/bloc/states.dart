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
