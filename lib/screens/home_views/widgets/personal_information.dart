//
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/models/personal_info_controalls.dart';
import 'package:graduation_project/models/personal_info_model.dart';
import 'package:graduation_project/screens/home_views/personal_info_widgets/form_personal_information.dart';
import 'package:graduation_project/screens/home_views/personal_info_widgets/personal_information_buttons.dart';
import 'package:graduation_project/screens/home_views/personal_info_widgets/utils/cubit/update_info/update_personal_info_cubit.dart';
import 'package:graduation_project/screens/home_views/widgets/profile_information_title.dart';

class PersonalInformation extends StatefulWidget {
  const PersonalInformation({super.key, required this.check, this.data});
  final bool check;
  final PersonalInfoModel? data;
  @override
  State<PersonalInformation> createState() => _PersonalInformationState();
}

class _PersonalInformationState extends State<PersonalInformation> {
  PersonalInfoControalls controalls = PersonalInfoControalls();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return SafeArea(
      top: false,
      child: BlocProvider(
        create: (context) => UpdatePersonalInfoCubit(),
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            children: [
              ProfileInformationTitle(size: size),
              Expanded(
                child:
                    widget.check
                        ? FormPersonalInformationUser(controallers: controalls)
                        : FormPersonalInformationProvider(
                          controallers: controalls,
                        ),
              ),
              PersonalInformationButtons(
                controllers: controalls,
                data: widget.data!,
              ),
              SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}

snakBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
}
