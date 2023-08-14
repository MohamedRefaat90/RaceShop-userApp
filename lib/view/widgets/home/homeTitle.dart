import 'package:flutter/material.dart';

class homeTitle extends StatelessWidget {
  const homeTitle({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15, bottom: 10),
      child: Text(title, style: Theme.of(context).textTheme.displayLarge),
    );
  }
}
