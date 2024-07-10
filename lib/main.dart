import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelstay/bloc/cubit.dart';
import 'package:travelstay/bloc/states.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiBlocProvider(providers: [
    BlocProvider<TravelStayCubit>(create: (context) => TravelStayCubit()),
  ], child: HomeScreen()));
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TravelStayCubit, TravelStayStates>(
        builder: (context, state) {
      return Scaffold(
        body: Center(
          child: Text("Hello"),
        ),
      );
    });
  }
}
