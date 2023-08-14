import 'package:flutter/material.dart';

import '../../../core/constants/AppColors.dart';

class productsCard extends StatelessWidget {
  productsCard({
    super.key,
    required this.productCardColor,
  });
  final Color productCardColor;
  List<String> productsImage = [
    "assets/images/products/1.png",
    "assets/images/products/2.png",
    "assets/images/products/3.png",
    "assets/images/products/4.png",
    "assets/images/products/5.png",
    "assets/images/products/6.png",
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: ListView.separated(
        itemCount: productsImage.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Container(
          width: 250,
          height: 130,
          decoration: BoxDecoration(
              color: productCardColor, borderRadius: BorderRadius.circular(15)),
          child: Stack(
            // alignment: Alignment.bottomRight,
            children: [
              Positioned(
                right: 0,
                top: 0,
                bottom: 0,
                child: Image.asset(
                  productsImage[index],
                  alignment: Alignment.centerRight,
                  width: 130,
                  fit: BoxFit.fitWidth,
                ),
              ),
              Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(15)),
              ),
              const Positioned(
                  left: 0,
                  top: 0,
                  bottom: 0,
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      '5000 LE',
                      style: TextStyle(
                          decoration: TextDecoration.lineThrough,
                          decorationThickness: 2,
                          decorationStyle: TextDecorationStyle.wavy,
                          color: AppColors.white,
                          fontSize: 20),
                    ),
                  )),
              const Positioned(
                  left: 20,
                  top: 20,
                  bottom: 0,
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      '4500 LE',
                      style: TextStyle(
                          color: AppColors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 19),
                    ),
                  )),
              const Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text('Product Name',
                      style: TextStyle(
                          color: AppColors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18)),
                ),
              ),
            ],
          ),
        ),
        separatorBuilder: (context, index) => const SizedBox(width: 10),
      ),
    );
  }
}
