import 'package:flutter/material.dart';

import '../../../core/constants/AppColors.dart';

class offersBanar extends StatelessWidget {
  const offersBanar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150,
      clipBehavior: Clip.antiAlias,
      padding: const EdgeInsetsDirectional.only(start: 15),
      decoration: const BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Stack(children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Summer Suprise',
              style: Theme.of(context)
                  .textTheme
                  .displayLarge!
                  .copyWith(fontSize: 25, color: AppColors.white),
            ),
            Text('20% Cashback',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontSize: 18, color: AppColors.white)),
          ],
        ),
        Positioned(
          right: -50,
          top: -10,
          child: Container(
            width: 200,
            height: 200,
            decoration: const BoxDecoration(
                color: AppColors.secondryColor,
                borderRadius: BorderRadius.all(Radius.circular(5000))),
          ),
        )
      ]),
    );
  }
}
