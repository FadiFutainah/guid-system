import 'package:app/application/features/login/view/widgets/input_field.dart';
import 'package:app/application/features/login/view/widgets/submit_button.dart';
import 'package:app/application/features/profile/view/widgets/devidered_title.dart';
import 'package:app/application/features/profile/view/widgets/space.dart';
import 'package:app/application/widgets/top_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AddForumPage extends StatelessWidget {
  const AddForumPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopBar(text: 'DISCUSSION'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Space(),
            const DivideredTitle(title: 'ADD FORUM'),
            const Space(),
            const InputField(
              label: 'title',
            ),
            const InputField(
              label: 'content',
            ),
            const InputField(
              label: 'add tags',
              hasIcon: true,
              icon: Icons.add,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 175,
                child: SingleChildScrollView(
                  child: Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: const Chip(
                          label: Text('chip'),
                          avatar: Icon(FontAwesomeIcons.xmark),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SubmitButton(onPressed: () {}, text: 'Publish'),
          ],
        ),
      ),
    );
  }
}
