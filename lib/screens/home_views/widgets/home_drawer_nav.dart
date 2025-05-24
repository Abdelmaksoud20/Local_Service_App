import 'package:flutter/material.dart';
import 'package:graduation_project/screens/contact_view/contact_view.dart';
import 'package:graduation_project/screens/home_views/home_view.dart';
import 'package:graduation_project/screens/login_view.dart/login_view.dart';
import 'package:graduation_project/screens/register_view/service_provider/service_provider_home.dart';
import '../../../constant.dart';
import '../../../helper/colors_app.dart';

class HomeDrawerNav extends StatelessWidget {
  const HomeDrawerNav({super.key, required this.swichMode,  this.name});
  final String? name;
  final String swichMode;

  @override
  Widget build(BuildContext context) {
    List<String> words = name!.split(" ");
    String proname = "${words[0]} ${words[1]}";
    Size size = MediaQuery.sizeOf(context);
    return Drawer(
      width: size.width * .77,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 25),
        child: ListView(
          children: [
            Row(
              children: [
                CircleAvatar(
                  //radius: 25,
                  radius: size.height * .037,
                  backgroundImage: AssetImage(profileImage),
                ),
                SizedBox(width: 10),
                Text(
                  proname,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.arrow_forward_ios_rounded),
                ),
              ],
            ),
            SizedBox(height: 50),
            Text(
              "Other",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            CustomItemDrawer(
              text: "Contact us",
              icon: Icons.question_mark,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ContactView()),
                );
              },
            ),
            CustomItemDrawer(text: "About App", icon: Icons.info_outline),
            CustomItemDrawer(
              text: "Log Out",
              icon: Icons.logout,
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginView()),
                );
              },
            ),
            SizedBox(height: MediaQuery.sizeOf(context).height * .42),
            MaterialButton(
              onPressed: () {
                if (swichMode == "Provider Mode") {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ServiceProviderHome(),
                    ),
                  );
                } else {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => HomeView()),
                  );
                }
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                decoration: BoxDecoration(
                  color: ColorsApp.primarycolor,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Text(swichMode, style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomItemDrawer extends StatelessWidget {
  const CustomItemDrawer({
    super.key,
    required this.text,
    required this.icon,
    this.onPressed,
  });
  final String text;
  final IconData icon;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.zero,
      onPressed: onPressed,
      child: ListTile(
        titleTextStyle: TextStyle(fontSize: 16, color: Colors.black),
        horizontalTitleGap: 0,
        title: Text(text),
        leading: SizedBox(width: 20, child: Icon(icon)),
      ),
    );
  }
}
