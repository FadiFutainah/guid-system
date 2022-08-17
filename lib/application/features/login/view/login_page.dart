import 'package:app/application/features/login/login_cubit.dart';
import 'package:app/application/features/login/view/widgets/submit_button.dart';
import 'package:app/application/utils/config/app_functions.dart';
import 'package:app/application/utils/routes/router.gr.dart';
import 'package:app/application/widgets/top_bar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import 'widgets/input_field.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  bool _usernameBuildWhen(LoginState previous, LoginState current) {
    return current.username != previous.username;
  }

  bool _passwordBuildWhen(LoginState previous, LoginState current) {
    return current.password != previous.password ||
        current.isVisible != previous.isVisible;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is Failed) {
            AppFunctions.showSnackBar(
              context,
              state.message,
              Colors.red,
            );
          } else if (state is Success) {
            AutoRouter.of(context).pushAndPopUntil(
              HomeRoute(),
              predicate: (route) => false,
            );
            AppFunctions.showSnackBar(
              context,
              'Logged in Successfully',
              Colors.green,
            );
          } else if (state is Loading) {
            AppFunctions.showSnackBar(
              context,
              'waiting...',
              Colors.black54,
              seconds: 30,
            );
          }
        },
        child: Scaffold(
          backgroundColor: Colors.grey[100],
          appBar: const TopBar(text: 'WELCOME'),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 10.h),
                Container(
                  height: 60.h,
                  width: 90.w,
                  margin: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 0.5),
                        blurRadius: 2.0,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      Text(
                        'enter your credentials to continue',
                        style: Theme.of(context).textTheme.headline1,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 10.h),
                      BlocBuilder<LoginCubit, LoginState>(
                        buildWhen: _usernameBuildWhen,
                        builder: (context, state) {
                          return InputField(
                            label: 'username',
                            onChanged:
                                context.read<LoginCubit>().usernameChanged,
                            error:
                                context.read<LoginCubit>().getUsernameError(),
                          );
                        },
                      ),
                      BlocBuilder<LoginCubit, LoginState>(
                        buildWhen: _passwordBuildWhen,
                        builder: (context, state) {
                          return InputField(
                            label: 'password',
                            onChanged:
                                context.read<LoginCubit>().passwordChanged,
                            error:
                                context.read<LoginCubit>().getPasswordError(),
                            onIconPressed:
                                context.read<LoginCubit>().togglePassword,
                            isPassword: true,
                            hasIcon: true,
                            isPasswordVisible:
                                context.read<LoginCubit>().state.isVisible,
                            icon: context.read<LoginCubit>().getPasswordIcon(),
                          );
                        },
                      ),
                      const SizedBox(height: 40),
                      BlocBuilder<LoginCubit, LoginState>(
                        builder: (context, state) {
                          return SubmitButton(
                            onPressed: context.read<LoginCubit>().submit,
                            text: 'login',
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
