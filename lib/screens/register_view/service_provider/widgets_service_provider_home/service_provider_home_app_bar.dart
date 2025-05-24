import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ServiceProviderHomeAppBar extends StatelessWidget {
  const ServiceProviderHomeAppBar({super.key, this.image, this.name});
  final dynamic image;
  final String? name;
  @override
  Widget build(BuildContext context) {
    List<String> words = name!.split(" ");
    String providerName = "${words[0]} ${words[1]}";
    return Row(
      spacing: 15,
      children: [
        IconButton(
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          icon: Icon(Icons.menu),
        ),
        CircleAvatar(
          radius: 35,
          backgroundImage: AssetImage(
            'assets/images/60dac1a160f26da1106becfca00cb805.jpeg',
          ),
        ),
        Text(
          providerName,
          style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 18),
        ),
        Spacer(),
        IconButton(
          onPressed: (){},
          icon: Icon(Icons.notifications_outlined, size: 34),
        ),
      ],
    );
  }
}
