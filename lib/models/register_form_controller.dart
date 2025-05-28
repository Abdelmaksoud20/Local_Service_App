import 'package:flutter/material.dart';

import '../shared_widget.dart/custom_drop_down_list.dart';

class RegisterFormController {
  TextEditingController controllerFirst = TextEditingController();
  TextEditingController controllerUser = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPhone = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  TextEditingController controllerConfirmPassword = TextEditingController();
  TextEditingController controllerSkills = TextEditingController();
  TextEditingController controllerDistrict = TextEditingController();
  TextEditingController controllerService = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  GlobalKey<CustomDropdownListState> districtKey = GlobalKey();
  GlobalKey<CustomDropdownListState> serviceKey = GlobalKey();

  void disposeRegisterController() {
    controllerFirst.dispose();
    controllerUser.dispose();
    controllerEmail.dispose();
    controllerPhone.dispose();
    controllerPassword.dispose();
    controllerConfirmPassword.dispose();
    controllerSkills.dispose();
    controllerDistrict.dispose();
    controllerService.dispose();
  }

  void clearRegisterController() {
    controllerFirst.clear();
    controllerUser.clear();
    controllerEmail.clear();
    controllerPhone.clear();
    controllerConfirmPassword.clear();
    controllerPassword.clear();
    districtKey.currentState?.reset();
    serviceKey.currentState?.reset();
  }
}
