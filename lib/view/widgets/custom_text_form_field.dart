import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustomTextFormField extends StatelessWidget {
final String text;
final String hint;
final Function(String?) onSave;
final String? Function(String?)? validator;


  const CustomTextFormField ({ Key? key, required this.text, required this.hint, required this.onSave, required this.validator }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: text,
                  fontSize: 14,
                  color: Colors.grey.shade900,
                ),
                TextFormField(
                  onSaved:onSave,
                  validator: validator,
                  decoration: InputDecoration(
                    hintText: hint,
                    hintStyle: TextStyle(color: Colors.grey),
                    fillColor: Colors.white,
                  ),
                )
              ],
            ),
    );
  }
}