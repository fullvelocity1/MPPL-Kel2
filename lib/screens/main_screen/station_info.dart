import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:krl_info/constants.dart';
import 'package:krl_info/screens/main_screen/find_route.dart';
import 'package:krl_info/screens/main_screen/station_info_detail.dart';

import 'components/app_title_n_profile.dart';

class StationInfo extends StatefulWidget {
  const StationInfo({super.key});

  @override
  State<StationInfo> createState() => _StationInfoState();
}

class _StationInfoState extends State<StationInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(right: 24, left: 24, top: 42),
          child: Column(children: <Widget>[
            const AppTitleNProfile(),
            const SizedBox(height: 35),
            // Button Page
            Row(
              children: [
                // "Cari Rute" Page Button
                Expanded(
                  flex: 1,
                  child: SizedBox(
                    height: 48,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            foregroundColor: MaterialStateProperty.all<Color>(
                                const Color.fromRGBO(37, 37, 37, 0.5)),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                const Color.fromARGB(255, 229, 229, 229)),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(4),
                                  bottomLeft: Radius.circular(4)),
                            ))),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const FindRoute()),
                          );
                        },
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
                      height: 48,
                      child: ElevatedButton(
                          style: ButtonStyle(
                              foregroundColor:
                                  MaterialStateProperty.all<Color>(primColor),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(4),
                                          bottomRight: Radius.circular(4)),
                                      side: BorderSide(color: primColor)))),
                          onPressed: () {},
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const <Widget>[
                                Image(
                                    height: 12,
                                    image: AssetImage(
                                        'assets/images/icons_check.png')),
                                Text("Info Stasiun",
                                    style: TextStyle(
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w700,
                                        fontSize: 14)),
                              ],
                            ),
                          )),
                    )),
              ],
            ),
            const SizedBox(height: 47),
            DropdownSearch<String>(
              popupProps: const PopupProps.menu(
                showSelectedItems: true,
                showSearchBox: true,
              ),
              items: ["ini", "mau", "diganti", "Search", "Box?"],
              dropdownDecoratorProps: const DropDownDecoratorProps(
                dropdownSearchDecoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.only(left: 23, top: 15, bottom: 15),
                    hintText: "Pilih stasiun",
                    hintStyle: TextStyle(fontFamily: 'Inter', fontSize: 14),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                    filled: true,
                    fillColor: Color.fromRGBO(37, 37, 37, 0.04)),
              ),
              onChanged: print,
            ),
            const SizedBox(height: 10),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const StationInfoDetail()),
                );
              },
              child: Container(
                height: 88,
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                        width: 1.5, color: Color.fromRGBO(37, 37, 37, 0.25)),
                  ),
                ),
                child: Row(children: const <Widget>[
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Image(
                          height: 32,
                          image: AssetImage('assets/images/carbon_train.png')),
                    ),
                  ),
                  Expanded(
                      flex: 5,
                      child: Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Text.rich(
                          TextSpan(
                            children: <TextSpan>[
                              TextSpan(text: 'Stasiun Aaaaaaaaa'),
                              TextSpan(
                                  text: '\nAlamat stasiun',
                                  style: TextStyle(
                                      height: 2,
                                      fontSize: 12,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w100,
                                      color: Color.fromRGBO(37, 37, 37, 0.7))),
                            ],
                          ),
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 16.0,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w700),
                        ),
                      )),
                  Expanded(
                    flex: 1,
                    child: Image(
                        height: 24,
                        image: AssetImage('assets/images/arrow.png')),
                  ),
                ]),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const StationInfoDetail()),
                );
              },
              child: Container(
                height: 88,
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                        width: 1.5, color: Color.fromRGBO(37, 37, 37, 0.25)),
                  ),
                ),
                child: Row(children: const <Widget>[
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Image(
                          height: 32,
                          image: AssetImage('assets/images/carbon_train.png')),
                    ),
                  ),
                  Expanded(
                      flex: 5,
                      child: Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Text.rich(
                          TextSpan(
                            children: <TextSpan>[
                              TextSpan(text: 'Stasiun Baaaaa'),
                              TextSpan(
                                  text: '\nAlamat stasiun',
                                  style: TextStyle(
                                      height: 2,
                                      fontSize: 12,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w100,
                                      color: Color.fromRGBO(37, 37, 37, 0.7))),
                            ],
                          ),
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 16.0,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w700),
                        ),
                      )),
                  Expanded(
                    flex: 1,
                    child: Image(
                        height: 24,
                        image: AssetImage('assets/images/arrow.png')),
                  ),
                ]),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
