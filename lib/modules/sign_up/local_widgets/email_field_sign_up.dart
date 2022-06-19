import 'package:authentication_firebase/core/util/validations.dart';
import 'package:authentication_firebase/global_widgets/standard_text_form_field.dart';
import 'package:authentication_firebase/modules/sign_up/sign_up_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmailFieldSignUp extends GetView<SignUpPageController> {
  const EmailFieldSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StandardTextFormField(
      label: 'Email',
      validator: validateEmail,
      onFieldSubmitted: (_) => controller.signUpPasswordFocusNode.requestFocus(),
      focusNode: controller.signUpEmailFocusNode,
    );
  }
}
