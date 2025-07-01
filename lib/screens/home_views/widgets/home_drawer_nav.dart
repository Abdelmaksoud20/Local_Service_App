import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/helper/font_size.dart';
import 'package:graduation_project/screens/contact_view/contact_view.dart';
import 'package:graduation_project/screens/home_views/home_view.dart';
import 'package:graduation_project/screens/home_views/personal_info_widgets/utils/cubit/get_info/personal_info_cubit.dart';
import 'package:graduation_project/screens/home_views/widgets/profile_information_title.dart';
import 'package:graduation_project/screens/login_view.dart/login_view.dart';
import '../../../constant.dart';
import '../../../helper/colors_app.dart';
import '../../../notification/notification.dart';

class HomeDrawerNav extends StatelessWidget {
  const HomeDrawerNav({super.key, required this.swichMode});
  final String swichMode;


  @override
  Widget build(BuildContext context) {
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
                BlocBuilder<PersonalInfoCubit, PersonalInfoState>(
                  builder: (context, state) {
                    if (state is PersonalInfoLoaded) {
                      String name = cutName(
                        name: state.infoModel.name,
                        wordsnumber: 2,
                      );
                      return FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      );
                    } else {
                      return Text(
                        'Wating for data...',
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
            FilledButton(onPressed: (){
              NotificationService.showNotification(id: 0, title: "first time" , body: "content of the body");
            }, child: Text("Test notification ")),
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
                      builder: (context) => LoginView(),
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
