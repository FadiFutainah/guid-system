import 'package:app/application/features/profile/view/widgets/app_text_button.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'app_container.dart';
import 'space.dart';

class SkillContainer extends StatelessWidget {
  final String title;
  final IconData icon;
  final Widget child;
  final bool isExpanded;
  final VoidCallback expandFunction;
  final bool expandable;

  const SkillContainer({
    Key? key,
    required this.title,
    required this.icon,
    required this.child,
    required this.expandFunction,
    required this.isExpanded,
    this.expandable = true,
  }) : super(key: key);

  Widget _getViewButton() {
    if (!expandable) return const Space();
    String text = isExpanded ? 'collapse' : 'view all';
    return AppTextButton(text: text, onPressed: expandFunction);
  }

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      width: 90.w,
      child: Column(
        children: [
          const Space(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: Colors.blueGrey,
              ),
              const SizedBox(width: 10),
              Text(
                title,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline1,
              ),
            ],
          ),
          const Divider(thickness: 1.5),
          child,
          _getViewButton(),
        ],
      ),
    );
  }
}
