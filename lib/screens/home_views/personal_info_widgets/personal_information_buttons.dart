import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/helper/colors_app.dart';
import 'package:graduation_project/models/personal_info_controalls.dart';
import 'package:graduation_project/models/personal_info_model.dart';
import 'package:graduation_project/screens/home_views/personal_info_widgets/utils/cubit/get_info/personal_info_cubit.dart';
import 'package:graduation_project/screens/home_views/personal_info_widgets/utils/cubit/update_info/update_personal_info_cubit.dart';

class PersonalInformationButtons extends StatelessWidget {
  const PersonalInformationButtons({
    super.key,
    required this.controllers,
    required this.data,
  });
  final PersonalInfoControalls controllers;
  final PersonalInfoModel data;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {},
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 7),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(width: 3, color: ColorsApp.primarycolor),
                ),
                child: Text(
                  "Discard Change",
                  style: TextStyle(color: ColorsApp.primarycolor),
                ),
              ),
            ),
          ),
          SizedBox(width: 15),
          Expanded(
            child: GestureDetector(
              onTap: () {
                PersonalInfoModel updatedData = PersonalInfoModel(
                  name:
                      controllers.nameEditingController.text.isEmpty
                          ? data.name
                          : controllers.nameEditingController.text,
                  email:
                      controllers.emailEditingController.text.isEmpty
                          ? data.email
                          : controllers.emailEditingController.text,
                  phone:
                      controllers.phoneEditingController.text.isEmpty
                          ? data.phone
                          : controllers.phoneEditingController.text,
                  area: controllers.selectedArea?? data.area,
                    
                  service: data.service,
                  skills: data.skills,
                );
                dynamic dataTojson = updatedData.toJson();
                context
                    .read<UpdatePersonalInfoCubit>()
                    .updatePesrsonalInfoMethod(data: dataTojson, id: data.id!);
                context.read<PersonalInfoCubit>().personalInfoMethod(
                  id: data.id!,
                );
              },
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 17, vertical: 8),
                decoration: BoxDecoration(
                  color: ColorsApp.primarycolor,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(width: 3, color: ColorsApp.primarycolor),
                ),
                child: Text(
                  "Save Change",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }


}
