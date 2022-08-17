import 'package:flutter/material.dart';

class DateRange extends StatelessWidget {
  final String startDate;
  final String endDate;
  const DateRange({
    Key? key,
    required this.startDate,
    required this.endDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Icon(Icons.date_range, color: Theme.of(context).primaryColor),
        Text('Start', style: Theme.of(context).textTheme.subtitle2),
        Text(startDate, style: Theme.of(context).textTheme.headline6),
        Icon(Icons.arrow_forward_ios_rounded,
            color: Theme.of(context).primaryColor),
        Text('End', style: Theme.of(context).textTheme.subtitle2),
        Text(endDate, style: Theme.of(context).textTheme.headline6),
      ],
    );
  }
}
