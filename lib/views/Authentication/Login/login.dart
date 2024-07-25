import 'package:flutter/material.dart';
import 'package:travelstay/shared/sharedVariables.dart';
import 'package:travelstay/shared/sharedWidgets.dart';
import 'package:travelstay/views/Authentication/components.dart';

class LogIn extends StatelessWidget {
  const LogIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: TravelStayDrawer(context),
      key: scaffoldKey,
      appBar: TravelStayAppBar(context: context),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            MasjidBanner(title: "Login"),
            LogInForm(),
            TravelStayFooter(isUnbeatableStackShown: false)
          ],
        ),
      ),
    );
  }
}
