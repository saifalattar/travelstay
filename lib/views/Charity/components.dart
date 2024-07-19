import 'package:flutter/material.dart';
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
      constraints:
          BoxConstraints(maxWidth: width > 800 ? width * 0.70 : width * 0.75),
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
                onPressed: () {},
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
