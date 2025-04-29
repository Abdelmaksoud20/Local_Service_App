import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class CustomDropdownList extends StatefulWidget {
  const CustomDropdownList({
    super.key,
    required this.data,
    this.validator,
    this.initialValue,
    this.onChanged, required this.hintText,
  });
  final List<String> data;
  final String? Function(String?)? validator;
  final String? initialValue;
  final ValueChanged<String?>? onChanged;
  final String hintText;
  @override
  State<CustomDropdownList> createState() => CustomDropdownListState();
}

class CustomDropdownListState extends State<CustomDropdownList> {
  String? selectedItem;
  @override
  void initState() {
    super.initState();
    selectedItem = widget.initialValue;
  }

  void reset() {
    setState(() {
      selectedItem = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Column(
        children: [
          DropdownButtonFormField2<String>(
            validator: widget.validator,
            isExpanded: true,
            decoration: InputDecoration(
              border: border(),
              enabledBorder: border(),
              focusedBorder: border(color: Colors.black),
            ),
            value: selectedItem,
            hint: Text(
              widget.hintText,
              style: TextStyle(color: Colors.blueGrey, fontSize: 18),
            ),
            items:
                widget.data.map((item) {
                  return DropdownMenuItem<String>(
                    value: item,
                    child: Text(item),
                  );
                }).toList(),
            onChanged: (value) {
              setState(() {
                selectedItem = value!;
              });
              if (widget.onChanged != null) widget.onChanged!(value);
            },
            dropdownStyleData: DropdownStyleData(
              direction: DropdownDirection.left,
              isOverButton: false,
              maxHeight: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            menuItemStyleData: const MenuItemStyleData(
              padding: EdgeInsets.symmetric(horizontal: 7),
            ),
          ),
        ],
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
