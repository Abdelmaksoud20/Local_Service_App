import 'package:flutter/material.dart';
import 'package:graduation_project/shared_widget.dart/form_widget/custom_email_and_phone.dart';
import 'package:graduation_project/shared_widget.dart/form_widget/custom_name_and_username.dart';
import 'package:graduation_project/shared_widget.dart/form_widget/custom_password.dart';
import 'package:graduation_project/shared_widget.dart/primary_button.dart';

class ClientForm extends StatefulWidget {
  const ClientForm({super.key});

  @override
  State<ClientForm> createState() => _ClientFormState();
}

class _ClientFormState extends State<ClientForm> {
  GlobalKey<FormState> formKey = GlobalKey();

  TextEditingController controllerFirst = TextEditingController();
  TextEditingController controllerLast = TextEditingController();
  TextEditingController controllerUser = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerpassword = TextEditingController();
  TextEditingController controllerconfirm = TextEditingController();
  TextEditingController controllerPhone = TextEditingController();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
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
              controllerLast: controllerLast,
              controllerUser: controllerUser,
            ),
            CustomEmailAndPhone(
              left: left,
              controllerEmail: controllerEmail,
              controllerPhone: controllerPhone,
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
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  FocusScope.of(context).unfocus();
                  controllerFirst.clear();
                  controllerLast.clear();
                  controllerUser.clear();
                  controllerEmail.clear();
                  controllerPhone.clear();
                  controllerconfirm.clear();
                  controllerpassword.clear();
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
