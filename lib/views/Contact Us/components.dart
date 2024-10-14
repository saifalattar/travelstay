import 'package:flutter/material.dart';
import 'package:travelstay/shared/sharedVariables.dart';
import 'package:travelstay/shared/sharedWidgets.dart';

class ContactInfoContainer extends StatelessWidget {
  final String? title, description, note;
  const ContactInfoContainer(
      {super.key, required this.title, required this.description, this.note});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(12),
      constraints: BoxConstraints(
          minHeight: 200,
          maxWidth: width > 800 ? width * 0.3 : width * 0.8,
          minWidth: width > 800 ? width * 0.2 : width * 0.8),
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            "$title",
            style: themeData.textTheme.titleLarge,
          ),
          note == null
              ? const SizedBox()
              : Text(
                  "$note",
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
          Text(
            "$description",
            style: themeData.textTheme.labelMedium,
          )
        ],
      ),
    );
  }
}

TextEditingController firstName_contact = TextEditingController();
TextEditingController lastName_contact = TextEditingController();
TextEditingController email_contact = TextEditingController();
TextEditingController mobile_contact = TextEditingController();
TextEditingController message_contact = TextEditingController();

class ContactUsMessageContainer extends StatelessWidget {
  const ContactUsMessageContainer({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;

    return Container(
      padding: const EdgeInsets.all(20),
      constraints: BoxConstraints(
          maxWidth: width > 800 ? width * 0.90 : width * 0.95,
          minWidth: width * 0.85),
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
                        controller: firstName_contact,
                        hintText: "First Name *"),
                    TravelStayTextField(
                        controller: lastName_contact, hintText: "Last Name *"),
                  ],
                ),
                Wrap(
                  children: [
                    TravelStayTextField(
                        controller: email_contact, hintText: "Email address *"),
                    TravelStayTextField(
                        controller: mobile_contact,
                        hintText: "Mobile number *"),
                  ],
                ),
                TravelStayTextField(
                  controller: message_contact,
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
