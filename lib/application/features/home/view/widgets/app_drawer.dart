import 'package:app/application/features/home/home_cubit.dart';
import 'package:app/application/features/profile/view/widgets/profile_photo.dart';
import 'package:app/application/features/profile/view/widgets/space.dart';
import 'package:app/application/utils/routes/router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is LogoutSuccess) {
          AutoRouter.of(context)
              .pushAndPopUntil(const LoginRoute(), predicate: (route) => false);
        }
      },
      child: Drawer(
        child: Column(
          children: [
            SizedBox(
              height: 40.h,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  ProfilePhoto(photo: 'photo', iconSize: 84, radius: 60),
                  // const SizedBox(height: 30),
                  // Text(
                  //   'data',
                  //   style: Theme.of(context).textTheme.headline1,
                  // )
                ],
              ),
            ),
            const Divider(thickness: 2),
            AppDrawerItem(
              text: 'add project',
              icon: Icons.add_circle_outline_sharp,
              onTap: () {
                AutoRouter.of(context).push(const AddProjectRoute());
              },
            ),
            const Space(),
            const Divider(),
            const Space(),
            AppDrawerItem(
              text: 'logout',
              icon: Icons.logout,
              onTap: BlocProvider.of<HomeCubit>(context).logout,
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}

class AppDrawerItem extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onTap;
  const AppDrawerItem({
    Key? key,
    required this.text,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline2,
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: Icon(icon, color: Theme.of(context).primaryColor),
            ),
          ),
        ],
      ),
    );
  }
}
