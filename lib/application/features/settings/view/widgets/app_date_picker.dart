import 'package:flutter/material.dart';

class AppDatePicker extends StatelessWidget {
  final String text;
  final String value;
  final void Function(String, String) chooseDate;
  const AppDatePicker({
    Key? key,
    required this.text,
    required this.value,
    required this.chooseDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text,
          style: Theme.of(context).textTheme.headline6,
        ),
        IconButton(
          icon: const Icon(
            Icons.date_range,
            color: Colors.green,
          ),
          onPressed: () async {
            DateTime? birthDate = await showDatePicker(
              context: context,
              initialDate: DateTime(2022),
              firstDate: DateTime(1970),
              lastDate: DateTime(2050),
              initialEntryMode: DatePickerEntryMode.input,
            );
            String date = birthDate.toString().split(' ')[0];
            chooseDate(value, date);
          },
        ),
      ],
    );
  }
}
