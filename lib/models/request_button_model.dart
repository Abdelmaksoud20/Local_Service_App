import 'package:flutter/material.dart';
import 'package:graduation_project/shared_widget.dart/custom_drop_down_list.dart';

class RequestButtonModel {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController executionDayController = TextEditingController();
  final GlobalKey<CustomDropdownListState> dropDownKey =
      GlobalKey<CustomDropdownListState>();
  void clearAll() {
    nameController.clear();
    emailController.clear();
    mobileController.clear();
    dropDownKey.currentState?.reset();
    executionDayController.clear();
    addressController.clear();
  }

  void disposeAll() {
    nameController.dispose();
    emailController.dispose();
    mobileController.dispose();
    executionDayController.dispose();
    addressController.dispose();
  }
}
