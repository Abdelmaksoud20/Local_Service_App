
import 'package:flutter/material.dart';

class CustomCheckboxList extends StatefulWidget {
  const CustomCheckboxList({
    super.key,
    required this.data,
    required this.onChanged,
    required this.hintText,
    this.initialSelectedItems,
    this.color,
  });

  final List<String> data;
  final List<String>? initialSelectedItems;
  final ValueChanged<List<String>> onChanged;
  final String hintText;
  final Color? color;

  @override
  State<CustomCheckboxList> createState() => _CustomCheckboxListState();
}

class _CustomCheckboxListState extends State<CustomCheckboxList> {
  late List<String> selectedItems;

  @override
  void initState() {
    super.initState();
    selectedItems = widget.initialSelectedItems ?? [];
  }

  void toggleSelection(String item) {
    setState(() {
      if (selectedItems.contains(item)) {
        selectedItems.remove(item);
      } else {
        selectedItems.add(item);
      }
    });
    widget.onChanged(selectedItems);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.hintText,
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: widget.color ?? Colors.black)),
        const SizedBox(height: 10),
        ...widget.data.map((item) {
          final isChecked = selectedItems.contains(item);
          return CheckboxListTile(
            value: isChecked,
            title: Text(item),
            onChanged: (_) => toggleSelection(item),
            controlAffinity: ListTileControlAffinity.leading,
          );
        }),
      ],
    );
  }
}
