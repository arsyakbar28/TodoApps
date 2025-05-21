import 'package:flutter/material.dart';
import 'package:todoapp/utils/app_str.dart';

class RepTextField extends StatelessWidget {
  const RepTextField({
    super.key,
    required this.controller,
    this.isForDescription = false,
  });

  final TextEditingController controller;
  final bool isForDescription;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: ListTile(
        title: TextFormField(
          controller: controller,
          maxLines: !isForDescription ? 2 : 3,
          cursorHeight: 20,
          style: TextStyle(color: Colors.black),
          decoration: InputDecoration(
            hintText: isForDescription ? AppStr.addNote : AppStr.taskString,
            hintStyle: const TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.normal,
              fontSize: 16,
              height: 1,
            ),
            alignLabelWithHint: true,
            contentPadding: const EdgeInsets.only(top: 20),
            // Center hint text
            floatingLabelBehavior: FloatingLabelBehavior.never,
            // Center text in the field
            // To center hint, also center the input text
            // So add textAlign to TextFormField:
            prefixIcon:
                isForDescription
                    ? const Icon(Icons.bookmark, color: Colors.grey)
                    : null,
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 1),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 1),
            ),
          ),
          onFieldSubmitted: (value) {},
          onChanged: (value) {},
        ),
      ),
    );
  }
}