import 'package:flutter/material.dart';
import 'package:graduation_project/shared_widget.dart/custom_drop_down_list.dart';

class PersonalInfoControalls {
  final TextEditingController nameEditingController = TextEditingController();
  final TextEditingController emailEditingController = TextEditingController();
  final TextEditingController phoneEditingController = TextEditingController();
  final GlobalKey<CustomDropdownListState> dropDownKeyArea=GlobalKey<CustomDropdownListState>();
  final GlobalKey<CustomDropdownListState> dropDownKeyservice=GlobalKey<CustomDropdownListState>();
  String? selectedArea;

  void setSelectedArea(String? area) {
    selectedArea = area;
  }
}