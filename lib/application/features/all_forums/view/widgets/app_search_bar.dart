import 'package:flutter/cupertino.dart';
import 'package:sizer/sizer.dart';

class AppSearchBar extends StatelessWidget {
  AppSearchBar({
    Key? key,
  }) : super(key: key);

  final TextEditingController searchField = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
        width: 80.w,
        child: CupertinoSearchTextField(
          controller: searchField,
          onSubmitted: (value) {},
        ),
      ),
    );
  }
}
