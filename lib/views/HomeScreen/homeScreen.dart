import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelstay/bloc/cubit.dart';
import 'package:travelstay/bloc/states.dart';
import 'package:travelstay/shared/sharedWidgets.dart';
import 'package:travelstay/views/HomeScreen/components.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;

    return Scaffold(
        appBar: TravelStayAppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Column(
                    children: [
                      HomeBanner(),
                      SizedBox(
                        height: width > 700 ? 0 : 200,
                      )
                    ],
                  ),
                  SearchForHotelsBar()
                ],
              ),
              RecentSearches(),
              SizedBox(
                height: 100,
              ),
              Wrap(
                children: [],
              )
            ],
          ),
        ));
  }
}
