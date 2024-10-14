import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelstay/bloc/cubit.dart';
import 'package:travelstay/bloc/states.dart';
import 'package:travelstay/shared/sharedFunctions.dart';
import 'package:travelstay/shared/sharedVariables.dart';
import 'package:travelstay/shared/sharedWidgets.dart';

TextEditingController userEmail = TextEditingController();
TextEditingController userFirstName = TextEditingController();
TextEditingController userLastName = TextEditingController();
TextEditingController password = TextEditingController();
TextEditingController confirmPassword = TextEditingController();
bool isAccepted = false;

class AuthenticationTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final bool isPassword;
  final IconData icon;
  const AuthenticationTextField(
      {super.key,
      required this.controller,
      required this.labelText,
      required this.icon,
      this.isPassword = false});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TravelStayCubit, TravelStayStates>(
        builder: (context, state) {
      return TextField(
        controller: controller,
        style: themeData.textTheme.labelLarge,
        obscureText: isPassword
            ? (context.read<TravelStayCubit>().state is PasswordVisibility)
                ? (context.read<TravelStayCubit>().state as PasswordVisibility)
                    .value
                : true
            : false,
        decoration: InputDecoration(
            suffixIcon: isPassword
                ? BlocBuilder<TravelStayCubit, TravelStayStates>(
                    builder: (BuildContext context, TravelStayStates state) {
                      if (context.read<TravelStayCubit>().state
                          is PasswordVisibility) {
                        bool state = (context.read<TravelStayCubit>().state
                                as PasswordVisibility)
                            .value;
                        return !state
                            ? InkWell(
                                onTap: () {
                                  TravelStayCubit.get(context)
                                      .updatePasswordVisibility(true);
                                },
                                child: Icon(
                                  Icons.visibility_off,
                                  color: themeData.primaryColor,
                                ),
                              )
                            : InkWell(
                                onTap: () {
                                  TravelStayCubit.get(context)
                                      .updatePasswordVisibility(false);
                                },
                                child: Icon(
                                  Icons.visibility,
                                  color: themeData.primaryColor,
                                ),
                              );
                      }
                      return InkWell(
                        onTap: () {
                          TravelStayCubit.get(context)
                              .updatePasswordVisibility(false);
                        },
                        child: Icon(
                          Icons.visibility,
                          color: themeData.primaryColor,
                        ),
                      );
                    },
                  )
                : null,
            filled: true,
            fillColor: Colors.white,
            labelStyle: themeData.textTheme.titleMedium,
            enabled: true,
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: themeData.primaryColor),
                borderRadius: BorderRadius.circular(3)),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: themeData.primaryColor),
                borderRadius: BorderRadius.circular(3)),
            labelText: labelText,
            prefixIcon: Icon(
              icon,
              color: themeData.primaryColor,
            )),
      );
    });
  }
}

class RegisterationForm extends StatefulWidget {
  const RegisterationForm({super.key});

  @override
  State<RegisterationForm> createState() => _RegisterationFormState();
}

