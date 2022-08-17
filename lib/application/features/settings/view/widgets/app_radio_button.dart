import 'package:app/application/features/settings/settings_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRadioButton extends StatelessWidget {
  final Object value;
  final Object groupValue;
  final String text;
  const AppRadioButton({
    Key? key,
    required this.value,
    required this.groupValue,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Radio(
          activeColor: Theme.of(context).primaryColor,
          value: value,
          toggleable: true,
          groupValue: groupValue,
          onChanged: (value) {
            context.read<SettingsCubit>().genderChanged(value.toString());
          },
        ),
        Text(
          text,
          style: Theme.of(context).textTheme.headline6,
        ),
      ],
    );
  }
}
