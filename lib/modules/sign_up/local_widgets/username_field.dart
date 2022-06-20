import 'package:authentication_firebase/core/util/validations.dart';
import 'package:authentication_firebase/global_widgets/standard_text_form_field.dart';
import 'package:authentication_firebase/modules/sign_up/sign_up_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UsernameField extends GetView<SignUpPageController> {
  const UsernameField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StandardTextFormField(
      label: 'Nome de usuário',
      validator: validateRequired,
      onChanged: onChanged,
      onFieldSubmitted: (_) => controller.signUpEmailFocusNode.requestFocus(),
      focusNode: controller.usernameFocusNode,
    );
  }

  void onChanged(String? username) {
    if (username == null || username.isEmpty) {
      controller.signUpUsername.value = '';
      return;
    }

    controller.signUpUsername.value = username;
  }
}
