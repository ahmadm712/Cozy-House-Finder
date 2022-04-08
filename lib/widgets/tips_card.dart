import 'package:cozy_house_finder/common/style.dart';
import 'package:cozy_house_finder/models/tips.dart';
import 'package:flutter/material.dart';

class TipsCard extends StatelessWidget {
  final TipsModel tips;
  const TipsCard({
    Key? key,
    required this.tips,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          tips.imageUrl,
          width: 80,
        ),
        const SizedBox(
          width: 16,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              tips.title,
              style: blackTextStyle.copyWith(
                fontSize: 18,
              ),
            ),
            const SizedBox(
              width: 4,
            ),
            Text(
              tips.updateAt,
              style: greyTextStyle.copyWith(
                fontSize: 14,
              ),
            ),
          ],
        ),
        const Spacer(),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.arrow_forward_ios_outlined,
            color: greyColor,
            size: 24,
          ),
        )
      ],
    );
  }
}
