import 'package:app/application/features/all_forums/all_forums_cubit.dart';
import 'package:app/data/providers/forum_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FilterButton extends StatelessWidget {
  const FilterButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          AllForumsCubit(ordering: Ordering.none, page: 1, search: ''),
      child: BlocBuilder<AllForumsCubit, AllForumsState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: CircleAvatar(
              backgroundColor: Theme.of(context).primaryColor,
              child: IconButton(
                onPressed: () {},
                icon: Icon(FontAwesomeIcons.filter, color: Colors.grey[50]),
              ),
            ),
          );
        },
      ),
    );
  }
}
        // showDialog(
        //           context: context,
        //           builder: (context) => Dialog(
        //             elevation: 2,
        //             child: SizedBox(
        //               height: 500,
        //               width: 400,
        //               child: SingleChildScrollView(
        //                 child: Column(
        //                   children: [
        //                     Text(''),
        //                   ],
        //                 ),
        //               ),
        //             ),
        //           ),
        //         );


// (Wrap(
//         alignment: WrapAlignment.center,
//         runSpacing: 5,
//         spacing: 5,
//         children: tags!.map((e) => Chip(label: Text(e))).toList(),
//       )