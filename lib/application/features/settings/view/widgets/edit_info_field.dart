import 'package:app/application/features/login/view/widgets/input_field.dart';
import 'package:app/application/features/settings/settings_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditInfoField extends StatelessWidget {
  final String field;
  final Function(String key, String value)? onChanged;

  const EditInfoField({
    Key? key,
    required this.field,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InputField(
      label: field,
      labelStyle: Theme.of(context).textTheme.headline6,
      onChanged: (value) {
        onChanged != null
            ? onChanged!(field, value)
            : context.read<SettingsCubit>().fieldChanged(field, value);
      },
    );
  }
}
