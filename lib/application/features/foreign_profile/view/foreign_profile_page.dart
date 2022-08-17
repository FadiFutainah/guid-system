import 'package:app/application/features/home/home_cubit.dart';
import 'package:app/application/features/profile/view/profile_page.dart';
import 'package:app/application/widgets/top_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForeignProfilePage extends StatelessWidget {
  final int id;

  const ForeignProfilePage({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: Scaffold(
        appBar: const TopBar(text: 'PROFILE'),
        body: ProfilePage(id: id),
      ),
    );
  }
}
