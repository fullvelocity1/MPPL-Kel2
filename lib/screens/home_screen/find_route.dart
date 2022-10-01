import 'package:flutter/material.dart';
import 'package:krl_info/constants.dart';
import 'package:krl_info/screens/login/components/app_title.dart';
import 'package:dropdown_search/dropdown_search.dart';

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
        body: SingleChildScrollView(
      child: Container(
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
                                  MaterialStateProperty.all<Color>(primColor),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(4),
                                          bottomLeft: Radius.circular(4)),
                                      side: BorderSide(color: primColor)))),
                          onPressed: () {},
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const <Widget>[
                                Image(
                                    height: 12,
                                    image: AssetImage(
                                        'assets/images/icons_check.png')),
                                Text("Cari Rute",
                                    style: TextStyle(
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w700,
                                        fontSize: 14)),
                              ],
                            ),
                          )),
                    )),
                // "Info Stasiun" page button
                Expanded(
                  flex: 1,
                  child: SizedBox(
                    width: size.width,
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
                                  topRight: Radius.circular(4),
                                  bottomRight: Radius.circular(4)),
                            ))),
                        onPressed: () {},
                        child: const Text("Info Stasiun",
                            style: TextStyle(
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w700,
                                fontSize: 14))),
                  ),
                ),
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
            // Stasiun Keberangkatan Form
            Container(
              height: 55,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(37, 37, 37, 0.1),
                borderRadius: BorderRadius.all(Radius.circular(4)),
              ),
              child: Row(children: <Widget>[
                const Expanded(
                    flex: 1,
                    child: Image(
                        height: 33,
                        image:
                            AssetImage('assets/images/icon_departureSt.png'))),
                Expanded(
                  flex: 7,
                  child: DropdownSearch<String>(
                    popupProps: const PopupProps.menu(
                      showSelectedItems: true,
                      showSearchBox: true,
                    ),
                    items: [
                      "Stasiun A",
                      "Stasiun B",
                      "Stasiun C",
                      "Stasiun D",
                      "Stasiun E",
                      "Stasiun F"
                    ],
                    dropdownDecoratorProps: const DropDownDecoratorProps(
                      dropdownSearchDecoration: InputDecoration(
                          hintText: "Masukkan stasiun keberangkatan",
                          hintStyle:
                              TextStyle(fontFamily: 'Inter', fontSize: 14),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                            ),
                          )),
                    ),
                    onChanged: print,
                  ),
                ),
              ]),
            ),
            const SizedBox(height: 11),
            // Stasiun Tujuan Form
            Container(
              height: 55,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(37, 37, 37, 0.1),
                borderRadius: BorderRadius.all(Radius.circular(4)),
              ),
              child: Row(children: <Widget>[
                const Expanded(
                    flex: 1,
                    child: Image(
                        height: 33,
                        image: AssetImage(
                            'assets/images/icon_destinationSt.png'))),
                Expanded(
                  flex: 7,
                  child: DropdownSearch<String>(
                    popupProps: const PopupProps.menu(
                      showSelectedItems: true,
                      showSearchBox: true,
                    ),
                    items: [
                      "Stasiun A",
                      "Stasiun B",
                      "Stasiun C",
                      "Stasiun D",
                      "Stasiun E",
                      "Stasiun F"
                    ],
                    dropdownDecoratorProps: const DropDownDecoratorProps(
                      dropdownSearchDecoration: InputDecoration(
                          hintText: "Masukkan stasiun tujuan",
                          hintStyle:
                              TextStyle(fontFamily: 'Inter', fontSize: 14),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                            ),
                          )),
                    ),
                    onChanged: print,
                  ),
                ),
              ]),
            ),

            const SizedBox(height: 35),
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
            // Recent Search Title
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
            const SizedBox(height: 13),
            // Recent search information
            Container(
              height: 80,
              decoration: BoxDecoration(
                border: Border.all(color: primColor),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
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
                            TextSpan(text: 'Stasiun Aaaaaaaaa'), // dinamis
                            TextSpan(text: ' - '), // statis
                            TextSpan(text: 'Stasiun Baaaaaaaa'), // dinamis
                            TextSpan(
                                text: '\ndiakses tanggal ', // statis
                                style: TextStyle(
                                    height: 2,
                                    fontSize: 12,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w100,
                                    color: Color.fromRGBO(37, 37, 37, 0.7))),
                            TextSpan(
                                text: '1 Oktober 2022', // dinamis
                                style: TextStyle(
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
                      height: 24, image: AssetImage('assets/images/arrow.png')),
                ),
              ]),
            )
          ],
        ),
      ),
    ));
  }
}
