import 'package:app/application/widgets/error_message_widget.dart';
import 'package:app/domain/models/about_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'contact_field.dart';
import 'devidered_title.dart';
import 'info_field.dart';
import 'space.dart';

class AboutTab extends StatelessWidget {
  final AboutModel about;

  const AboutTab({
    Key? key,
    required this.about,
  }) : super(key: key);

  Widget _buildContacts() {
    if (about.contacts.isEmpty) {
      return const ErrorMessageWidget(text: 'no contacts added');
    }
    return ListView.builder(
      itemCount: about.contacts.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ContactField(
            type: about.contacts[index].title,
            link: about.contacts[index].value,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Space(),
        InfoField(
          icon: CupertinoIcons.person,
          text: 'Gender',
          value: about.getGender(),
        ),
        const Space(),
        InfoField(
          icon: Icons.hourglass_empty,
          text: 'Age',
          value: '${about.calculateAge()}',
        ),
        const Space(),
        InfoField(
          icon: Icons.cake,
          text: 'Birth date',
          value: about.birthDate,
        ),
        const Space(),
        InfoField(
          icon: FontAwesomeIcons.graduationCap,
          text: 'Graduate date',
          value: about.getGraduateDate(),
        ),
        const Space(),
        InfoField(
          icon: Icons.email,
          text: 'Email',
          value: about.email,
        ),
        const Space(),
        InfoField(
          icon: FontAwesomeIcons.addressCard,
          text: 'Address',
          value: about.address,
        ),
        const SizedBox(height: 20),
        const DivideredTitle(title: 'CONTACT INFO'),
        Expanded(
          child: _buildContacts(),
        ),
      ],
    );
  }
}
