import 'dart:math';

import 'package:app/application/widgets/error_message_widget.dart';
import 'package:app/domain/models/mark_model.dart';
import 'package:flutter/material.dart';

class MarkWidget extends StatelessWidget {
  final List<MarkModel> marks;
  final bool isExpanded;
  const MarkWidget({
    Key? key,
    required this.marks,
    required this.isExpanded,
  }) : super(key: key);

  Widget _getMarkWidget(BuildContext context, int index) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Text(
                marks[index].name,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                '${marks[index].mark}',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.subtitle2,
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                marks[index].date,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.subtitle2,
              ),
            ),
          ],
        ),
        const Divider(),
      ],
    );
  }

  List<Widget> _getTheFirstWidgets(BuildContext context) {
    List<Widget> markWidgets = [];
    for (int i = 0; i < min(marks.length, 2); ++i) {
      markWidgets.add(_getMarkWidget(context, i));
    }
    return markWidgets;
  }

  @override
  Widget build(BuildContext context) {
    if (marks.isEmpty) {
      return const ErrorMessageWidget(text: 'no marks added');
    }

    if (isExpanded) {
      double height = (35 * marks.length).toDouble();
      return SizedBox(
        height: min(200, height),
        child: ListView.builder(
          itemCount: marks.length,
          itemBuilder: (BuildContext context, int index) {
            return _getMarkWidget(context, index);
          },
        ),
      );
    }

    return Column(children: _getTheFirstWidgets(context));
  }
}
