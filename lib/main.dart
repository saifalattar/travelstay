import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelstay/Models/hotel.dart';
import 'package:travelstay/bloc/cubit.dart';
import 'package:travelstay/bloc_currency_nat/cubit.dart';
import 'package:travelstay/firebase_options.dart';
import 'package:travelstay/shared/sharedVariables.dart';
import 'package:travelstay/shared_prefrences.dart';
import 'package:travelstay/views/About%20Us/aboutUs.dart';
import 'package:travelstay/views/Authentication/Login/login.dart';
import 'package:travelstay/views/Authentication/SignUp/signUp.dart';
import 'package:travelstay/views/Charity/charity.dart';
import 'package:travelstay/views/Contact%20Us/contactUs.dart';
import 'package:travelstay/views/HomeScreen/homeScreen.dart';
import 'package:travelstay/views/Hotels/hotelsScreen.dart';
import 'package:travelstay/views/Hotels/view_model/cubit.dart';
import 'package:travelstay/views/Hotels_Details/view/hotel_details_screen.dart';
import 'package:travelstay/views/TermsAndConditions/termsAndConditions.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.web,
  );
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => HotelsCubit()),
      BlocProvider(
          create: (context) => BlocCurrenciesNatCubit()
            ..getCurrencies()
            ..getNationalities()),
      BlocProvider<TravelStayCubit>(
          create: (context) => TravelStayCubit()..isSignedIn()),
    ],
    child: MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      theme: themeData,
      routes: {
        '/': (context) => const HomeScreen(),
        '/Hotels': (context) => const HotelsScreen(),
        '/HotelDetails': (context) => const HotelDetailsScreen(),
        '/AboutUs': (context) => const AboutUs(),
        '/ContactUs': (context) => const ContactUs(),
        '/Registeration': (context) => const SignUp(),
        '/Charity': (context) => const Charity(),
        '/HotelFullScreen': (context) {
          return HotelFullScreen(
              i: ModalRoute.of(context)?.settings.arguments
                  as Map<String, List<dynamic>>);
        },
        '/TermsAndConditions': (context) => const TermsAndConditions(),
        '/Login': (context) => const LogIn(),
      },
    ),
  ));
}
