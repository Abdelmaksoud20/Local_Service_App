
import 'package:flutter/material.dart';
import 'package:graduation_project/models/personal_info_model.dart';
import 'package:graduation_project/screens/home_views/widgets/profile_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({
    super.key,
    required this.id,
    required this.check,
    this.data,
  });
  final int id;
  final bool check;
  final PersonalInfoModel? data;
  @override
  Widget build(BuildContext context) {

    return ProfileBody(id: id, check: check, data: data);
  }
}
