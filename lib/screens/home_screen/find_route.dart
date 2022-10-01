import 'package:flutter/material.dart';
import 'package:krl_info/constants.dart';
import 'package:krl_info/screens/login/components/app_title.dart';

class FindRoute extends StatefulWidget {
  const FindRoute({super.key});

  @override
  State<FindRoute> createState() => _FindRouteState();
}

class _FindRouteState extends State<FindRoute> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.only(right: 24, left: 24, top: 42),
      child: Column(
        children: <Widget>[
          // App Title and Profile
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const <Widget>[
              AppTitle(),
              Image(
                  image: AssetImage(
                      'assets/images/carbon_user-avatar-filled.png')),
            ],
          ),
          const SizedBox(height: 35),
          // Button Page
          Row(
            children: [
              // "Cari Rute" Page Button
              Expanded(
                flex: 1,
                child: SizedBox(
                  width: size.width,
                  height: 48,
                  child: ElevatedButton(
                      style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(primColor),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(4),
                                          bottomLeft: Radius.circular(4)),
                                      side: BorderSide(color: primColor)))),
                      onPressed: () {},
                      child: const Text("Cari Rute",
                          style: TextStyle(
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w700,
                              fontSize: 14))),
                ),
              ),
              // "Info Stasiun" Page Button
              Expanded(
                  flex: 1,
                  child: SizedBox(
                    width: size.width,
                    height: 48,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all<Color>(primColor),
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(4),
                                        bottomRight: Radius.circular(4)),
                                    side: BorderSide(color: primColor)))),
                        onPressed: () {},
                        child: const Text("Info Stasiun",
                            style: TextStyle(
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w700,
                                fontSize: 14))),
                  ))
            ],
          ),
          const SizedBox(height: 43),
          // Text HomePage
          const Text.rich(
            TextSpan(
              children: <TextSpan>[
                TextSpan(text: 'Temukan '),
                TextSpan(
                    text: 'rute KRL terbaik\n',
                    style: TextStyle(color: primColor)),
                TextSpan(text: 'dengan harga termurah disini!'),
              ],
            ),
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20.0,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 43),
          // "Cari Rute" Button
          SizedBox(
            width: size.width,
            height: 48,
            child: ElevatedButton(
                style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(primColor),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                            side: const BorderSide(color: primColor)))),
                onPressed: () {},
                child: const Text("Cari Rute",
                    style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                        fontSize: 14))),
          ),
          const SizedBox(
            height: 43,
          ),
          const Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Pencarian terbaru!",
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Inter',
                  fontSize: 16),
            ),
          ),
        ],
      ),
    ));
  }
}
