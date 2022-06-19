import 'package:authentication_firebase/core/util/validations.dart';
import 'package:authentication_firebase/global_widgets/standard_text_form_field.dart';
import 'package:authentication_firebase/modules/sign_up/sign_up_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PasswordFieldSignUp extends GetView<SignUpPageController> {
  const PasswordFieldSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StandardTextFormField(
      label: 'Senha',
      hasObscureText: true,
      validator: validatePassword,
      onFieldSubmitted: (_) => FocusScope.of(context).unfocus(),
      focusNode: controller.signUpPasswordFocusNode,
    );
  }
}
