import 'package:app/application/features/all_forums/view/all_forums_page.dart';
import 'package:app/application/features/profile/view/profile_page.dart';
import 'package:app/application/features/roadmap/view/roadmaps_page.dart';
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
  Page(title: 'ROADMAPS', page: const RoadmapsPage()),
  Page(title: 'DISCUSSIONS', page: const AllForumsPage()),
];
