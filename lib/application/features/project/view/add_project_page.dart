import 'package:app/application/features/login/view/widgets/submit_button.dart';
import 'package:app/application/features/project/project_cubit.dart';
import 'package:app/application/features/settings/view/widgets/app_date_picker.dart';
import 'package:app/application/features/settings/view/widgets/edit_info_field.dart';
import 'package:app/application/utils/config/app_functions.dart';
import 'package:app/application/widgets/loading_widget.dart';
import 'package:app/application/widgets/top_bar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../profile/view/widgets/devidered_title.dart';
import '../../profile/view/widgets/space.dart';

class AddProjectPage extends StatelessWidget {
  const AddProjectPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddProjectCubit(),
      child: Scaffold(
        appBar: const TopBar(text: 'PROFILE'),
        body: Column(
          children: [
            const Space(),
            const DivideredTitle(title: 'ADD PROJECT'),
            const Space(),
            Expanded(
              child: SingleChildScrollView(
                child: BlocConsumer<AddProjectCubit, AddProjectState>(
                  listener: (context, state) {
                    if (state is Failed) {
                      AppFunctions.showSnackBar(
                        context,
                        'addition failed',
                        Colors.red,
                      );
                    } else if (state is Success) {
                      AutoRouter.of(context).pop();
                      AppFunctions.showSnackBar(
                        context,
                        'added successfully',
                        Colors.green,
                      );
                    }
                  },
                  builder: (context, state) {
                    if (state is Loading) {
                      return const Center(child: LoadingWidget());
                    }
                    return Column(
                      children: [
                        EditInfoField(
                          field: 'position',
                          onChanged: context
                              .read<AddProjectCubit>()
                              .membershipFieldChanged,
                        ),
                        EditInfoField(
                          field: 'title',
                          onChanged: context
                              .read<AddProjectCubit>()
                              .projectFieldChanged,
                        ),
                        EditInfoField(
                          field: 'description',
                          onChanged: context
                              .read<AddProjectCubit>()
                              .projectFieldChanged,
                        ),
                        EditInfoField(
                          field: 'link',
                          onChanged: context
                              .read<AddProjectCubit>()
                              .projectFieldChanged,
                        ),
                        ImagePickerButton(
                          onChanged: context
                              .read<AddProjectCubit>()
                              .projectFieldChanged,
                        ),
                        const Space(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            AppDatePicker(
                              text: 'birth date',
                              value: 'birth_date',
                              chooseDate: context
                                  .read<AddProjectCubit>()
                                  .projectFieldChanged,
                            ),
                            AppDatePicker(
                              text: 'start date',
                              value: 'start_date',
                              chooseDate: context
                                  .read<AddProjectCubit>()
                                  .projectFieldChanged,
                            ),
                          ],
                        ),
                        const SizedBox(height: 30),
                        SubmitButton(
                          onPressed: context.read<AddProjectCubit>().submit,
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

class ImagePickerButton extends StatelessWidget {
  final Function(String key, String value) onChanged;

  const ImagePickerButton({
    Key? key,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        var file = await ImagePicker().pickImage(
          source: ImageSource.gallery,
        );
        if (file != null) {
          onChanged('photo', file.path);
        }
      },
      icon: const Icon(
        Icons.add_photo_alternate_outlined,
        color: Colors.green,
      ),
    );
  }
}
