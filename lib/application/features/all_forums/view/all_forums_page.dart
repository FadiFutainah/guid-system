import 'package:app/application/features/profile/view/widgets/devidered_title.dart';
import 'package:app/application/features/profile/view/widgets/space.dart';
import 'package:app/application/utils/routes/router.gr.dart';
import 'package:app/application/widgets/loading_widget.dart';
import 'package:app/data/providers/forum_provider.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../all_forums_cubit.dart';
import 'widgets/app_search_bar.dart';
import 'widgets/filter_button.dart';
import 'widgets/forums_list.dart';

class AllForumsPage extends StatelessWidget {
  final int page;
  final String search;
  final Ordering ordering;
  final bool? isQuestion;
  final bool? isClosed;
  final bool? isMine;
  final int? tagID;

  const AllForumsPage(
      {required this.page,
      required this.search,
      required this.ordering,
      this.isQuestion,
      this.isClosed,
      this.isMine,
      this.tagID,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AllForumsCubit(
        ordering: ordering,
        page: page,
        search: search,
        isClosed: isClosed,
        isMine: isMine,
        isQuestion: isQuestion,
        tagID: tagID,
      ),
      child: BlocConsumer<AllForumsCubit, AllForumsState>(
        listener: (context, state) {},
        buildWhen: (previous, current) {
          if (current is Searching || current is SearchCompleted) {
            return false;
          }
          return true;
        },
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
                  GestureDetector(
                    onTap: () {
                      context.read<AllForumsCubit>().applyFilters(
                          page: 1, search: '', ordering: Ordering.none);
                    },
                    child: const DivideredTitle(title: 'ALL FORUMS'),
                  ),
                  const Space(),
                  Expanded(child: ForumsList(forums: state.forums)),
                  const Space(),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //   children: [
                  //     AppTextButton(
                  //       text: '< previous',
                  //       textStyle: Theme.of(context).textTheme.headline5,
                  //       onPressed: () {},
                  //     ),
                  //     AppTextButton(
                  //       text: 'next >',
                  //       textStyle: Theme.of(context).textTheme.headline5,
                  //       onPressed: () {},
                  //     ),
                  //   ],
                  // ),
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
