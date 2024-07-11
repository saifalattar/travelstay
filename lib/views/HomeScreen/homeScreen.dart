import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelstay/bloc/cubit.dart';
import 'package:travelstay/bloc/states.dart';
import 'package:travelstay/shared/sharedWidgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TravelStayCubit, TravelStayStates>(
        builder: (context, state) {
      return Scaffold(
          appBar: TravelStayAppBar(0),
          body: Column(
            children: [
              HomeBanner(),
              TravelStayButton(
                onPressed: () {},
                child: Text("Search"),
                hasBorder: true,
              )
            ],
          ));
    });
  }
}
