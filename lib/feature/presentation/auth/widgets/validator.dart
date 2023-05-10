String? validatePassword(String? value) {
  final valueWithoutSpaces = value?.replaceAll(' ', '');
  if (valueWithoutSpaces == null || valueWithoutSpaces.isEmpty) {
    return 'Поле не может быть пустым';
  } else if (value!.length < 3) {
    return 'Пароль должен быть длиннее 6 символов';
  } else if (value.length > 15) {
    return 'Пароль не должен быть длиннее 15 символов';
  }
  return null;
}

String? validateField(String? value) {
  final valueWithoutSpaces = value?.replaceAll(' ', '');
  if (valueWithoutSpaces == null || valueWithoutSpaces.isEmpty) {
    return 'Поле не может быть пустым';
  }
  return null;
}
