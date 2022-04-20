import 'package:cozy_house_finder/common/style.dart';
import 'package:cozy_house_finder/models/facility.dart';
import 'package:cozy_house_finder/widgets/facility_item.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Image.asset(
              'assets/thumbnail.png',
              width: MediaQuery.of(context).size.width,
              height: 350,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: edge,
                vertical: edge + 6,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset(
                      'assets/btn_back.png',
                      width: 40,
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Image.asset(
                      'assets/btn_wishlist.png',
                      width: 40,
                    ),
                  ),
                ],
              ),
            ),
            ListView(
              children: [
                const SizedBox(
                  height: 328,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                    color: whiteColor,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          top: edge + 6,
                          left: edge,
                          right: edge,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Kuretakeso Hott',
                                  style: blackTextStyle.copyWith(
                                    fontSize: 22,
                                  ),
                                ),
                                const SizedBox(
                                  height: 2,
                                ),
                                Text.rich(
                                  TextSpan(
                                    text: '\$52',
                                    style: purpleTextStyle.copyWith(
                                      fontSize: 16,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: ' / month',
                                        style: greyTextStyle.copyWith(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            starAll()
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 12),
                        padding: EdgeInsets.only(left: edge),
                        child: Text(
                          'Main Facilities',
                          style: regularTextStyle.copyWith(fontSize: 16),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: edge),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FaciltyItem(
                              facility: FacilityModel(
                                name: 'kitchen',
                                imageUrl: 'assets/icon_kitchen.png',
                                total: 2,
                              ),
                            ),
                            FaciltyItem(
                              facility: FacilityModel(
                                name: 'bedroom',
                                imageUrl: 'assets/icon_bedroom.png',
                                total: 3,
                              ),
                            ),
                            FaciltyItem(
                              facility: FacilityModel(
                                name: 'big lemari',
                                imageUrl: 'assets/icon_cupboard.png',
                                total: 3,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Row starAll() {
    return Row(
      children: [
        Image.asset(
          'assets/icon_star.png',
          width: 20,
        ),
        const SizedBox(
          width: 2,
        ),
        Image.asset(
          'assets/icon_star.png',
          width: 20,
        ),
        const SizedBox(
          width: 2,
        ),
        Image.asset(
          'assets/icon_star.png',
          width: 20,
        ),
        const SizedBox(
          width: 2,
        ),
        Image.asset(
          'assets/icon_star.png',
          width: 20,
        ),
        const SizedBox(
          width: 2,
        ),
        Image.asset(
          'assets/icon_star.png',
          width: 20,
          color: greyColor,
        ),
      ],
    );
  }
}
