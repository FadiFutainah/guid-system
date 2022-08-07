import 'package:app/application/utils/routes/router.gr.dart';
import 'package:app/application/utils/themes/primary_theme.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Application extends StatelessWidget {
  Application({Key? key}) : super(key: key);

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (BuildContext context, Orientation orientation,
          DeviceType deviceType) {
        return MaterialApp.router(
          routerDelegate: _appRouter.delegate(),
          routeInformationParser: _appRouter.defaultRouteParser(),
          debugShowCheckedModeBanner: false,
          theme: primaryTheme,
        );
      },
    );
  }
}
