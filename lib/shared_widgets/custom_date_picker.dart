import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class CustomDatePicker extends StatefulWidget {
  CustomDatePicker({Key? key, required this.labelle, this.validator})
      : super(key: key);
  final String labelle;
  String? Function(String?)? validator;
  @override
  _CustomDatePickerState createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  late TextEditingController controller;
  void onChange(String val) {
    setState(() {
      controller.text = val;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TextEditingController(text: '');
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator,
      focusNode: AlwaysDisabledFocusNode(),
      controller: controller,
      onTap: () {
        DatePicker.showDatePicker(context,
            showTitleActions: true, minTime: DateTime.now(),
            //maxTime: DateTime(2019, 6, 7),
            onChanged: (date) {
          onChange("${date.day}/${date.month}/${date.year}");
        }, onConfirm: (date) {
          onChange("${date.day}/${date.month}/${date.year}");
        }, currentTime: DateTime.now(), locale: LocaleType.fr);
      },
      decoration: InputDecoration(
        labelText: widget.labelle,
        filled: true,
        fillColor: Theme.of(context).colorScheme.onBackground,
      ),
    );
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
