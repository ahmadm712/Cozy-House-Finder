import 'package:cozy_house_finder/common/style.dart';
import 'package:cozy_house_finder/models/facility.dart';
import 'package:cozy_house_finder/models/space.dart';
import 'package:cozy_house_finder/widgets/facility_item.dart';
import 'package:cozy_house_finder/widgets/rating_item.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatelessWidget {
  SpaceModel space;
  DetailPage({Key? key, required this.space}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    launcUrl(String url) async {
      if (await canLaunch(url)) {
        launch(url);
      } else {
        Navigator.pushReplacementNamed(context, '/err');
      }
    }

    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Image.network(
              space.imageUrl,
              width: MediaQuery.of(context).size.width,
              height: 350,
              fit: BoxFit.cover,
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
                                  space.name,
                                  style: blackTextStyle.copyWith(
                                    fontSize: 22,
                                  ),
                                ),
                                const SizedBox(
                                  height: 2,
                                ),
                                Text.rich(
                                  TextSpan(
                                    text: '\$${space.price}',
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
                      listFacility(),
                      const SizedBox(
                        height: 30,
                      ),
                      // * Note : Photo
                      Container(
                        margin: const EdgeInsets.only(bottom: 12),
                        padding: EdgeInsets.only(left: edge),
                        child: Text(
                          'Photos ',
                          style: regularTextStyle.copyWith(fontSize: 16),
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      listPhoto(),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 12),
                        padding: EdgeInsets.only(left: edge),
                        child: Text(
                          'Location ',
                          style: regularTextStyle.copyWith(fontSize: 16),
                        ),
                      ),
                      // * Note : Location
                      const SizedBox(
                        height: 6,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: edge),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${space.address}\n${space.city}',
                              style: greyTextStyle,
                            ),
                            InkWell(
                              onTap: () {
                                launch(
                                  space.mapUrl,
                                );
                              },
                              child: Image.asset(
                                'assets/btn_map.png',
                                width: 40,
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: edge),
                        height: 50,
                        width: MediaQuery.of(context).size.width - (2 * edge),
                        child: ElevatedButton(
                          onPressed: () {
                            launch('tel:${space.phone}');
                          },
                          child: Text(
                            'Book Now',
                            style: whiteTextStyle.copyWith(
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                ),
              ],
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
          ],
        ),
      ),
    );
  }

  SizedBox listPhoto() {
    return SizedBox(
      height: 88,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: space.photos
            .map(
              (photo) => Container(
                margin: EdgeInsets.only(left: edge),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    photo,
                    width: 110,
                    height: 88,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }

  Padding listFacility() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: edge),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FaciltyItem(
            facility: FacilityModel(
              name: 'kitchen',
              imageUrl: 'assets/icon_kitchen.png',
              total: space.numberOfKitchens,
            ),
          ),
          FaciltyItem(
            facility: FacilityModel(
              name: 'bedroom',
              imageUrl: 'assets/icon_bedroom.png',
              total: space.numberOfBedrooms,
            ),
          ),
          FaciltyItem(
            facility: FacilityModel(
              name: 'big lemari',
              imageUrl: 'assets/icon_cupboard.png',
              total: space.numberOfCupboards,
            ),
          ),
        ],
      ),
    );
  }

  Row starAll() {
    return Row(
      children: [1, 2, 3, 4, 5]
          .map(
            (index) => Container(
              margin: const EdgeInsets.only(left: 2),
              child: RatingItem(
                index: index,
                rating: space.rating,
              ),
            ),
          )
          .toList(),
    );
  }
}
