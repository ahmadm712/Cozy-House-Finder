import 'package:cozy_house_finder/common/style.dart';
import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                'assets/error.png',
                width: 300,
              ),
            ),
            const SizedBox(
              height: 70,
            ),
            Text(
              'Where are you going ? ',
              style: blackTextStyle.copyWith(
                fontSize: 24,
              ),
            ),
            const SizedBox(
              height: 14,
            ),
            Text(
              'Seems like the page that you were\nrequested is alredy gone',
              style: greyTextStyle.copyWith(
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
              width: 210,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    '/home',
                    (route) => false,
                  );
                },
                child: Text(
                  'Back To Home',
                  style: whiteTextStyle.copyWith(
                    fontSize: 18,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
