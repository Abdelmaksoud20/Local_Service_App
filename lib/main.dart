import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/helper/observerbloc.dart';
import 'package:graduation_project/screens/get_start_view/get_start_view.dart';
import 'package:graduation_project/screens/home_views/utils/cubit/request_state_cubit.dart';

void main() {
  Bloc.observer = Observer();
  runApp(LocalServicesApp());
}

class LocalServicesApp extends StatelessWidget {
  const LocalServicesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RequestStateCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: GetStartView(),
      ),
    );
  }
}
