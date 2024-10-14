import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelstay/bloc/cubit.dart';
import 'package:travelstay/bloc/states.dart';
import 'package:travelstay/shared/sharedExtensions.dart';
import 'package:travelstay/shared/sharedVariables.dart';
import 'package:travelstay/views/HomeScreen/components.dart';

class DateRangePicker extends StatefulWidget {
  const DateRangePicker({super.key});

  @override
  State<DateRangePicker> createState() => _DateRangePickerState();
}

class _DateRangePickerState extends State<DateRangePicker> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return BlocBuilder<TravelStayCubit, TravelStayStates>(
        builder: (context, state) {
      if (context.read<TravelStayCubit>().state is ChooseDateRange) {
        checkInDate = (context.read<TravelStayCubit>().state as ChooseDateRange)
            .start!
            .getDisplayedDate();
        checkIn =
            (context.read<TravelStayCubit>().state as ChooseDateRange).start;

        checkOutDate =
            (context.read<TravelStayCubit>().state as ChooseDateRange)
                .end!
                .getDisplayedDate();
        checkOut =
            (context.read<TravelStayCubit>().state as ChooseDateRange).end;
      }

      return InkWell(
        onTap: () async {
          context.read<TravelStayCubit>().chooseDateRange(context);
        },
        child: Container(
          height: 50,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.white),
          width: width > 800 ? width / 3.5 : width * 0.9,
          child: Row(
            children: [
              Icon(
                Icons.calendar_today_outlined,
                color: Colors.grey.shade800,
                size: 22,
              ),
              Text(
                "\t\t ${checkInDate ?? "Check-in date"} — ${checkOutDate ?? "Check-out date"}",
                style: checkInDate == null
                    ? themeData.textTheme.labelMedium
                    : themeData.textTheme.labelLarge,
              )
            ],
          ),
        ),
      );
    });
  }
}
