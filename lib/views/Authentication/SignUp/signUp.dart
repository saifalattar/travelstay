import 'package:flutter/material.dart';
import 'package:travelstay/shared/sharedWidgets.dart';
import 'package:travelstay/views/Authentication/components.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: TravelStayDrawer(context),
      appBar: TravelStayAppBar(
        context: context,
      ),
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
