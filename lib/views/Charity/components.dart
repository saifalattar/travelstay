import 'package:flutter/material.dart';
import 'package:travelstay/bloc/cubit.dart';
import 'package:travelstay/shared/sharedVariables.dart';
import 'package:travelstay/shared/sharedWidgets.dart';

TextEditingController firstName_charity = TextEditingController();
TextEditingController lastName_charity = TextEditingController();
TextEditingController email_charity = TextEditingController();
TextEditingController mobile_charity = TextEditingController();
TextEditingController message_charity = TextEditingController();

class CrisisImage extends StatelessWidget {
  const CrisisImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/crisis.jpg",
      width: 250,
    );
  }
}

class CharityMessageContainer extends StatelessWidget {
  const CharityMessageContainer({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;

    return Container(
      padding: const EdgeInsets.all(20),
      constraints: BoxConstraints(
          maxWidth: width > 800 ? width * 0.90 : width * 0.95,
          minWidth: width * 0.8),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              offset: const Offset(0.2, 0.2),
              spreadRadius: 10,
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 10)
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Form(
        child: Column(
          children: [
            Wrap(
              children: [
                Wrap(
                  alignment: WrapAlignment.spaceBetween,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    TravelStayTextField(
                        controller: firstName_charity,
                        hintText: "First Name *"),
                    TravelStayTextField(
                        controller: lastName_charity, hintText: "Last Name *"),
                  ],
                ),
                Wrap(
                  children: [
                    TravelStayTextField(
                        controller: email_charity, hintText: "Email address *"),
                    TravelStayTextField(
                        controller: mobile_charity,
                        hintText: "Mobile number *"),
                  ],
                ),
                TravelStayTextField(
                  controller: message_charity,
                  hintText: "Message",
                  isFullWidth: true,
                ),
              ],
            ),
            TravelStayButton(
                onPressed: () {
                  TravelStayCubit.get(context)
                      .sendFeedbackForm(
                          email: email_charity.text,
                          message: message_charity.text,
                          mobile: mobile_charity.text)
                      .then((onValue) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                        "Message sent successfully",
                        style: themeData.textTheme.bodyMedium,
                      ),
                      backgroundColor: Colors.green,
                    ));
                  }).catchError((onError) {
                    print(onError);
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                        "$onError",
                        style: themeData.textTheme.bodyMedium,
                      ),
                      backgroundColor: Colors.red,
                    ));
                  });
                },
                child: Text(
                  "Send Message",
                  style: themeData.textTheme.headlineLarge,
                ))
          ],
        ),
      ),
    );
  }
}
