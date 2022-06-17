import 'package:authentication_firebase/core/util/input_decoration.dart';
import 'package:flutter/material.dart';

class StandardTextFormField extends StatelessWidget {
  final String label;

  const StandardTextFormField({
    Key? key,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: '',
      decoration: getFormFieldDecoration(label),
    );
  }
}
