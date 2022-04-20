import 'package:cozy_house_finder/common/style.dart';
import 'package:cozy_house_finder/models/space.dart';
import 'package:cozy_house_finder/pages/detail_page.dart';
import 'package:cozy_house_finder/pages/error_page.dart';
import 'package:cozy_house_finder/pages/home_page.dart';
import 'package:cozy_house_finder/pages/splash_screen.dart';
import 'package:cozy_house_finder/provider/space_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SpaceProvider(),
        )
      ],
      child: MaterialApp(
        title: 'Cozy House Finder',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              textStyle: whiteTextStyle,
              primary: purpleColor,
            ),
          ),
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const SplashScreen(),
          '/home': (context) => const HomePage(),
          '/detail-page': (context) => DetailPage(
              space: ModalRoute.of(context)!.settings.arguments as SpaceModel),
          '/err': (context) => const ErrorPage(),
        },
      ),
    );
  }
}
