import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TopBar extends StatelessWidget implements PreferredSizeWidget {
  final String text;
  final List<Widget>? actions;
  const TopBar({Key? key, required this.text, this.actions}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(56);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: null,
      centerTitle: true,
      title: Text(
        text,
        style: GoogleFonts.ubuntu(
          fontWeight: FontWeight.normal,
          fontSize: 22,
        ),
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(8),
        ),
      ),
      elevation: 0,
      actions: actions,
    );
  }
}
