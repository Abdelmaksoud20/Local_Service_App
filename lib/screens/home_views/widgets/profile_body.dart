import 'package:flutter/material.dart';
import 'package:graduation_project/screens/home_views/widgets/personal_information.dart';
import 'package:graduation_project/screens/home_views/widgets/profile_information_title.dart';


class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context) ;
    return Column(
      children: [
        ProfileInformationTitle(size: size),
        ProfileInformationList(),
      ],
    );
  }
}

class ProfileInformationList extends StatelessWidget {
  const ProfileInformationList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        padding: EdgeInsets.all(20),
        children: [
          SectionTitle(title: "Account settings"),
          ProfileItem(icon: Icons.person, text: "Personal Information" , onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> PersonalInformation() ));
          },
          ),
          ProfileItem(icon: Icons.security, text: "Password"),
          SizedBox(height: 20),
          SectionTitle(title: "Other"),
          ProfileItem(icon: Icons.history, text: "History of your services"),
          ProfileItem(icon: Icons.help, text: "Contact Us"),
          ProfileItem(icon: Icons.info, text: "About App"),
        ],
      ),
    );
  }
}




class ProfileItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final void Function()? onTap ;
  const ProfileItem({super.key, required this.icon, required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.black54),
      title: Text(text, style: TextStyle(fontSize: 16)),
      trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.black54),
      onTap:onTap,
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

