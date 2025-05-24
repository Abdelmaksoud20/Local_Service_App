import 'package:flutter/material.dart';
import 'package:graduation_project/models/personal_info_controalls.dart';
import 'package:graduation_project/models/personal_info_model.dart';
import 'package:graduation_project/screens/home_views/personal_info_widgets/information_item.dart';
import 'package:graduation_project/screens/home_views/widgets/profile_body.dart';
import 'package:graduation_project/shared_widget.dart/custom_drop_down_list.dart';

class FormPersonalInformation extends StatelessWidget {
  const FormPersonalInformation({super.key, required this.controalls,required this.data});
  final PersonalInfoModel data;
  final PersonalInfoControalls controalls;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ListView(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        padding: EdgeInsets.all(20),
        children: [
          const SectionTitle(title: "Personal Information"),
          const SizedBox(height: 15),
          InformationItem(
            textEditingController: controalls.firstEditingController,
            text: "Name:",
            info: data.name,
          ),
          const SizedBox(height: 25),
          // InformationItem(
          //   textEditingController: lastEditingController,
          //   text: "Last Name:",
          //   info: "Your Last Name",
          // ),
          // const SizedBox(height: 25),
          InformationItem(
            textEditingController: controalls.emailEditingController,
            text: "Email:",
            info: data.email,
          ),
          const SizedBox(height: 25),
          Row(
            children: [
              Text("Area:"),
              const SizedBox(width: 15),
              Flexible(
                child: CustomDropdownList(
                  data: [
                    'Al Zohour District',
                    'Al-talatini District',
                    'Al Manakh District',
                    'South District',
                    'East Port Said District',
                    'Al-dowahi District',
                    'West District',
                  ],
                  hintText: data.area,
                ),
              ),
            ],
          ),
          const SizedBox(height: 25),
          InformationItem(
            textEditingController: controalls.phoneEditingController,
            text: "Phone Number:",
            info: data.phone,
          ),
        ],
      ),
    );
  }
}
