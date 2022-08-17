import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FilterButton extends StatelessWidget {
  const FilterButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
  }
}
