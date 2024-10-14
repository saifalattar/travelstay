import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/web.dart';
import 'package:travelstay/bloc_currency_nat/states.dart';
import 'package:travelstay/shared_prefrences.dart';

class BlocCurrenciesNatCubit extends Cubit<BlocCurrenciesNatStates> {
  BlocCurrenciesNatCubit() : super(BlocCurrenciesNatInitial());
  static BlocCurrenciesNatCubit get(context) => BlocProvider.of(context);
  List<dynamic> currencies = [];
  String selectedCurrency = 'USD';
  void updateCurrency(String value) {
    selectedCurrency = value;
    CacheHelper.saveDate(key: "currency", value: value);

    emit(CurrencyState(currency: value));
  }

  Future getCurrencies() async {
    try {
      Response response = await Dio()
          .get("https://travelstay247.co.uk/hotel/api/util/currencies");

      currencies = response.data["payload"]["currencies"];
      currencies = currencies.toSet().toList();
      currencies.sort((a, b) => a.compareTo(b));
      emit(CurrenciesState(currencies: currencies));
      Logger().e("Currencieees is :${response.data["payload"]["currencies"]}");
    } catch (e) {
      print(e);
    }
  }

  List<dynamic> nationalities = [];
  String selectedNationality = 'AF';

  void updateNationality(String value) {
    selectedNationality = value;
    CacheHelper.saveDate(key: "nationality", value: value);
    emit(NationalityState(nationality: value));
  }

  Future getNationalities() async {
    try {
      Response response = await Dio()
          .get("https://travelstay247.co.uk/hotel/api/util/nationalities");
      nationalities = response.data["payload"]["nationalities"];
      nationalities = nationalities.toSet().toList();
      nationalities.sort((a, b) => a.compareTo(b));
      emit(NationalitiesState(nationalities: nationalities));
    } catch (e) {
      print(e);
    }
  }
}
