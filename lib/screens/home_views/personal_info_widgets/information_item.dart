import 'package:flutter/material.dart';

class InformationItem extends StatelessWidget {
  const InformationItem({
    super.key,
    required this.textEditingController,
    required this.text,
    required this.info, this.data,
  });
  final void Function(String?)? data;
  final TextEditingController textEditingController;
  final String text;
  final String info;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(text, style: TextStyle(fontSize: 16)),
        const SizedBox(width: 6),
        Expanded(
          child: TextField(
            onChanged: data,
            controller: textEditingController,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              border: OutlineInputBorder(borderSide: BorderSide.none),
              fillColor: const Color(0xffE8E6E6),
              filled: true,
              hintText: info,
            ),
            cursorColor: Colors.white,
          ),
        ),
      ],
    );
  }
}
