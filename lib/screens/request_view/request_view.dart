import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/screens/request_view/cubit/request_cubit.dart';
import 'package:graduation_project/screens/request_view/request_form.dart';


class RequestView extends StatelessWidget {
  const RequestView({
    super.key,
    required this.price,
    required this.skill,
    required this.service,
  });
  final String price, skill, service;

  @override
  Widget build(BuildContext context) {
    log('request home');
    return BlocProvider(
      create: (context) => RequestCubit(),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: FormRequest(service: service, price: price, skill: skill),
        ),
      ),
    );
  }
}




