import 'package:flutter/material.dart';
import 'package:graduation_project/models/form_field_model.dart';
import 'package:graduation_project/shared_widget.dart/custom_drop_down_list.dart';
import 'package:graduation_project/shared_widget.dart/custom_form.dart';
import 'package:graduation_project/shared_widget.dart/custom_text_form.dart';
import 'package:graduation_project/shared_widget.dart/form_widget/custom_email_and_phone.dart';
import 'package:graduation_project/shared_widget.dart/form_widget/custom_name_and_username.dart';
import 'package:graduation_project/shared_widget.dart/form_widget/custom_password.dart';
import 'package:graduation_project/shared_widget.dart/primary_button.dart';

class ServiceProviderForm extends StatefulWidget {
  const ServiceProviderForm({super.key});

  @override
  State<ServiceProviderForm> createState() => _ServiceProviderFormState();
}

class _ServiceProviderFormState extends State<ServiceProviderForm> {
  TextEditingController controllerFirst = TextEditingController();
  TextEditingController controllerLast = TextEditingController();
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
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  void dispose() {
    controllerFirst.dispose();
    controllerLast.dispose();
    controllerUser.dispose();
    controllerEmail.dispose();
    controllerPhone.dispose();
    controllerPassword.dispose();
    controllerConfirmPassword.dispose();
    controllerSkills.dispose();
    controllerDistrict.dispose();
    controllerService.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double left = 5;
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Form(
        key: formKey,
        autovalidateMode: autovalidateMode,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
            CustomTextForm(title: 'Districts'),
            CustomDropdownList(
              key: districtKey,
              hintText: 'Select your district',
              validator: (value) {
                if (value == null) {
                  return 'Please select a district';
                }
                return null;
              },
              data: [
                'Al-Sharq',
                'Al-Arab',
                'Al-Manakh',
                'Al-Dawahi',
                'Al-Zohour',
                'Al-Janoub',
                'Al-Gharb',
              ],
            ),
            CustomTextForm(title: 'The service your provide'),
            CustomDropdownList(
              key: serviceKey,
              hintText: 'Select your service',
              validator: (value) {
                if (value == null) {
                  return 'Please select a service';
                }
                return null;
              },
              data: [
                'Plumbing',
                'Cleaning',
                'Carpentry',
                'Painting',
                'Air conditionar',
                'Electrical',
              ],
            ),
            CustomTextForm(title: 'Skils(optional)'),
            CustomForm(
              formModel: FormFieldModel(
                hintText: 'Enter your skils',
                keyboardType: TextInputType.name,
                left: left,
                onchanged: (data) {},
              ),
            ),
            CustomPassword(
              left: left,
              controllerpassword: controllerPassword,
              controllerconfirm: controllerConfirmPassword,
            ),
            SizedBox(height: 15),
            PrimaryButton(
              title: 'Register',
              radius: 15,
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  controllerFirst.clear();
                  controllerLast.clear();
                  controllerUser.clear();
                  controllerEmail.clear();
                  controllerPhone.clear();
                  controllerConfirmPassword.clear();
                  controllerPassword.clear();
                  districtKey.currentState?.reset();
                  serviceKey.currentState?.reset();
                }
                else{
                  autovalidateMode = AutovalidateMode.always;
                
                }
                //!HomePagetoServiceProvider
              },
            ),
            SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
