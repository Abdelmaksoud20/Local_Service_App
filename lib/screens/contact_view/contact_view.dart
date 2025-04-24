import 'package:flutter/material.dart';
import 'package:graduation_project/helper/colors_app.dart';
import '../../helper/font_size.dart';

class ContactView extends StatelessWidget {
  const ContactView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.primarycolor,
      body: Padding(
        padding: EdgeInsets.only(top: 100 ),
        child: Center(
          child: Column(
            children:[
              Text("Contact Us " , style: TextStyle(
                color: Colors.white,
                fontSize: FontSizeApp.fontSize32,
                fontWeight: FontWeight.bold
              ),
              ),
              SizedBox(height: 40,),
              ContactItems(text: "portsaid,Almanakh District,23 rd Streat" , icon :Icons.location_on_outlined),
              ContactItems( text: "LocalService.com" , icon: Icons.mail_outline,),
              ContactItems( text: "+201028771202" , icon: Icons.phone_enabled_outlined,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text("WWW.localservice.com" , style: TextStyle(color: Colors.white , fontSize: 16), ),
                  SizedBox(height: 25,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/Vector.png" , width: 20,),
                      const SizedBox(width: 14,),
                      Image.asset("assets/images/Vector (1).png",width: 20,),
                      const SizedBox(width: 14,),
                      Image.asset("assets/images/Vector (2).png",width: 20,),
                      const SizedBox(width: 14,),
                      Image.asset("assets/images/Vector (3).png",width: 20,),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ContactItems extends StatelessWidget {
  const ContactItems({
    super.key, required this.icon, required this.text,
  });
  final IconData icon;
  final String text ;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22 , vertical: 25),
      child: Row(
        spacing: 20,
        children: [
          Icon(icon , color: Colors.white , size: 32, ),
          Text(text ,
            overflow:TextOverflow.ellipsis ,
            style: TextStyle(
                color: Colors.white
            ),
          ),
        ],
      ),
    );
  }
}
