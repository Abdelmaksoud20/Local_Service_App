import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/screens/home_views/personal_info_widgets/utils/cubit/get_info/personal_info_cubit.dart';
import 'package:graduation_project/screens/home_views/widgets/profile_clipper.dart';
import '../../../constant.dart';
import '../../../helper/colors_app.dart';
import '../../../helper/font_size.dart';

class ProfileInformationTitle extends StatelessWidget {
  const ProfileInformationTitle({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipPath(
          clipper: CustomWaveClipper(),
          child: Container(
            height: size.height * .32, //250,
            color: ColorsApp.primarycolor,
          ),
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Profile",
                  style: TextStyle(
                    fontSize: FontSizeApp.fontSize23,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    SizedBox(width: 8),
                    CircleAvatar(
                      radius: size.height * .044,
                      backgroundImage: AssetImage(profileImage),
                    ),
                    SizedBox(width: 10),
                    BlocBuilder<PersonalInfoCubit, PersonalInfoState>(
                      builder: (context, state) {
                        if (state is PersonalInfoLoaded) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                cutName(name: state.infoModel.name, wordsnumber: 2),
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: FontSizeApp.fontSize18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                state.infoModel.email,
                                style: TextStyle(
                                  color:   Colors.white,
                                  fontSize: FontSizeApp.fontSize14,
                                ),
                              ),
                            ],
                          );
                        } else {
                          return Text('Wating for data...',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: FontSizeApp.fontSize14,
                            ),
                          );
                        }
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

String cutName({required String name, required int wordsnumber}) {
  List<String> words = name.split(" ");
  if (wordsnumber == 1) {
    return words[0];
  } else {
    return "${words[0]} ${words[1]}";
  }
}
