import 'package:authentication_firebase/core/util/input_decoration.dart';
import 'package:flutter/material.dart';

class StandardTextFormField extends StatefulWidget {
  final String label;
  final String? initialValue;

  final FormFieldValidator<String?>? validator;
  final void Function(String? value)? onFieldSubmitted;

  final FocusNode? focusNode;

  const StandardTextFormField({
    Key? key,
    required this.label,
    this.initialValue,
    this.validator,
    this.onFieldSubmitted,
    this.focusNode,
  }) : super(key: key);

  @override
  State<StandardTextFormField> createState() => _StandardTextFormFieldState();
}

class _StandardTextFormFieldState extends State<StandardTextFormField> {
  GlobalKey<FormFieldState> defaultFieldKey = GlobalKey<FormFieldState>();

  @override
  Widget build(BuildContext context) {
    return Focus(
      onFocusChange: (_) => defaultFieldKey.currentState?.validate(),
      child: Builder(builder: (context) {
        return TextFormField(
          key: defaultFieldKey,
          initialValue: widget.initialValue ?? '',
          decoration: getFormFieldDecoration(widget.label),
          validator: (value) {
            if (FocusScope.of(context).hasFocus) return null;

            final validation = widget.validator != null ? widget.validator!(value) : null;
            return validation;
          },
          onFieldSubmitted: widget.onFieldSubmitted,
          focusNode: widget.focusNode,
        );
      }),
    );
  }
}
