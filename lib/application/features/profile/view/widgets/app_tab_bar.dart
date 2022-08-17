import 'package:flutter/material.dart';

import 'profile_tab.dart';

class AppTabBar extends StatelessWidget {
  const AppTabBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        bottom: TabBar(
          indicatorColor: Theme.of(context).primaryColor,
          indicatorWeight: 2.5,
          unselectedLabelColor: Colors.grey,
          tabs: const [
            ProfileTab(title: 'PROJECTS'),
            ProfileTab(title: 'SKILLS'),
            ProfileTab(title: 'ABOUT'),
          ],
        ),
      ),
    );
  }
}
