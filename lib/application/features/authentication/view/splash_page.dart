import 'package:app/application/utils/routes/router.gr.dart';
import 'package:app/application/widgets/loading_widget.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../auth_cubit.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => AuthCubit(),
        child: BlocListener<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is Authenticated) {
              AutoRouter.of(context).pushNamed(HomeRoute.name);
            } else if (state is Unauthenticated) {
              AutoRouter.of(context).pushNamed(LoginRoute.name);
            }
          },
          child: const LoadingWidget(),
        ),
      ),
    );
  }
}
