import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ServiceProviderHomeAppBar extends StatelessWidget {
  const ServiceProviderHomeAppBar({super.key, this.image, this.name});
  final dynamic image;
  final String? name ;
  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 15,
      children: [
        CircleAvatar(
          radius: 35,
          backgroundImage: AssetImage(
            'assets/images/60dac1a160f26da1106becfca00cb805.jpeg',
          ),
        ),
        Text(
          'Ali',
          style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 18),
        ),
        Spacer(),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.notifications_outlined, size: 34),
        ),
      ],
    );
  }
}