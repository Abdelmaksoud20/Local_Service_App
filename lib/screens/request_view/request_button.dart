import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/constant.dart';
import 'package:graduation_project/models/request_button_model.dart';
import 'package:graduation_project/screens/request_view/cubit/request_cubit.dart';

// ignore: must_be_immutable
class RequestButton extends StatelessWidget {
  const RequestButton({
    super.key,
    required this.service,
    required this.skill,
    required this.price,
    required this.data,
    required this.formKey,
  });
  final RequestButtonModel data;
  final GlobalKey<FormState> formKey;
  final String service, skill, price;
  @override
  Widget build(BuildContext context) {
    // log('request Button');
    return BlocConsumer<RequestCubit, RequestState>(
      listener: (context, state) {
        if (state is RequestLoaded) {
          data.clearAll();
          snakBar(context, 'successful request');
        } else if (state is Requesterror) {
          snakBar(context, state.err);
        }
      },
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                if (formKey.currentState!.validate()) {
                  try {
                    context.read<RequestCubit>().sendDataRequestMethod(
                      senddata: {
                        "name": data.nameController.text,
                        "email": data.emailController.text,
                        "mobile": data.mobileController.text,
                        "area": data.dropDownKey.currentState?.selectedItem,
                        "address": data.addressController.text,
                        "execution_day": data.executionDayController.text,
                        "service": service,
                        "skill": skill,
                        "price": price,
                      },
                    );
                  } catch (e) {
                    throw Exception('Send Data Error');
                  }
                } else {
                  snakBar(context, 'Please correct the errors and try again');
                }
              },
              child: Container(
                height: 60,
                width: MediaQuery.sizeOf(context).width * .8,
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Center(
                  child:
                      state is RequestLoading
                          ? CircularProgressIndicator(color: Colors.white)
                          : Text(
                            'Request',
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void snakBar(BuildContext context, String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  void sendData(BuildContext context) {
    context.read<RequestCubit>().sendDataRequestMethod(
      senddata: {
        "name": data.nameController.text,
        "email": data.emailController.text,
        "mobile": data.mobileController.text,
        "area": data.dropDownKey.currentState?.selectedItem,
        "address": data.addressController.text,
        "execution_day": data.executionDayController.text,
        "service": service,
        "skill": skill,
        "price": price,
      },
    );
  }
}
