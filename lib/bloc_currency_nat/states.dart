abstract class BlocCurrenciesNatStates {}

class BlocCurrenciesNatInitial extends BlocCurrenciesNatStates {}

class CurrenciesState extends BlocCurrenciesNatStates {
  final List<dynamic> currencies;
  CurrenciesState({required this.currencies});
}

class NationalityState extends BlocCurrenciesNatStates {
  final String nationality;
  NationalityState({required this.nationality});
}

class CurrencyState extends BlocCurrenciesNatStates {
  final String currency;
  CurrencyState({required this.currency});
}

class NationalitiesState extends BlocCurrenciesNatStates {
  final List<dynamic> nationalities;
  NationalitiesState({required this.nationalities});
}
