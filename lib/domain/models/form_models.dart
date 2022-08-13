import 'package:formz/formz.dart';

class Password extends FormzInput<String, String> {
  const Password.pure([String value = '']) : super.pure(value);
  const Password.dirty([String value = '']) : super.dirty(value);

  static final _passwordRegex = RegExp(r'^.{4,}$');

  @override
  String? validator(String? value) {
    return _passwordRegex.hasMatch(value ?? '') ? null : 'invalid password';
  }
}

class Username extends FormzInput<String, String> {
  const Username.pure([String value = '']) : super.pure(value);
  const Username.dirty([String value = '']) : super.dirty(value);

  static final _usernameRegex = RegExp(
    r'^.{4,}$',
  );

  @override
  String? validator(String? value) {
    return _usernameRegex.hasMatch(value ?? '') ? null : 'invalid username';
  }
}
