import 'package:app/application/features/login/view/widgets/submit_button.dart';
import 'package:app/application/features/profile/view/widgets/devidered_title.dart';
import 'package:app/application/features/profile/view/widgets/space.dart';
import 'package:app/application/features/settings/settings_cubit.dart';
import 'package:app/application/utils/config/app_functions.dart';
import 'package:app/application/widgets/loading_widget.dart';
import 'package:app/application/widgets/top_bar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import 'widgets/app_date_picker.dart';
import 'widgets/edit_info_field.dart';
import 'widgets/gender_widget.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  bool _settingsBuildWhen(SettingsState previous, SettingsState current) {
    if (previous is SettingsInitial && current is SettingsInitial) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SettingsCubit(),
      child: Scaffold(
        appBar: const TopBar(text: 'PROFILE'),
        body: Column(
          children: [
            const Space(),
            const DivideredTitle(title: 'EDIT PROFILE'),
            const Space(),
            Expanded(
              child: SingleChildScrollView(
                child: BlocConsumer<SettingsCubit, SettingsState>(
                  listener: (context, state) {
                    if (state is EditFailed) {
                      AppFunctions.showSnackBar(
                        context,
                        'edit failed',
                        Colors.red,
                      );
                    } else if (state is EditSuccess) {
                      AutoRouter.of(context).pop();
                      AppFunctions.showSnackBar(
                        context,
                        'edited successfully',
                        Colors.green,
                      );
                    }
                  },
                  buildWhen: _settingsBuildWhen,
                  builder: (context, state) {
                    if (state is Loading) {
                      return const Center(child: LoadingWidget());
                    }
                    return Column(
                      children: [
                        const EditInfoField(field: 'username'),
                        const EditInfoField(field: 'email'),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 45.w,
                              child: const EditInfoField(field: 'firstname'),
                            ),
                            SizedBox(
                              width: 45.w,
                              child: const EditInfoField(field: 'lastname'),
                            ),
                          ],
                        ),
                        const GenderWidget(),
                        const Space(),
                        const EditInfoField(field: 'address'),
                        const EditInfoField(field: 'services'),
                        const EditInfoField(field: 'preferences'),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            AppDatePicker(
                              text: 'birth date',
                              value: 'birth_date',
                              chooseDate:
                                  context.read<SettingsCubit>().fieldChanged,
                            ),
                            AppDatePicker(
                              text: 'start date',
                              value: 'start_date',
                              chooseDate:
                                  context.read<SettingsCubit>().fieldChanged,
                            ),
                          ],
                        ),
                        AppDatePicker(
                          text: 'graduate date',
                          value: 'graduate_date',
                          chooseDate:
                              context.read<SettingsCubit>().fieldChanged,
                        ),
                        const SizedBox(height: 30),
                        SubmitButton(
                          onPressed: context.read<SettingsCubit>().submit,
                          text: 'Submit Changes',
                        ),
                        const Space()
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
