import 'package:app/domain/models/profile_feature_model.dart';
import 'package:flutter/material.dart';

import 'app_text_button.dart';
import 'date_range.dart';
import 'space.dart';

class ProfileToolFeatureWidget extends StatelessWidget {
  final ProfileFeatureModel feature;
  final bool inProject;
  const ProfileToolFeatureWidget({
    Key? key,
    required this.inProject,
    required this.feature,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          feature.title,
          style: Theme.of(context).textTheme.headline5,
        ),
        const Space(),
        Text(
          feature.description,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline6,
        ),
        // TODO implement go to project
        (inProject)
            ? const Space()
            : AppTextButton(
                text: 'go to project',
                onPressed: () {},
              ),
        DateRange(startDate: feature.startDate, endDate: feature.endDate),
        const Divider(),
      ],
    );
  }
}
