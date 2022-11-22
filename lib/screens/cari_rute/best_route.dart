import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:krl_info/constants.dart';
import 'package:krl_info/helper/routefinder.dart';
import 'package:krl_info/model/station_model.dart';
import 'package:krl_info/screens/cari_rute/find_route.dart';

class BestRoute extends StatefulWidget {
  final Function() notifyParent;
  const BestRoute(
      {super.key,
      required this.stTujuan,
      this.stKeberangkatan,
      required this.notifyParent});

  final String? stKeberangkatan;
  final String? stTujuan;

  @override
  State<BestRoute> createState() => _BestRouteState();
}

class _BestRouteState extends State<BestRoute> {
  final RouteFinder finder = RouteFinder();
  String st_from = "";
  String st_to = "";
  List<Station> stRute = [];
  Map mapHarga = {};
  var hargaFinal = 0;

  @override
  Widget build(BuildContext context) {
    finder.stationsToGraph();
    st_from = finder.searchIdByName(widget.stKeberangkatan);
    st_to = finder.searchIdByName(widget.stTujuan);
    finder.findRoute(st_from, st_to);
    stRute = finder.stDalamRuteSelainStartDanFinish;
    mapHarga = finder.mapHarga;
    hargaFinal = finder.hargaFinal;
    autoRefresh();

    // print(st_from);
    // print(stRute);
    // print(stRute.length);
    // print(mapHarga);

    var index = stRute.length;
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.only(right: 24, left: 24, top: 91),
        child: Column(
          children: <Widget>[
            // Text Page
            const Text.rich(
              TextSpan(
                children: <TextSpan>[
                  TextSpan(text: 'Inilah hasil '),
                  TextSpan(
                      text: 'rute terbaik ',
                      style: TextStyle(color: primColor)),
                  TextSpan(text: 'yang\n'),
                  TextSpan(text: 'bisa kamu tempuh'),
                ],
              ),
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20.0,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 19),
            // Best Route information
            Container(
              height: 253 + index * 50,
              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 20),
              decoration: BoxDecoration(
                border: Border.all(color: primColor),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Station Route
                  Row(children: <Widget>[
                    const Padding(
                      padding: EdgeInsets.only(right: 15),
                      child: Image(
                          height: 32,
                          image: AssetImage('assets/images/carbon_train.png')),
                    ),
                    Expanded(
                      child: Text.rich(
                        TextSpan(
                            text:
                                '${widget.stKeberangkatan} - ${widget.stTujuan}'),
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                            fontSize: 16.0,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ]),
                  const SizedBox(height: 8),
                  // Start point Station
                  SizedBox(
                    height: 50,
                    child: Row(
                      children: <Widget>[
                        // step icon
                        SizedBox(
                          width: 40,
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  height: 25,
                                  width: 4,
                                  color: primColor,
                                ),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Container(
                                  width: 20,
                                  decoration: const BoxDecoration(
                                    color: primColor,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Text.rich(
                            TextSpan(
                                text:
                                    '${widget.stKeberangkatan} (Start Point)'), //dinamis
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                              fontSize: 14.0,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(37, 37, 37, 0.75),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Stasiun penghubung
                  ListView.builder(
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: index,
                    itemBuilder: (context, index) {
                      var currentSt = stRute[index];
                      return SizedBox(
                        height: 50,
                        child: Row(children: <Widget>[
                          SizedBox(
                            width: 40,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  height: 50,
                                  width: 4,
                                  color: primColor,
                                ),
                                Container(
                                  width: 20,
                                  decoration: const BoxDecoration(
                                    color: primColor,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Text.rich(
                              TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                      text: currentSt.stationName), // dinamis
                                  TextSpan(
                                      text:
                                          '\nHarga ke ${currentSt.stationName} :  ', // statis
                                      style: TextStyle(
                                          height: 1.5,
                                          fontSize: 12,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w100,
                                          color:
                                              Color.fromRGBO(37, 37, 37, 0.7))),
                                  TextSpan(
                                    text: mapHarga[currentSt.stationName]
                                        .toString(), // dinamis
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w100,
                                      color: primColor,
                                    ),
                                  ),
                                ],
                              ),
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 14.0,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500,
                                color: Color.fromRGBO(37, 37, 37, 0.75),
                              ),
                            ),
                          ),
                        ]),
                      );
                    },
                  ),
                  // Finish point Station
                  SizedBox(
                    height: 50,
                    child: Row(
                      children: <Widget>[
                        SizedBox(
                          width: 40,
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.topCenter,
                                child: Container(
                                  height: 25,
                                  width: 4,
                                  color: primColor,
                                ),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Container(
                                  width: 20,
                                  decoration: const BoxDecoration(
                                    color: primColor,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Text.rich(
                            TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                    text:
                                        '${widget.stTujuan} (Finish Point)'), // dinamis
                                TextSpan(
                                    text:
                                        '\nHarga tiket ke ${widget.stTujuan} :  ', // statis
                                    style: const TextStyle(
                                        height: 1.5,
                                        fontSize: 12,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w100,
                                        color:
                                            Color.fromRGBO(37, 37, 37, 0.7))),
                                TextSpan(
                                  text: hargaFinal.toString(), // dinamis
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w100,
                                    color: primColor,
                                  ),
                                ),
                              ],
                            ),
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                              fontSize: 14.0,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(37, 37, 37, 0.75),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 19,
                  ),
                  // Total tarif harga
                  Text.rich(
                    TextSpan(
                      children: <TextSpan>[
                        const TextSpan(
                            text:
                                'Total biaya tiket yang perlu dikeluarkan : '),
                        TextSpan(
                          text: 'Rp ${hargaFinal}',
                          style: const TextStyle(color: primColor),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                        fontSize: 16.0,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 27.5),
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
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("Kembali ke Homepage",
                      style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                          fontSize: 14))),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    ));
  }

  Future autoRefresh() async {
    Future.delayed(Duration(milliseconds: 1), () {
      setState(() {});
    });
  }
}
