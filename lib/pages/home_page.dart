import 'package:cozy_house_finder/common/style.dart';
import 'package:cozy_house_finder/models/city.dart';
import 'package:cozy_house_finder/models/space.dart';
import 'package:cozy_house_finder/models/tips.dart';
import 'package:cozy_house_finder/widgets/bottom_nav_bar_item.dart';
import 'package:cozy_house_finder/widgets/city_card.dart';
import 'package:cozy_house_finder/widgets/space_card.dart';
import 'package:cozy_house_finder/widgets/tips_card.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<CityModel> listCity = [
      CityModel(
        id: '1',
        name: 'Jakarta',
        isPopular: false,
        imageUrl: 'assets/city1.png',
      ),
      CityModel(
        id: '2',
        name: 'Bandung',
        isPopular: true,
        imageUrl: 'assets/city2.png',
      ),
      CityModel(
        id: '3',
        name: 'Surabaya',
        isPopular: false,
        imageUrl: 'assets/city3.png',
      ),
    ];

    List<SpaceModel> listSpace = [
      SpaceModel(
        city: 'Bandung',
        country: 'Germany',
        id: 1,
        imageUrl: 'assets/space1.png',
        name: 'Kuretakeso Hott',
        price: 52,
        rating: 4,
      ),
      SpaceModel(
        city: 'Bogor',
        country: 'Seattle',
        id: 2,
        imageUrl: 'assets/space2.png',
        name: 'Roemah Nenek',
        price: 11,
        rating: 5,
      ),
      SpaceModel(
        city: 'Jakarta',
        country: 'Indonesia',
        id: 3,
        imageUrl: 'assets/space3.png',
        name: 'Darling How',
        price: 20,
        rating: 5,
      ),
    ];

    List<TipsModel> listTips = [
      TipsModel(
        id: 1,
        title: 'City Guidelines',
        imageUrl: 'assets/tips1.png',
        updateAt: '20 Apr',
      ),
      TipsModel(
        id: 2,
        title: 'Jakarta Fairship',
        imageUrl: 'assets/tips2.png',
        updateAt: '1 Dec',
      ),
    ];

    Widget header() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: edge,
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 2),
            padding: EdgeInsets.only(left: edge),
            child: Text(
              'Explore Now',
              style: blackTextStyle.copyWith(fontSize: 24),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 30),
            padding: EdgeInsets.only(left: edge),
            child: Text(
              'Mencari kosan yang cozy',
              style: greyTextStyle.copyWith(fontSize: 16),
            ),
          ),
        ],
      );
    }

    Widget lisPopularCity() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: EdgeInsets.only(left: edge),
            child: Text(
              'Popular Cities',
              style: regularTextStyle.copyWith(fontSize: 16),
            ),
          ),
          Container(
            height: 150,
            margin: const EdgeInsets.only(bottom: 30),
            child: ListView.builder(
              padding: EdgeInsets.only(left: edge),
              scrollDirection: Axis.horizontal,
              itemCount: listCity.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: CityCard(
                    city: listCity[index],
                  ),
                );
              },
            ),
          ),
        ],
      );
    }

    Widget listRecomendSpace() {
      return SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 16),
              padding: EdgeInsets.only(left: edge),
              child: Text(
                'Recommended Space',
                style: regularTextStyle.copyWith(fontSize: 16),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: edge),
              child: Column(
                children: listSpace
                    .map(
                      (space) => Padding(
                        padding: const EdgeInsets.only(bottom: 30),
                        child: SpaceCard(
                          space: space,
                        ),
                      ),
                    )
                    .toList(),
              ),
            )
          ],
        ),
      );
    }

    Widget listTipsCard() {
      return Container(
        padding: EdgeInsets.only(
          left: edge,
          right: edge,
          bottom: 50 + edge,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 16),
              child: Text(
                'Tips & Guidance',
                style: regularTextStyle.copyWith(fontSize: 16),
              ),
            ),
            Column(
              children: listTips
                  .map(
                    (tip) => Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: TipsCard(
                        tips: tip,
                      ),
                    ),
                  )
                  .toList(),
            )
          ],
        ),
      );
    }

    Widget bottomNavbar() {
      return Container(
        height: 65,
        width: MediaQuery.of(context).size.width - (2 * edge),
        margin: EdgeInsets.symmetric(horizontal: edge),
        decoration: BoxDecoration(
          color: cityCardColor,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            BottomNavBarItem(
              imgUrl: 'assets/icon_home.png',
              isActive: true,
            ),
            BottomNavBarItem(
              imgUrl: 'assets/icon_email.png',
              isActive: false,
            ),
            BottomNavBarItem(
              imgUrl: 'assets/icon_card.png',
              isActive: false,
            ),
            BottomNavBarItem(
              imgUrl: 'assets/icon_love.png',
              isActive: false,
            ),
          ],
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: ListView(
          children: [
            header(),
            lisPopularCity(),
            listRecomendSpace(),
            listTipsCard(),
          ],
        ),
      ),
      floatingActionButton: bottomNavbar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
