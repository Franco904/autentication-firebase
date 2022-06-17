String? validateRequired(String? value) {
  if (value == '' || value == null) return 'Obrigatório';

  return null;
}

String? validateEmail(String? value) {
  if (value == '' || value == null) return 'Obrigatório';

  final exp = RegExp(r'^[\w\.\-]+@[\w\.\-]+$');
  if (!exp.hasMatch(value)) return 'Email inválido';

  return null;
}

String? validatePassword(String? value) {
  if (value == '' || value == null) return 'Obrigatório';

  if (value.length < 6) return 'Deve ter pelo menos 6 caracteres';
  if (value.length > 20) return 'Deve ter no máximo 20 caracteres';

  return null;
}
