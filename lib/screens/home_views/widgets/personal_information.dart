import 'package:flutter/material.dart';
import 'package:graduation_project/models/personal_info_controalls.dart';
import 'package:graduation_project/models/personal_info_model.dart';
import 'package:graduation_project/screens/home_views/personal_info_widgets/form_personal_information.dart';
import 'package:graduation_project/screens/home_views/personal_info_widgets/personal_information_buttons.dart';
import 'package:graduation_project/screens/home_views/widgets/profile_information_title.dart';

class PersonalInformation extends StatefulWidget {
  const PersonalInformation({super.key, this.data});
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
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            ProfileInformationTitle(size: size,name: widget.data!.name,email:widget.data!.email),
            Expanded(child: FormPersonalInformationProvider(controalls: controalls,data: widget.data!,)),
            PersonalInformationButtons(),
            SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}

snakBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
}
