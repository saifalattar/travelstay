import 'package:flutter/material.dart';
import 'package:travelstay/shared/sharedVariables.dart';
import 'package:travelstay/shared/sharedWidgets.dart';
import 'package:travelstay/views/Authentication/SignUp/components.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: TravelStayDrawer(context),
      appBar: TravelStayAppBar(context: context),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            MasjidBanner(title: "Register"),
            RegisterationForm(),
            TravelStayFooter(isUnbeatableStackShown: false)
          ],
        ),
      ),
    );
  }
}