class _RegisterationFormState extends State<RegisterationForm> {
  @override
  Widget build(BuildContext context) {
    List children = [
      Center(
        child: Text(
          "Register Your Account\n",
          style: themeData.textTheme.displayLarge,
        ),
      ),
      AuthenticationTextField(
        controller: userEmail,
        labelText: "E-Mail",
        icon: Icons.email,
      ),
      AuthenticationTextField(
        isPassword: true,
        controller: password,
        labelText: "Password",
        icon: Icons.lock,
      ),
      Text(
        "Your password must include one uppercase letter, one lowercase letter and either a special character or a number and be a minimum of 8 characters long.",
        style: themeData.textTheme.labelLarge,
      ),
      AuthenticationTextField(
        isPassword: true,
        controller: confirmPassword,
        labelText: "Confirm password",
        icon: Icons.lock,
      ),
      AuthenticationTextField(
        controller: userFirstName,
        labelText: "First Name",
        icon: Icons.person,
      ),
      AuthenticationTextField(
        controller: userLastName,
        labelText: "Last Name",
        icon: Icons.person,
      ),
      Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        runAlignment: WrapAlignment.center,
        children: [
          Checkbox(
              activeColor: themeData.primaryColor,
              value: isAccepted,
              onChanged: (value) {
                setState(() {
                  isAccepted = !isAccepted;
                });
              }),
          Text("I agree to the ", style: themeData.textTheme.labelLarge),
          InkWell(
              onTap: () {
                Functions.navigateWithInSameTab(context, "/TermsAndConditions");
              },
              child: Text(
                "Terms & Conditions",
                style: themeData.textTheme.titleMedium,
              ))
        ],
      ),
      TravelStayButton(
          color: themeData.primaryColor,
          onPressed: () async {
            bool areEqual = false, areEmpyties = true, isStrong = false;
            if (RegExp(
                    r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$")
                .hasMatch(password.text)) {
              isStrong = true;
            }
            if (userEmail.text.isNotEmpty &&
                userFirstName.text.isNotEmpty &&
                userLastName.text.isNotEmpty &&
                password.text.isNotEmpty &&
                confirmPassword.text.isNotEmpty) {
              areEmpyties = false;
            }
            if (password.text == confirmPassword.text) {
              areEqual = true;
            }
            if (areEqual && !areEmpyties && isAccepted) {
              Map? response = await TravelStayCubit.get(context).signUp(
                  userEmail: userEmail.text,
                  password: password.text,
                  userFirstName: userFirstName.text,
                  userLastName: userLastName.text);
              if (response!["success"] == true) {
                Functions.navigateWithInSameTab(context, "/Login");
              } else {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(
                    "${response["error"]}",
                    style: themeData.textTheme.bodyMedium,
                  ),
                  backgroundColor: Colors.red,
                ));
              }
            } else if (areEmpyties) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(
                  "All fields are required",
                  style: themeData.textTheme.bodyMedium,
                ),
                backgroundColor: Colors.red,
              ));
            } else if (!isStrong) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(
                  "Password is weak",
                  style: themeData.textTheme.bodyMedium,
                ),
                backgroundColor: Colors.red,
              ));
            } else if (!areEqual) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(
                  "Passwords must be equal each others",
                  style: themeData.textTheme.bodyMedium,
                ),
                backgroundColor: Colors.red,
              ));
            } else if (!isAccepted) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(
                  "You must accept our Terms And Conditions",
                  style: themeData.textTheme.bodyMedium,
                ),
                backgroundColor: Colors.red,
              ));
            }
          },
          child: Text(
            "Sign Up",
            style: themeData.textTheme.headlineMedium,
          ))
    ];
    double width = MediaQuery.sizeOf(context).width;
    return Container(
      constraints:
          BoxConstraints(maxWidth: width > 800 ? width * 0.55 : width * 0.8),
      margin: const EdgeInsets.all(50),
      padding: const EdgeInsets.all(50),
      decoration: BoxDecoration(
          color: themeData.primaryColor.withOpacity(0.15),
          borderRadius: BorderRadius.circular(10)),
      child: ListView.separated(
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return children[index];
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            height: 10,
          );
        },
        itemCount: children.length,
      ),
    );
  }
}

class LogInForm extends StatefulWidget {
  const LogInForm({super.key});

  @override
  State<LogInForm> createState() => _LogInFormState();
}

class _LogInFormState extends State<LogInForm> {
  @override
  Widget build(BuildContext context) {
    List children = [
      Center(
        child: Text(
          "Logged in to stay in touch\n",
          style: themeData.textTheme.displayLarge,
        ),
      ),
      AuthenticationTextField(
        controller: userEmail,
        labelText: "E-Mail",
        icon: Icons.email,
      ),
      AuthenticationTextField(
        isPassword: true,
        controller: password,
        labelText: "Password",
        icon: Icons.lock,
      ),
      InkWell(
        onTap: () {},
        child: Text(
          "Forget Your Password?",
          style: themeData.textTheme.titleMedium,
        ),
      ),
      TravelStayButton(
          color: themeData.primaryColor,
          onPressed: () async {
            var response = await TravelStayCubit.get(context)
                .logIn(userEmail: userEmail.text, password: password.text);
            if (response!["success"]) {
              Functions.navigateWithInSameTab(context, "/");
            } else {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: Colors.red,
                  content: Text(
                    "${response["error"]}",
                    style: themeData.textTheme.bodyMedium,
                  )));
            }
          },
          child: Text(
            "Log In",
            style: themeData.textTheme.headlineMedium,
          ))
    ];
    double width = MediaQuery.sizeOf(context).width;
    return Container(
      constraints:
          BoxConstraints(maxWidth: width > 800 ? width * 0.55 : width * 0.8),
      margin: const EdgeInsets.all(50),
      padding: const EdgeInsets.all(50),
      decoration: BoxDecoration(
          color: themeData.primaryColor.withOpacity(0.15),
          borderRadius: BorderRadius.circular(10)),
      child: ListView.separated(
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return children[index];
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            height: 10,
          );
        },
        itemCount: children.length,
      ),
    );
  }
}
