import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelstay/bloc/cubit.dart';
import 'package:travelstay/shared/sharedVariables.dart';
import 'package:travelstay/views/HomeScreen/homeScreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiBlocProvider(
      providers: [
        BlocProvider<TravelStayCubit>(create: (context) => TravelStayCubit()),
      ],
      child: MaterialApp(
        home: HomeScreen(),
        theme: themeData,
      )));
}
