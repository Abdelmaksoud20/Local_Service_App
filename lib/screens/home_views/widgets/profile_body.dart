import 'package:flutter/material.dart';
import 'package:graduation_project/screens/home_views/widgets/profile_clipper.dart';

import '../../../helper/colors_app.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context) ;
    return Column(
      children: [
        Stack(
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
                padding: const EdgeInsets.symmetric(horizontal: 20.0 , vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Profile" , style: TextStyle( fontSize: 22 , fontWeight: FontWeight.bold , color: Colors.white),),
                    SizedBox(height: 20),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 8,
                        ),
                        CircleAvatar(
                          radius: size.height *.044 ,
                          backgroundImage: AssetImage('assets/images/lego.png'),
                        ),
                        SizedBox(width: 10),
                        Column(
                          children: [
                            Text(
                              "Mahmoud Shamrokh",
                              style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Shamrokh@gmail.com",
                              style: TextStyle(color: Colors.white70, fontSize: 14),
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
        ),
        Expanded(
          child: ListView(
            padding: EdgeInsets.all(20),
            children: [
              SectionTitle(title: "Account settings"),
              ProfileItem(icon: Icons.person, text: "Personal Information"),
              ProfileItem(icon: Icons.security, text: "Password"),
              SizedBox(height: 20),
              SectionTitle(title: "Other"),
              ProfileItem(icon: Icons.history, text: "History of your services"),
              ProfileItem(icon: Icons.help, text: "Contact Us"),
              ProfileItem(icon: Icons.info, text: "About App"),
            ],
          ),
        ),
      ],
    );
  }
}


class ProfileItem extends StatelessWidget {
  final IconData icon;
  final String text;
  const ProfileItem({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.black54),
      title: Text(text, style: TextStyle(fontSize: 16)),
      trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.black54),
      onTap: () {},
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        title,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black54),
      ),
    );
  }
}

