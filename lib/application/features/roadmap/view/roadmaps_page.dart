import 'package:app/application/features/profile/view/widgets/app_text_button.dart';
import 'package:app/application/features/profile/view/widgets/skill_container.dart';
import 'package:app/application/features/roadmap/roadmap_cubit.dart';
import 'package:app/application/utils/routes/router.gr.dart';
import 'package:app/application/widgets/error_message_widget.dart';
import 'package:app/application/widgets/loading_widget.dart';
import 'package:app/data/entities/page_dto.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

class RoadmapsPage extends StatelessWidget {
  final int id;

  const RoadmapsPage({Key? key, required this.id}) : super(key: key);

  Widget _buildDataTable(PageDto page) {
    List<Widget> rows = [];

    List<Widget> children = [];
    for (int i = 0; i < page.features.length + 1; ++i) {
      if (i == 0) {
        children.add(Expanded(
            flex: 1,
            child: Text(
              '',
            )));
      } else {
        children.add(
          Expanded(
            flex: 1,
            child: Text(
              page.features[i - 1].name,
              textAlign: TextAlign.center,
            ),
          ),
        );
      }
    }
    rows.add(
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: children,
      ),
    );

    for (int i = 0; i < page.referenceChildren.length; ++i) {
      List<Widget> children = [];
      rows.add(const Divider(thickness: 1.5));
      for (int j = 0; j < page.features.length + 1; ++j) {
        if (j == 0) {
          children.add(Expanded(
              flex: 1,
              child: Text(
                page.referenceChildren[i].child.title,
              )));
        } else {
          children.add(Expanded(
              flex: 1,
              child: Text(
                page.referenceChildren[i].features[j - 1].value,
                textAlign: TextAlign.center,
              )));
        }
      }
      rows.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: children,
        ),
      );
    }

    Column table = Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: rows,
    );

    return table;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RoadmapCubit(id),
      child: BlocBuilder<RoadmapCubit, RoadmapState>(
        builder: (context, state) {
          if (state is Loading) {
            return const LoadingWidget();
          }
          if (state is Success) {
            return Stack(
              children: [
                Container(
                  height: 83.h,
                  child: CachedNetworkImage(
                    fit: BoxFit.fill,
                    imageUrl: state.page.background,
                    placeholder: (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                  ),
                ),
                Center(
                  child: Column(
                    children: [
                      SkillContainer(
                        title: state.page.title,
                        icon: Icons.school,
                        expandFunction: () {},
                        expandable: false,
                        isExpanded: false,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Advice & Tools :',
                                style: Theme.of(context).textTheme.headline5,
                              ),
                              Text(state.page.adviceAndTools),
                              const Divider(),
                              Text(
                                'Importance & Advantages :',
                                style: Theme.of(context).textTheme.headline5,
                              ),
                              Text(
                                state.page.importanceAndAdvantages,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              (state.page.type == 'O')
                                  ? const SizedBox()
                                  : SkillContainer(
                                      title: 'Dependincies',
                                      icon: FontAwesomeIcons.circleExclamation,
                                      expandFunction: () {},
                                      expandable: false,
                                      isExpanded: false,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: SizedBox(
                                          height: 80,
                                          child: (state.page.dependencyChildren
                                                  .isNotEmpty)
                                              ? ListView.builder(
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  itemCount: state
                                                      .page
                                                      .dependencyChildren
                                                      .length,
                                                  itemBuilder:
                                                      (context, index) {
                                                    return Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: GestureDetector(
                                                        onTap: () {
                                                          AutoRouter.of(context)
                                                              .push(
                                                            OtherRoadmapRoute(
                                                              id: state
                                                                  .page
                                                                  .dependencyChildren[
                                                                      index]
                                                                  .child
                                                                  .id,
                                                            ),
                                                          );
                                                        },
                                                        child: Column(
                                                          children: [
                                                            Container(
                                                              clipBehavior:
                                                                  Clip.hardEdge,
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            15),
                                                              ),
                                                              child:
                                                                  CachedNetworkImage(
                                                                imageUrl: state
                                                                    .page
                                                                    .dependencyChildren[
                                                                        index]
                                                                    .child
                                                                    .icon,
                                                                placeholder: (context,
                                                                        url) =>
                                                                    const CircularProgressIndicator(),
                                                                errorWidget: (context,
                                                                        url,
                                                                        error) =>
                                                                    CircleAvatar(
                                                                  backgroundColor:
                                                                      Colors.grey[
                                                                          400],
                                                                  child:
                                                                      const Icon(
                                                                    FontAwesomeIcons
                                                                        .book,
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Text(state
                                                                .page
                                                                .dependencyChildren[
                                                                    index]
                                                                .child
                                                                .title),
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                )
                                              : const ErrorMessageWidget(
                                                  text: '- no dependencies -'),
                                        ),
                                      ),
                                    ),
                              (state.page.type != 'L')
                                  ? const SizedBox()
                                  : SkillContainer(
                                      title: 'References',
                                      icon: FontAwesomeIcons.addressBook,
                                      expandFunction: () {},
                                      expandable: false,
                                      isExpanded: false,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: SizedBox(
                                          height: 100.0 *
                                              state.page.referenceChildren
                                                  .length,
                                          child: (state.page.referenceChildren
                                                  .isNotEmpty)
                                              ? ListView.builder(
                                                  physics:
                                                      NeverScrollableScrollPhysics(),
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  itemCount: state.page
                                                      .referenceChildren.length,
                                                  itemBuilder:
                                                      (context, index) {
                                                    return Column(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(1.0),
                                                          child:
                                                              GestureDetector(
                                                            onTap: () {
                                                              AutoRouter.of(
                                                                      context)
                                                                  .push(
                                                                OtherRoadmapRoute(
                                                                  id: state
                                                                      .page
                                                                      .referenceChildren[
                                                                          index]
                                                                      .child
                                                                      .id,
                                                                ),
                                                              );
                                                            },
                                                            child: Row(
                                                              children: [
                                                                Expanded(
                                                                  flex: 1,
                                                                  child:
                                                                      Container(
                                                                    clipBehavior:
                                                                        Clip.hardEdge,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              15),
                                                                    ),
                                                                    child:
                                                                        SizedBox(
                                                                      height:
                                                                          80,
                                                                      child:
                                                                          CachedNetworkImage(
                                                                        fit: BoxFit
                                                                            .cover,
                                                                        imageUrl: state
                                                                            .page
                                                                            .referenceChildren[index]
                                                                            .child
                                                                            .icon,
                                                                        placeholder:
                                                                            (context, url) =>
                                                                                const Center(child: CircularProgressIndicator()),
                                                                        errorWidget: (context,
                                                                                url,
                                                                                error) =>
                                                                            CircleAvatar(
                                                                          backgroundColor:
                                                                              Colors.grey[400],
                                                                          child:
                                                                              const Icon(
                                                                            FontAwesomeIcons.book,
                                                                            color:
                                                                                Colors.white,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  flex: 2,
                                                                  child: Text(
                                                                    state
                                                                        .page
                                                                        .referenceChildren[
                                                                            index]
                                                                        .child
                                                                        .title,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style: Theme.of(
                                                                            context)
                                                                        .textTheme
                                                                        .headline6,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        const Divider(),
                                                      ],
                                                    );
                                                  },
                                                )
                                              : const ErrorMessageWidget(
                                                  text: '- no dependencies -'),
                                        ),
                                      ),
                                    ),
                              (state.page.type != 'L')
                                  ? const SizedBox()
                                  : SkillContainer(
                                      title: 'Content',
                                      icon: Icons.school,
                                      expandFunction: () {},
                                      expandable: false,
                                      isExpanded: false,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: 30.0 *
                                                  state.page.contents.length,
                                              child: ListView.builder(
                                                itemCount:
                                                    state.page.contents.length,
                                                itemBuilder: ((context, index) {
                                                  return Column(
                                                    children: [
                                                      ListTile(
                                                        title: Text(
                                                          state
                                                              .page
                                                              .contents[index]
                                                              .title,
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                        subtitle: Text(
                                                          state
                                                              .page
                                                              .contents[index]
                                                              .content,
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                      ),
                                                      AppTextButton(
                                                        text: state
                                                            .page
                                                            .contents[index]
                                                            .link,
                                                        onPressed: () {
                                                          launchUrl(
                                                              Uri.parse(state
                                                                  .page
                                                                  .contents[
                                                                      index]
                                                                  .link),
                                                              mode: LaunchMode
                                                                  .externalApplication);
                                                        },
                                                      ),
                                                    ],
                                                  );
                                                }),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                              (state.page.type != 'O')
                                  ? const SizedBox()
                                  : SkillContainer(
                                      title: 'Comparison Table',
                                      icon: Icons.ads_click_outlined,
                                      expandFunction: () {},
                                      expandable: false,
                                      isExpanded: false,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Container(
                                            width: state.page.features.length *
                                                180,
                                            child: _buildDataTable(state.page),
                                          ),
                                        ),
                                      ),
                                    ),
                              const SizedBox(height: 25),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }
          return const ErrorMessageWidget(text: 'error');
        },
      ),
    );
  }
}
