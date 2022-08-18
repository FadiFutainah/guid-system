import 'package:app/application/features/all_forums/all_forums_cubit.dart';
import 'package:app/data/providers/forum_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        width: 70.w,
        child: BlocBuilder<AllForumsCubit, AllForumsState>(
          builder: (context, state) {
            return CupertinoSearchTextField(
              controller: searchField,
              onSubmitted: (value) {
                context.read<AllForumsCubit>().applyFilters(
                      page: 1,
                      search: value,
                      ordering: Ordering.none,
                    );
              },
            );
          },
        ),
      ),
    );
  }
}
