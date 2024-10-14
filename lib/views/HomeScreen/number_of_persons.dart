import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelstay/bloc/cubit.dart';
import 'package:travelstay/bloc/states.dart';
import 'package:travelstay/shared/sharedVariables.dart';
import 'package:travelstay/views/HomeScreen/components.dart';

class NumberOfPersons extends StatelessWidget {
  final void Function() onPressed;
  const NumberOfPersons({required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;

    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 50,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.white),
        width: width > 800 ? width / 3.5 : width * 0.9,
        child: Row(
          children: [
            Icon(
              Icons.person_outline_outlined,
              color: Colors.grey.shade800,
              size: 22,
            ),
            BlocBuilder<TravelStayCubit, TravelStayStates>(
                builder: (context, state) {
              return Text(
                "\t\t $adultsNumbers adults . $childrenNumbers children . $roomsNumbers rooms",
                style: checkInDate == null
                    ? themeData.textTheme.labelMedium
                    : themeData.textTheme.labelLarge,
              );
            })
          ],
        ),
      ),
    );
  }
}
