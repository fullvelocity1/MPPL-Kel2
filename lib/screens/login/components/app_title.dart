import 'package:flutter/material.dart';
import 'package:krl_info/constants.dart';

class AppTitle extends StatelessWidget {
  const AppTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      const Image(image: AssetImage('assets/images/carbon_train-heart.png')),
      Padding(
        padding: const EdgeInsets.only(left: 7.5),
        child: Row(
          children: const <Widget>[
            Text(
              'KRL',
              style: TextStyle(
                  fontFamily: 'Inter',
                  color: primColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 20),
            ),
            Text(
              '-Info',
              style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                  fontSize: 20),
            ),
          ],
        ),
      )
    ]);
  }
}
