import 'package:app/application/features/home/home_cubit.dart';
import 'package:app/application/utils/config/config.dart';
import 'package:app/application/utils/routes/router.gr.dart';
import 'package:app/application/widgets/loading_widget.dart';
import 'package:app/application/widgets/top_bar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import 'widgets/app_drawer.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  List<Widget> _buildScreens() {
    return homePages.map((e) => e.page).toList();
  }

  PersistentBottomNavBarItem _navBarItem(
      String title, IconData icon, BuildContext context) {
    return PersistentBottomNavBarItem(
      icon: Icon(icon),
      title: (title),
      activeColorPrimary: Theme.of(context).primaryColor,
      inactiveColorPrimary: CupertinoColors.systemGrey,
      textStyle: GoogleFonts.ubuntu(),
    );
  }

  List<PersistentBottomNavBarItem> _navBarsItems(BuildContext context) {
    return [
      _navBarItem('Profile', FontAwesomeIcons.userGraduate, context),
      _navBarItem('Roadmaps', FontAwesomeIcons.book, context),
      _navBarItem('Forums', CupertinoIcons.person_2_fill, context),
    ];
  }

  final PersistentTabController _controller = PersistentTabController(
    initialIndex: 0,
  );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is HomeInitial) {
            return Scaffold(
              appBar: TopBar(
                text: state.title,
                actions: [
                  IconButton(
                    icon:
                        const Icon(FontAwesomeIcons.gear, color: Colors.white),
                    onPressed: () {
                      AutoRouter.of(context).push(const SettingsRoute());
                    },
                  ),
                ],
              ),
              drawer: const AppDrawer(),
              body: PersistentTabView(
                context,
                controller: _controller,
                screens: _buildScreens(),
                items: _navBarsItems(context),
                confineInSafeArea: true,
                resizeToAvoidBottomInset: true,
                stateManagement: true,
                hideNavigationBarWhenKeyboardShows: true,
                decoration: NavBarDecoration(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(10.0),
                  ),
                  boxShadow: [const BoxShadow(color: Colors.grey)],
                  colorBehindNavBar: Theme.of(context).backgroundColor,
                ),
                onItemSelected: (index) {
                  BlocProvider.of<HomeCubit>(context).pageChanged(index);
                },
                popAllScreensOnTapOfSelectedTab: true,
                popActionScreens: PopActionScreensType.all,
                itemAnimationProperties: const ItemAnimationProperties(
                  duration: Duration(milliseconds: 200),
                  curve: Curves.ease,
                ),
                screenTransitionAnimation: const ScreenTransitionAnimation(
                  animateTabTransition: true,
                  curve: Curves.ease,
                  duration: Duration(milliseconds: 200),
                ),
                navBarStyle: NavBarStyle.style12,
              ),
            );
          }
          return const LoadingWidget();
        },
      ),
    );
  }
}
