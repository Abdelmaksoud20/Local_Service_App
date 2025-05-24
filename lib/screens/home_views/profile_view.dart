import 'package:flutter/material.dart';
import 'package:graduation_project/screens/home_views/widgets/profile_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key, this.data});
  final dynamic data;
  @override
  Widget build(BuildContext context) {
    return ProfileBody(data: data,);
  }
}
