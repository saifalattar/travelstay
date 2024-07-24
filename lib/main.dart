import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:travelstay/Models/hotel.dart';
import 'package:travelstay/bloc/cubit.dart';
import 'package:travelstay/shared/sharedVariables.dart';
import 'package:travelstay/views/About%20Us/aboutUs.dart';
import 'package:travelstay/views/Authentication/SignUp/signUp.dart';
import 'package:travelstay/views/Charity/charity.dart';
import 'package:travelstay/views/Contact%20Us/contactUs.dart';
import 'package:travelstay/views/HomeScreen/homeScreen.dart';
import 'package:travelstay/views/TermsAndConditions/termsAndConditions.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<TravelStayCubit>(create: (context) => TravelStayCubit()),
    ],
    child: MaterialApp.router(
      theme: themeData,
      routerConfig: GoRouter(routes: [
        GoRoute(path: "/", builder: (ctx, state) => const HomeScreen()),
        GoRoute(path: "/AboutUs", builder: (ctx, state) => const AboutUs()),
        GoRoute(path: "/ContactUs", builder: (ctx, state) => const ContactUs()),
        GoRoute(
            path: "/Registeration", builder: (ctx, state) => const SignUp()),
        GoRoute(
            path: "/Charity",
            builder: (ctx, state) {
              return const Charity();
            }),
        GoRoute(
            path: "/HotelDetails",
            builder: (ctx, state) {
              return HotelFullScreen(i: state.uri.queryParametersAll);
            }),
        GoRoute(
            path: "/TermsAndConditions",
            builder: (ctx, state) => const TermsAndConditions())
      ]),
    ),
  ));
}
