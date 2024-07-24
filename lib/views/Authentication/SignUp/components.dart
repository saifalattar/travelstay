import 'package:flutter/material.dart';
import 'package:travelstay/bloc/cubit.dart';
import 'package:travelstay/shared/sharedVariables.dart';
import 'package:travelstay/shared/sharedWidgets.dart';

TextEditingController userEmail = TextEditingController();
TextEditingController userFirstName = TextEditingController();
TextEditingController userLastName = TextEditingController();
TextEditingController password = TextEditingController();
TextEditingController confirmPassword = TextEditingController();

class RegisterationForm extends StatelessWidget {
  const RegisterationForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: themeData.primaryColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          TravelStayTextField(controller: userEmail, hintText: "E-Mail"),
          TravelStayTextField(controller: password, hintText: "Password"),
          TravelStayTextField(
              controller: confirmPassword, hintText: "Confirm password"),
          TravelStayTextField(
              controller: userFirstName, hintText: "First Name"),
          TravelStayTextField(controller: userLastName, hintText: "Last Name"),
          TravelStayButton(
              onPressed: () async {
                await TravelStayCubit.GET(context).signUp(
                    userEmail: userEmail.text,
                    password: password.text,
                    userFirstName: userFirstName.text,
                    userLastName: userLastName.text);
              },
              child: const Text("Sign Up"))
        ],
      ),
    );
  }
}
