import 'package:flutter/material.dart';
import 'package:krl_info/constants.dart';
import 'package:krl_info/screens/login/components/app_title.dart';

class StationInfoDetail extends StatelessWidget {
  const StationInfoDetail({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(children: <Widget>[
        // Station Image
        Expanded(
          flex: 1,
          child: Container(
            width: size.width,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fitWidth,
                    image: AssetImage('assets/images/trainImage.png'))),
          ),
        ),
        // Information
        Expanded(
            flex: 2,
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.only(right: 24, left: 24, top: 31),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const <Widget>[
                      Image(
                          height: 30,
                          image: AssetImage('assets/images/carbon_train.png')),
                      SizedBox(height: 15),
                      DescriptionText(),
                    ]),
              ),
            ))
      ]),
    );
  }
}

class DescriptionText extends StatelessWidget {
  const DescriptionText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Temukan rute KRL terbaik dan dapatkan info-info stasiun KRL yang belum kamu ketahui disini!',
      style: TextStyle(
        fontFamily: 'Inter',
        fontSize: 16,
      ),
    );
  }
}
