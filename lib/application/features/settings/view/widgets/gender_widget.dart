import 'package:app/application/features/settings/settings_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_radio_button.dart';

class GenderWidget extends StatelessWidget {
  const GenderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, state) {
        if (state is SettingsInitial) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'gender',
                style: Theme.of(context).textTheme.headline6,
              ),
              AppRadioButton(
                text: 'male',
                groupValue: state.genderValue,
                value: 'M',
              ),
              AppRadioButton(
                text: 'female',
                groupValue: state.genderValue,
                value: 'F',
              ),
            ],
          );
        }
        return Container();
      },
    );
  }
}
