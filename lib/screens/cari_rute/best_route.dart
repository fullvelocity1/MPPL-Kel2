import 'package:flutter/material.dart';
import 'package:krl_info/constants.dart';
import 'package:krl_info/screens/cari_rute/find_route.dart';

class BestRoute extends StatefulWidget {
  const BestRoute({super.key, required this.stTujuan, this.stKeberangkatan});

  final String? stKeberangkatan;
  final String? stTujuan;

  @override
  State<BestRoute> createState() => _BestRouteState();
}

class _BestRouteState extends State<BestRoute> {
  @override
  Widget build(BuildContext context) {
    var index = 3;
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
              height: 250 + index * 50,
              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 20),
              decoration: BoxDecoration(
                border: Border.all(color: primColor),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                        const Padding(
                          padding: EdgeInsets.only(right: 15),
                          child: Image(
                              height: 32,
                              image:
                                  AssetImage('assets/images/carbon_train.png')),
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
                      return SizedBox(
                        height: 50,
                        child: Row(children: const <Widget>[
                          Padding(
                            padding: EdgeInsets.only(right: 15),
                            child: Image(
                                height: 32,
                                image: AssetImage(
                                    'assets/images/carbon_train.png')),
                          ),
                          Expanded(
                            child: Text.rich(
                              TextSpan(
                                children: <TextSpan>[
                                  TextSpan(text: 'Stasiun X'), // dinamis
                                  TextSpan(
                                      text:
                                          '\nHarga tiket ke stasiun X :  ', // statis
                                      style: TextStyle(
                                          height: 1.5,
                                          fontSize: 12,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w100,
                                          color:
                                              Color.fromRGBO(37, 37, 37, 0.7))),
                                  TextSpan(
                                    text: 'Berapa Duit', // dinamis
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
                        const Padding(
                          padding: EdgeInsets.only(right: 15),
                          child: Image(
                              height: 32,
                              image:
                                  AssetImage('assets/images/carbon_train.png')),
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
                                  text: 'Berapa Duit', // dinamis
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
                          text: 'Rp XXXXX',
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FindRoute()),
                    );
                  },
                  child: const Text("Kembali ke Homepage",
                      style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                          fontSize: 14))),
            ),
          ],
        ),
      ),
    ));
  }
}
