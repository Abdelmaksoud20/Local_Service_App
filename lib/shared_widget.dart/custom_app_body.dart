import 'package:flutter/material.dart';

class CustomAppBody extends StatelessWidget {
  const CustomAppBody({super.key, required this.child,});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    var height= MediaQuery.sizeOf(context).height;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      height: double.infinity,
      margin: EdgeInsets.only(top: height *0.2),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
      ),
      child: child,
    );
  }
}
