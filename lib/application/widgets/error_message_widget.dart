import 'package:flutter/widgets.dart';

class ErrorMessageWidget extends StatelessWidget {
  final String text;
  const ErrorMessageWidget({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(text));
  }
}
