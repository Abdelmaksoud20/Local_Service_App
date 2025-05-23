import 'package:flutter/material.dart';
import 'package:graduation_project/screens/home_views/widgets/profile_clipper.dart';
import '../../../constant.dart';
import '../../../helper/colors_app.dart';
import '../../../helper/font_size.dart';

class ProfileInformationTitle extends StatelessWidget {
  const ProfileInformationTitle({
    super.key,
    required this.size,
    required this.name, required this.email,
  });
  final String name;
  final Size size;
  final String email;

  @override
  Widget build(BuildContext context) {
    List<String> word = name.split(" ");
    String username = "${word[0]} ${word[1]}";
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
                  // mainAxisAlignment: MainAxisAlignment.start,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(width: 8),
                    CircleAvatar(
                      radius: size.height * .044,
                      backgroundImage: AssetImage(profileImage),
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          username,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: FontSizeApp.fontSize18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          email,
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: FontSizeApp.fontSize14,
                          ),
                        ),
                      ],
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
