import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final List<Widget>? actions;
  final Widget? leading;
  const CustomAppBar({super.key, required this.title, this.actions, this.leading});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: leading,
      automaticallyImplyLeading: false,
      actions: actions,
      title: Text(title),
      backgroundColor: Theme.of(context).colorScheme.primary,
    );
  }
}
