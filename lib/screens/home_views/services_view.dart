import 'package:flutter/material.dart';

import '../../helper/colors_app.dart';

class ServicesView extends StatelessWidget {
  const ServicesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: ListView(
        children: [
          Container(
            height: 50,
            padding: EdgeInsets.symmetric(horizontal: 15),
            color: ColorsApp.primarycolor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TitleTextItem(name: "Type",),
                TitleTextItem(name: "Date",),
                TitleTextItem(name: "Provider",),
                TitleTextItem(name: "Status",),
              ],
            ),
          ),
          ServicesItem(job: 'Carpenter', jobState: "In process", name: "Mahmoud", color: Colors.grey,),
          ServicesItem(job: 'Carpenter', jobState: "DisAgree", name: "Mohamed", color: Colors.red,),
          ServicesItem(job: 'Carpenter', jobState: "Accepted", name: "Shamrokh",color: Colors.green,),
          ServicesItem(job: 'Carpenter', jobState: "Accepted", name: "Ismail",color: Colors.green,),

        ],
      ),
    );
  }
}

class ServicesItem extends StatelessWidget {
  const ServicesItem({
    super.key, this.name = "-", required this.job, required this.jobState, required this.color,
  });
  final String name , job ,jobState ;
  final Color color ;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height:  10,),
        const Divider(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(job),
              Text("20-10-2025"),
              SizedBox(
                  width: 60,
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text( name , maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
              ),
              Container(
                //width: 70,
                width: MediaQuery.sizeOf(context).width *.2,
                padding: EdgeInsets.symmetric(vertical: 8 ,horizontal: 7),
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Text(jobState , style: TextStyle( fontSize : 12, color: Colors.white , ),)),
            ],
          ),
        ),
      ],
    );
  }
}

class TitleTextItem extends StatelessWidget {
  const TitleTextItem({
    required this.name,
    super.key,
  });

 final String name ;
  @override
  Widget build(BuildContext context) {
    return Text( name , style: TextStyle(
      color: Colors.white ,
      fontWeight: FontWeight.w600,fontSize: 20
    ),);
  }
}
