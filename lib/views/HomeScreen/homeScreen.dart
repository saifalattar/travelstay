import 'package:flutter/material.dart';
import 'package:travelstay/Models/hotel.dart';
import 'package:travelstay/shared/sharedVariables.dart';
import 'package:travelstay/shared/sharedWidgets.dart';
import 'package:travelstay/views/HomeScreen/components.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;

    return Scaffold(
        key: scaffoldKey,
        drawer: TravelStayDrawer(context),
        appBar: TravelStayAppBar(
          context: context,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Column(
                    children: [
                      const HomeBanner(),
                      SizedBox(
                        height: width > 700 ? 0 : 200,
                      )
                    ],
                  ),
                  const SearchForHotelsBar()
                ],
              ),
              const RecentSearches(),
              const SizedBox(
                height: 100,
              ),
              const Wrap(
                children: [],
              ),
              const TravelStayFooter(
                isUnbeatableStackShown: true,
              )
            ],
          ),
        ));
  }
}
