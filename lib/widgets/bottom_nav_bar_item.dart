import 'package:cozy_house_finder/common/style.dart';
import 'package:flutter/material.dart';

class BottomNavBarItem extends StatelessWidget {
  final String imgUrl;
  final bool isActive;
  const BottomNavBarItem({
    Key? key,
    required this.imgUrl,
    required this.isActive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Image.asset(
          imgUrl,
          width: 26,
        ),
        const Spacer(),
        if (isActive)
          Container(
            width: 30,
            height: 4,
            decoration: BoxDecoration(
              color: purpleColor,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(
                  1000,
                ),
              ),
            ),
          )
        else
          Container()
      ],
    );
  }
}
