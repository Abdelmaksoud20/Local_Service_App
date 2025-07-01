import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/models/personal_info_controalls.dart';
import 'package:graduation_project/screens/home_views/personal_info_widgets/information_item.dart';
import 'package:graduation_project/screens/home_views/personal_info_widgets/utils/cubit/get_info/personal_info_cubit.dart';
import 'package:graduation_project/screens/home_views/widgets/profile_body.dart';
import 'package:graduation_project/shared_widget.dart/custom_drop_down_list.dart';

class FormPersonalInformationUser extends StatelessWidget {
  const FormPersonalInformationUser({super.key, required this.controallers});

  final PersonalInfoControalls controallers;

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
          UserDetails(controallers: controallers),
        ],
      ),
    );
  }
}

class FormPersonalInformationProvider extends StatelessWidget {
  const FormPersonalInformationProvider({
    super.key,
    required this.controallers,
  });
  final PersonalInfoControalls controallers;

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
          ProviderDetails(controallers: controallers),
        ],
      ),
    );
  }
}

class ProviderDetails extends StatelessWidget {
  const ProviderDetails({super.key, required this.controallers});
  final PersonalInfoControalls controallers;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PersonalInfoCubit, PersonalInfoState>(
      builder: (context, state) {
        if (state is PersonalInfoLoaded) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InformationItem(
                textEditingController: controallers.nameEditingController,
                text: "Name:",
                info: state.infoModel.name,
              ),
              const SizedBox(height: 25),
              InformationItem(
                textEditingController: controallers.emailEditingController,
                text: "Email:",
                info: state.infoModel.email,
              ),
              const SizedBox(height: 25),
              InformationItem(
                textEditingController: controallers.phoneEditingController,
                text: "Phone:",
                info: state.infoModel.phone,
              ),

              const SizedBox(height: 16),
              Row(
                children: [
                  Text("Area:", style: TextStyle(fontSize: 18)),
                  const SizedBox(width: 15),
                  Expanded(
                    flex: 2,
                    child: CustomDropdownList(
                      key: controallers.dropDownKeyArea,
                      data: [
                        'Al Zohour District',
                        'Al-talatini District',
                        'Al Manakh District',
                        'South District',
                        'East Port Said District',
                        'Al-dowahi District',
                        'West District',
                      ],
                      hintText: state.infoModel.area,
                      onChanged: (value) {
                        controallers.setSelectedArea(value);
                      },
                    ),
                  ),
                ],
              ),
              // Text("Services:", style: TextStyle(fontSize: 16)),
              const SizedBox(height: 15),
              Row(
                children: [
                  Text("Service: ", style: TextStyle(fontSize: 16)),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 18),
                      decoration: BoxDecoration(
                        color: const Color(0xffE8E6E6),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Center(
                        child: Opacity(
                          opacity: 0.8,
                          child: Text(
                            state.infoModel.service!,
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),
              Text('Skills:', style: TextStyle(fontSize: 16)),
              CustomSkills(skills: state.infoModel.skills!),
            ],
          );
        } else if (state is PersonalInfoLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is PersonalInfoError) {
          return Text(state.errMessage);
        } else {
          return Text('Information error');
        }
      },
    );
  }
}

class CustomSkills extends StatelessWidget {
  const CustomSkills({super.key, required this.skills});
  final List skills;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 10, left: 10),
            child: Row(
              spacing: 15,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 32, 158, 25),
                  ),
                  child: Icon(Icons.check, size: 23, color: Colors.white),
                ),
                Expanded(
                  child: SectionTitle(title: skills[index], fontSize: 17),
                ),
              ],
            ),
          );
        },
        itemCount: skills.length,
      ),
    );
  }
}

class UserDetails extends StatelessWidget {
   const UserDetails({super.key, required this.controallers});
  final PersonalInfoControalls controallers;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PersonalInfoCubit, PersonalInfoState>(
      builder: (context, state) {
        if (state is PersonalInfoLoaded) {
           // Update email from state
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InformationItem(
                textEditingController: controallers.nameEditingController,
                text: "Name:",
                info: state.infoModel.name,
              ),
              const SizedBox(height: 25),
              InformationItem(
                textEditingController: controallers.emailEditingController,
                text: "Email:",
                info: state.infoModel.email,
              ),
              const SizedBox(height: 25),
              InformationItem(
                textEditingController: controallers.phoneEditingController,
                text: "Phone:",
                info: state.infoModel.phone,
              ),

              const SizedBox(height: 16),
              Row(
                children: [
                  Text("Area:", style: TextStyle(fontSize: 18)),
                  const SizedBox(width: 15),
                  Expanded(
                    flex: 2,
                    child: CustomDropdownList(
                      key: controallers.dropDownKeyArea,
                      data: [
                        'Al Zohour District',
                        'Al-talatini District',
                        'Al Manakh District',
                        'South District',
                        'East Port Said District',
                        'Al-dowahi District',
                        'West District',
                      ],
                      hintText: state.infoModel.area,
                      onChanged: (value) {
                        controallers.setSelectedArea(value);
                      },
                    ),
                  ),
                ],
              ),
            ],
          );
        } else if (state is PersonalInfoLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is PersonalInfoError) {
          return Text(state.errMessage);
        } else {
          return Text('Information error');
        }
      },
    );
  }
}
