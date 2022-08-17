import 'package:app/application/features/add_forum/add_forum_cubit.dart';
import 'package:app/application/features/login/view/widgets/submit_button.dart';
import 'package:app/application/features/profile/view/widgets/devidered_title.dart';
import 'package:app/application/features/profile/view/widgets/space.dart';
import 'package:app/application/features/settings/view/widgets/edit_info_field.dart';
import 'package:app/application/utils/config/app_functions.dart';
import 'package:app/application/widgets/loading_widget.dart';
import 'package:app/application/widgets/top_bar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class AddForumPage extends StatelessWidget {
  const AddForumPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddForumCubit(),
      child: Scaffold(
        appBar: const TopBar(text: 'DISCUSSION'),
        body: BlocConsumer<AddForumCubit, AddForumState>(
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
                'Logged in Successfully',
                Colors.green,
              );
            }
          },
          builder: (context, state) {
            if (state is Loading) {
              return const LoadingWidget();
            }
            if (state is InitialState) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    const Space(),
                    const DivideredTitle(title: 'ADD FORUM'),
                    const Space(),
                    EditInfoField(
                      field: 'title',
                      maxLines: 2,
                      onChanged: (value, key) {
                        context.read<AddForumCubit>().fieldChanged(key, value);
                      },
                    ),
                    EditInfoField(
                      field: 'content',
                      maxLines: 5,
                      onChanged: (value, key) {
                        context.read<AddForumCubit>().fieldChanged(key, value);
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Checkbox(
                          value: state.isQuestion,
                          onChanged: (value) {
                            context
                                .read<AddForumCubit>()
                                .toggleCheckbox(value!);
                          },
                        ),
                        Text(
                          'is question',
                          style: Theme.of(context).textTheme.headline5,
                        ),
                      ],
                    ),
                    SizedBox(height: 30.h),
                    SubmitButton(
                      text: 'Publish',
                      onPressed: context.read<AddForumCubit>().submit,
                    ),
                  ],
                ),
              );
            }

            return Container();
          },
        ),
      ),
    );
  }
}
