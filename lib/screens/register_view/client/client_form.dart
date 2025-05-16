import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/shared_widget.dart/form_widget/custom_email_and_phone.dart';
import 'package:graduation_project/shared_widget.dart/form_widget/custom_name_and_username.dart';
import 'package:graduation_project/shared_widget.dart/form_widget/custom_password.dart';
import 'package:graduation_project/shared_widget.dart/primary_button.dart';

import '../../../models/auth_models/register_model.dart';
import '../../../services/auth_service.dart';
import '../../../shared_widget.dart/custom_drop_down_list.dart';
import '../../../shared_widget.dart/custom_text_form.dart';
import '../register_message_diloge.dart';

class ClientForm extends StatefulWidget {
  const ClientForm({super.key});

  @override
  State<ClientForm> createState() => _ClientFormState();
}

class _ClientFormState extends State<ClientForm> {
  GlobalKey<FormState> formKey = GlobalKey();

  TextEditingController controllerFirst = TextEditingController();
  TextEditingController controllerUser = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerpassword = TextEditingController();
  TextEditingController controllerconfirm = TextEditingController();
  TextEditingController controllerPhone = TextEditingController();
  TextEditingController controllerDistrict = TextEditingController();
  GlobalKey<CustomDropdownListState> districtKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  void dispose() {
    controllerFirst.dispose();
    controllerUser.dispose();
    controllerEmail.dispose();
    controllerPhone.dispose();
    controllerpassword.dispose();
    controllerDistrict.dispose();
    controllerconfirm.dispose();
    super.dispose();
  }

  late String place ;

  Future<bool> registerClient() async {
    final client = RegisterModel(
      name: controllerFirst.text,
      email: controllerEmail.text,
      password: controllerpassword.text,
      phone: controllerPhone.text,
      service: null,
      area: place ,
    );
    try {
      var res = await AuthService().registerClint(client);
      print("Client======${res.toString()}========");
      return true;
    } on  DioException catch(e){
      if (e.response != null) {
        print("Error Status: ${e.response?.statusCode}");
        print("Error Data: ${e.response?.data}");
      } else {
        print("Error sending request: ${e.message}");
      }
      return false ;
    }

  }

  @override
  Widget build(BuildContext context) {
    double left = 5;
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Form(
        autovalidateMode: autovalidateMode,
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 25),
            CustomNameAndUsername(
              left: left,
              controllerFirst: controllerFirst,
              controllerUser: controllerUser,
            ),
            CustomEmailAndPhone(
              left: left,
              controllerEmail: controllerEmail,
              controllerPhone: controllerPhone,
            ),
            CustomTextForm(title: 'Districts'),
            CustomDropdownList(
              onChanged: (value){
                place = value! ;
              },
              key: districtKey,
              hintText: 'Select your district',
              validator: (value) {
                if (value == null) {
                  return 'Please select a district';
                }
                return null;
              },
              data: [
                'Al Zohour District',
                'Al-talatini District',
                'Al Manakh District',
                'South District',
                'East Port Said District',
                'Al-dowahi District',
                'West District',
              ],
            ),
            CustomPassword(
              left: left,
              controllerpassword: controllerpassword,
              controllerconfirm: controllerconfirm,
            ),
            SizedBox(height: 20),
            PrimaryButton(
              title: 'Register',
              radius: 15,
              onPressed: () async {
                if (formKey.currentState!.validate()) {
                  if(await registerClient()){
                    RegisterMessageDiloge.showSuccessDialog(context , "Register done");
                  }else{
                    RegisterMessageDiloge.showErrorDialog(context , "something wrong");

                  }
                  FocusScope.of(context).unfocus();
                  controllerFirst.clear();
                  controllerUser.clear();
                  controllerEmail.clear();
                  controllerPhone.clear();
                  controllerconfirm.clear();
                  controllerpassword.clear();
                  districtKey.currentState?.reset();
                }
                else{
                  autovalidateMode = AutovalidateMode.always;
                  setState(() {});
                }
                
                //!HomePageClient
              },
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
