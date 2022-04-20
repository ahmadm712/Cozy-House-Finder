import 'package:cozy_house_finder/common/style.dart';
import 'package:cozy_house_finder/models/facility.dart';
import 'package:flutter/material.dart';

class FaciltyItem extends StatelessWidget {
  FacilityModel facility;
  FaciltyItem({Key? key, required this.facility}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          facility.imageUrl,
          width: 32,
        ),
        const SizedBox(
          height: 8,
        ),
        Text.rich(
          TextSpan(
            text: facility.total.toString(),
            style: purpleTextStyle.copyWith(
              fontSize: 14,
            ),
            children: [
              TextSpan(
                text: " ${facility.name}",
                style: greyTextStyle.copyWith(
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
