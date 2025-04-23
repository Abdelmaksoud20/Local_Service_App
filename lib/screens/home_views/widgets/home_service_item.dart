import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HomeServiceItem extends StatelessWidget {
  const HomeServiceItem( BuildContext context , {
    super.key, required this.size, required this.name, required this.image, required this.color,
  });
  final Size size;
 final String name ;
 final String image ;
 final Color color ;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: Card(
        color: Colors.white70,
        elevation:2 ,
        child: Container(
          //  width: 80,
          width: size.width * .22,
          padding: EdgeInsets.all(10),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(image,color: color,
                ),
                // Lottie.asset(
                //   image,
                //   width: 50,
                //   height: 50,
                // ),
                Text(
                  name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ]),
        ),
      ),
    );
  }
}