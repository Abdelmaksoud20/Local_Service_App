import 'package:flutter/material.dart';
import 'package:graduation_project/screens/home_views/widgets/profile_body.dart';
import 'package:graduation_project/screens/home_views/widgets/profile_information_title.dart';

import '../../../helper/colors_app.dart';
import '../../../shared_widget.dart/custom_drop_down_list.dart';

class PersonalInformation extends StatelessWidget {
   PersonalInformation({super.key});
  final TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context) ;
    return Scaffold(
      backgroundColor: Colors.white,
      body:  Column(
        children: [
          ProfileInformationTitle(size: size ),
          SingleChildScrollView(
            child: ListView(
              shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.all(20),
            children: [
              const SectionTitle(title: "Personal Information",),
              const SizedBox(height: 15,),
              InformationItem(textEditingController: textEditingController , text: "First Name:", info: "Your First Name" ,),
              const SizedBox(height: 25,),
              InformationItem(textEditingController: textEditingController , text: "Last Name:", info: "Your Last Name" ,),
              const SizedBox(height: 25,),
              InformationItem(textEditingController: textEditingController , text: "Email:", info: "Your Email" ,),
              const SizedBox(height: 25,),
              CustomDropdownList(
                hintText: "Your Personal job" ,

                data: [
                  'Plumbing',
                  'Cleaning',
                  'Carpentry',
                  'Painting',
                  'Air conditionar',
                  'Electrical',
                ],
              ),
              const SizedBox(height: 25,),
              InformationItem(textEditingController: textEditingController , text: "Phone Number:", info: "Your Phone" ,),
            ],
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 12,vertical: 7),
                    decoration : BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                            width: 3,
                            color:  ColorsApp.primarycolor
                        ),
                    ),
                    child: Text("Discard Change" , style: TextStyle(
                      color:  ColorsApp.primarycolor,
                    ),
                    ),
                  ),
                ),
                SizedBox(width: 15,),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 17,vertical: 8),
                    decoration : BoxDecoration(
                        color: ColorsApp.primarycolor,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                            width: 3,
                            color:  ColorsApp.primarycolor
                        ),
                    ),
                    child: Text("Save Change" , style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color:  Colors.white,
                    ),
                    ),
                  ),
                ),

              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}

class InformationItem extends StatelessWidget {
  const InformationItem({
    super.key,
    required this.textEditingController, required this.text, required this.info,
  });

  final TextEditingController textEditingController;
  final String text ;
  final String info ;
  @override
  Widget build(BuildContext context) {
    return Row(

      children: [
        Text(text , style: TextStyle(
        fontSize: 12,
        ),
        ),
        const SizedBox(
          width: 15,
        ),
        Expanded(
          child: TextField(
           controller: textEditingController  ,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide.none
              ),
              fillColor: Colors.grey,
              filled: true,
              hintText: info
            ),
            cursorColor: Colors.white,
          ),
        ),
      ],
    );
  }
}
