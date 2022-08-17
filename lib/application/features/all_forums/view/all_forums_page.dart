import 'package:app/application/features/profile/view/widgets/devidered_title.dart';
import 'package:app/application/features/profile/view/widgets/space.dart';
import 'package:app/application/utils/routes/router.gr.dart';
import 'package:app/application/widgets/loading_widget.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../all_forums_cubit.dart';
import 'widgets/app_search_bar.dart';
import 'widgets/filter_button.dart';
import 'widgets/forums_list.dart';

class AllForumsPage extends StatelessWidget {
  const AllForumsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AllForumsCubit(),
      child: BlocConsumer<AllForumsCubit, AllForumsState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is Loading) {
            return const LoadingWidget();
          } else if (state is Success) {
            return Scaffold(
              body: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppSearchBar(),
                      const FilterButton(),
                    ],
                  ),
                  const DivideredTitle(title: 'RECENTS'),
                  const Space(),
                  Expanded(child: ForumsList(forums: state.forums)),
                  const Space(),
                ],
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  AutoRouter.of(context).push(const AddForumRoute());
                },
                child: const Icon(Icons.add),
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
