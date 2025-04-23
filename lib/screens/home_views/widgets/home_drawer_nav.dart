import 'package:flutter/material.dart';

import '../../../helper/colors_app.dart';


class HomeDrawerNav extends StatelessWidget {
  const HomeDrawerNav({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context) ;
    return  Drawer(
      width: size.width *.77,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6 , vertical: 25),
        child: ListView(
          children: [
            Row(
              children :[
                CircleAvatar(
                  //radius: 25,
                  radius: size.height *.037,
                  backgroundImage: AssetImage("assets/images/lego.png" ) ,
                ),
                SizedBox(width: 10,),
                Text("Mahmoud Shamrokh" , style: TextStyle(
                fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
                ),
                Spacer(),
                IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios_rounded)),
              ],
            ),
            SizedBox(height: 50,),
            Text("Other" , style: TextStyle( fontSize: 24 , fontWeight: FontWeight.bold),),
            CustomItemDrawer(text: "Contact us", icon:Icons.question_mark,),
            CustomItemDrawer(text: "About App", icon:Icons.info_outline,),
            CustomItemDrawer(text: "Log Out", icon:Icons.logout,),
            SizedBox(
              height: MediaQuery.sizeOf(context).height *.42 ,
            ),
            MaterialButton(onPressed: (){},
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 40,vertical: 15),
              decoration: BoxDecoration(
                color: ColorsApp.primarycolor,
                borderRadius: BorderRadius.circular(30),
              ),
                child: Text( "Service Provider Mode " , style: TextStyle(
                color: Colors.white
                ),
                ),
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
    super.key, required this.text, required this.icon,
  });
  final String text ;
  final IconData icon ;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.zero,
      onPressed: (){},
      child: ListTile(
        titleTextStyle: TextStyle( fontSize: 16  , color: Colors.black),
        horizontalTitleGap: 0,
        title: Text(text),
        leading: SizedBox(
            width: 20,
            child: Icon(icon ,)),
      ),
    );
  }
}
