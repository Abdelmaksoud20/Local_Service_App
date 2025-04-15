import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class CustomDropdownListLocation extends StatefulWidget {
  const CustomDropdownListLocation({super.key});

  @override
  State<CustomDropdownListLocation> createState() => _CustomDropdownListLocationState();
}

class _CustomDropdownListLocationState extends State<CustomDropdownListLocation> {
  List<String> locations = ['Al-Sharq', 'Al-Arab', 'Al-Manakh','Al-Dawahi', 'Al-Zohour', 'Al-Janoub', 'Al-Gharb'];
  String? selectedItem;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10,bottom: 10),
      child: SizedBox(
        child: SingleChildScrollView(
          child: DropdownButtonFormField2<String>(
            isExpanded: true,
            decoration: InputDecoration(
              enabledBorder: border(),
              focusedBorder: border(color: Colors.black),
            ),
            value: selectedItem,
            hint: Text(
              'select your location',
              style: TextStyle(color: Colors.blueGrey, fontSize: 18),
            ),
            items:
                locations.map((item) {
                  return DropdownMenuItem<String>(value: item, child: Text(item));
                }).toList(),
            onChanged: (value) {
              setState(() {
                selectedItem = value!;
              });
            },
            
            dropdownStyleData: DropdownStyleData(
              isOverButton: false,
              maxHeight: 200,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
            ),
            menuItemStyleData: const MenuItemStyleData(
              padding: EdgeInsets.symmetric(horizontal: 7),
            ),
          ),
        ),
      ),
    );
  }

  OutlineInputBorder border({Color? color}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: color ?? Colors.blueGrey),
    );
  }
}