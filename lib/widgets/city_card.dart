import 'package:cozy_house_finder/common/style.dart';
import 'package:cozy_house_finder/models/city.dart';
import 'package:flutter/material.dart';

class CityCard extends StatelessWidget {
  final CityModel city;
  const CityCard({Key? key, required this.city}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: Container(
        margin: const EdgeInsets.only(right: 16),
        height: 150,
        width: 120,
        color: cityCardColor,
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  city.imageUrl,
                  width: 120,
                  height: 102,
                  fit: BoxFit.cover,
                ),
                if (city.isPopular)
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: 50,
                      height: 30,
                      decoration: BoxDecoration(
                        color: purpleColor,
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(36),
                        ),
                      ),
                      child: Center(
                        child: Image.asset(
                          'assets/icon_star.png',
                          width: 22,
                          height: 22,
                        ),
                      ),
                    ),
                  )
                else
                  Container()
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 11),
              child: Text(
                city.name,
                style: blackTextStyle.copyWith(fontSize: 16),
              ),
            )
          ],
        ),
      ),
    );
  }
}
