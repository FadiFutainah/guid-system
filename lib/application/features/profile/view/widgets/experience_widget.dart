import 'package:app/application/widgets/error_message_widget.dart';
import 'package:app/domain/models/experience_model.dart';
import 'package:flutter/material.dart';

import 'date_range.dart';
import 'space.dart';

class ExperienceWidget extends StatelessWidget {
  final List<ExperienceModel> experiences;
  final bool isExpanded;
  const ExperienceWidget({
    Key? key,
    required this.experiences,
    required this.isExpanded,
  }) : super(key: key);

  Widget _getExperienceWidget(BuildContext context, int index, int maxLines) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            experiences[index].isCertified
                ? const Icon(Icons.verified, color: Colors.blue)
                : const SizedBox(),
            Text(experiences[index].name,
                style: Theme.of(context).textTheme.headline5),
          ],
        ),
        const Space(),
        Text(experiences[index].type,
            style: Theme.of(context).textTheme.headline6),
        const Space(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            experiences[index].description,
            textAlign: TextAlign.center,
            maxLines: maxLines,
            overflow: TextOverflow.fade,
            style: Theme.of(context).textTheme.subtitle2,
          ),
        ),
        const Space(),
        DateRange(
          startDate: experiences[index].startDate,
          endDate: experiences[index].endDate,
        ),
        const Divider(thickness: 1),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    if (experiences.isEmpty) {
      return const ErrorMessageWidget(text: 'no experiences added');
    }
    if (isExpanded) {
      return SizedBox(
        height: 300,
        child: ListView.builder(
          itemCount: experiences.length,
          itemBuilder: (BuildContext context, int index) {
            return _getExperienceWidget(context, index, 10);
          },
        ),
      );
    } else {
      return _getExperienceWidget(context, 0, 3);
    }
  }
}
