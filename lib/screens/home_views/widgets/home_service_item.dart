import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../helper/font_size.dart';

class HomeServiceItem extends StatelessWidget {
  const HomeServiceItem( BuildContext context , {
    super.key, required this.size, required this.name, required this.image,
  });
  final Size size;
 final String name ;
 final String image ;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Card(
        color: Colors.white70,
        elevation:3 ,
        child: Container(
          //  width: 80,
          width: size.width * .232,
          padding: EdgeInsets.all(10),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Lottie.asset(
                  image,
                                 //   height:110,
                ),
                Text(
                  name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: FontSizeApp.fontSize13
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}