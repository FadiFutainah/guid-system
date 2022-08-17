import 'package:app/application/features/profile/view/widgets/space.dart';
import 'package:app/domain/models/project_feature_model.dart';
import 'package:flutter/material.dart';

import 'app_text_button.dart';
import 'date_range.dart';

class ProjectFeatureWidget extends StatelessWidget {
  final ProjectFeatureModel feature;
  const ProjectFeatureWidget({
    Key? key,
    required this.feature,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          feature.name,
          style: Theme.of(context).textTheme.headline2,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            feature.description,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        DateRange(startDate: feature.startDate, endDate: feature.endDate),
        AppTextButton(
          text: 'view tools used in this feature',
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => Dialog(
                elevation: 2,
                child: SizedBox(
                  height: 200,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Tools',
                        style: Theme.of(context).textTheme.headline1,
                      ),
                      const Divider(),
                      Expanded(
                        child: ListView.builder(
                          itemCount: feature.tools.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Column(
                              children: [
                                Text(
                                  feature.tools[index].title,
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context).textTheme.headline5,
                                ),
                                const Space(),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
        const Divider(),
      ],
    );
  }
}
