import 'package:app/application/features/roadmap/view/roadmaps_page.dart';
import 'package:app/application/widgets/top_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../roadmap_cubit.dart';

class OtherRoadmapPage extends StatelessWidget {
  final int id;
  const OtherRoadmapPage({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RoadmapCubit(id),
      child: Scaffold(
        appBar: const TopBar(text: 'ROADMAP'),
        body: RoadmapsPage(id: id),
      ),
    );
  }
}
