import 'package:flutter/material.dart';

import '../../../core/functions/Responsive.dart';

class homeTitle extends StatelessWidget {
  const homeTitle({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child:
          Text(title, style: TextStyle(fontSize: screenWidth(context) * 0.085)),
    );
  }
}
