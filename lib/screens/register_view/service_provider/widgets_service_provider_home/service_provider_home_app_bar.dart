import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/screens/home_views/personal_info_widgets/utils/cubit/get_info/personal_info_cubit.dart';
import 'package:graduation_project/screens/home_views/widgets/profile_information_title.dart';

class ServiceProviderHomeAppBar extends StatelessWidget {
  const ServiceProviderHomeAppBar({super.key, this.image});
  final dynamic image;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 15,
      children: [
        IconButton(
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          icon: Icon(Icons.menu),
        ),
        CircleAvatar(
          radius: 35,
          backgroundImage: AssetImage(
            'assets/images/60dac1a160f26da1106becfca00cb805.jpeg',
          ),
        ),
        BlocBuilder<PersonalInfoCubit, PersonalInfoState>(
          builder: (context, state) {
            if (state is PersonalInfoLoaded) {
              String name = cutName(name: state.infoModel.name, wordsnumber: 1);
              return Text(
                name,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              );
            } else {
              return Text('errorName');
            }
          },
        ),
        Spacer(),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.notifications_outlined, size: 34),
        ),
      ],
    );
  }
}
