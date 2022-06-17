import 'package:authentication_firebase/global_widgets/standard_text_form_field.dart';
import 'package:flutter/material.dart';

class EmailField extends StatelessWidget {
  const EmailField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const StandardTextFormField(
      label: 'Email',
    );
  }
}
