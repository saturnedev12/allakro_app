import 'package:flutter/material.dart';

class CustomDropDownField extends StatelessWidget {
  CustomDropDownField({
    Key? key,
    required this.labelText,
    this.sufixIcon,
    this.onTap,
    this.onSaved,
    this.onFieldSubmitted,
    this.validator,
    required this.items,
  }) : super(key: key);
  final String labelText;
  final Widget? sufixIcon;
  final List<String> items;
  final Function()? onTap;
  Function(String?)? onSaved;
  Function(String)? onFieldSubmitted;
  String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
        items: items
            .map((label) => DropdownMenuItem(
                  child: Text(label.toString()),
                  value: label,
                ))
            .toList(),
        validator: validator,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          labelText: labelText,
          filled: true,
          fillColor: Theme.of(context).colorScheme.onBackground,
          labelStyle: TextStyle(color: Colors.black),
          focusColor: Theme.of(context).colorScheme.onSurface,
          suffixIcon: sufixIcon,
          border: new OutlineInputBorder(
            borderRadius: new BorderRadius.circular(4.0),
            borderSide: new BorderSide(
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          focusedBorder: new OutlineInputBorder(
            borderRadius: new BorderRadius.circular(4.0),
            borderSide: new BorderSide(
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ),
        onChanged: (val) {});
  }
}
