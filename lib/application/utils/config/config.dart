import 'package:app/application/features/all_forums/view/all_forums_page.dart';
import 'package:app/application/features/profile/view/profile_page.dart';
import 'package:app/application/features/roadmap/view/roadmaps_page.dart';
import 'package:app/data/providers/forum_provider.dart';
import 'package:flutter/widgets.dart';

class Page {
  String title;
  Widget page;
  Page({
    required this.title,
    required this.page,
  });
}

final List<Page> homePages = [
  Page(title: 'PROFILE', page: const ProfilePage()),
  Page(title: 'ROADMAPS', page: const RoadmapsPage(id: 1)),
  Page(
    title: 'DISCUSSIONS',
    page: const AllForumsPage(page: 1, search: '', ordering: Ordering.none),
  ),
];

String domain = 'https://guide-system-backend.herokuapp.com/';
