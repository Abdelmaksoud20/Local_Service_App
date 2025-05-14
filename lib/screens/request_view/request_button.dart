import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/constant.dart';
import 'package:graduation_project/screens/request_view/cubit/request_cubit.dart';
import 'package:graduation_project/shared_widget.dart/custom_drop_down_list.dart';

// ignore: must_be_immutable
class RequestButton extends StatelessWidget {
  const RequestButton({
    super.key,
    required this.formKey,
    required this.nameController,
    required this.emailController,
    required this.mobileController,
    required this.addressController,
    required this.executionDayController,
    required this.service,
    required this.skill,
    required this.price,
    required this.dropDownKey,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController mobileController;
  final TextEditingController addressController;
  final TextEditingController executionDayController;
  final String service, skill, price;
  final GlobalKey<CustomDropdownListState> dropDownKey;
  @override
  Widget build(BuildContext context) {
    // log('request Button');
    return BlocConsumer<RequestCubit, RequestState>(
      listener: (context, state) {
        if (state is RequestLoaded) {
          nameController.clear();
          emailController.clear();
          mobileController.clear();
          addressController.clear();
          executionDayController.clear();
          dropDownKey.currentState?.reset();
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('Processing Request')));
        }
      },
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                if (formKey.currentState!.validate()) {
                  // log("""
                  //       name: ${nameController.text},
                  //       email: ${emailController.text},
                  //       mobile: ${mobileController.text},
                  //       area: $area,
                  //       address: ${addressController.text},
                  //       execution_day: ${executionDayController.text},
                  //       service: $service,
                  //       skill: $skill,
                  //       price: $price,""");
                  try {
                    context.read<RequestCubit>().sendDataRequest(
                      sdata: {
                        "name": nameController.text,
                        "email": emailController.text,
                        "mobile": mobileController.text,
                        "area": "Al Manakh District",
                        "address": addressController.text,
                        "execution_day": executionDayController.text,
                        "service": service,
                        "skill": skill,
                        "price": price,
                      },
                    );
                  } catch (e) {
                    // log('error view =>$e');
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Please correct the errors and try again'),
                    ),
                  );
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
}
