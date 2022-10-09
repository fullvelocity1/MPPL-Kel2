import 'package:flutter/material.dart';
import 'package:krl_info/constants.dart';
import 'package:krl_info/model/station_model.dart';

class StationInfoDetail extends StatelessWidget {
  const StationInfoDetail({super.key, required this.station});

  final Station station;

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          // Station Image
          Stack(
            children: [
              Container(
                width: size,
                height: 250,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fitWidth,
                    image: AssetImage('assets/images/trainImage.png'),
                  ),
                ),
              ),
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: CircleAvatar(
                    backgroundColor: Color.fromRGBO(0, 0, 0, 0.25),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                    ),
                  ),
                ),
              )
            ],
          ),
          // Information
          Container(
            width: size,
            padding: const EdgeInsets.only(right: 45, left: 45, top: 31),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Image(
                  height: 30,
                  image: AssetImage('assets/images/carbon_train.png'),
                ),
                const SizedBox(height: 15),
                // Stasiun Name and Address
                Text.rich(
                  TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: '${station.stationName}\n',
                        style: const TextStyle(
                          color: primColor,
                          fontSize: 20,
                        ),
                      ),
                      TextSpan(
                        text: '${station.address}\n',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      const TextSpan(
                        text: 'Harga tiket : \n',
                        style: TextStyle(
                          height: 3,
                          fontSize: 14,
                        ),
                      ),
                      TextSpan(
                        text: 'Rp 4000\n',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      const TextSpan(
                        text: 'Jadwal keberangkatan : \n',
                        style: TextStyle(
                          height: 3,
                          fontSize: 14,
                        ),
                      ),
                      TextSpan(
                        text: '• 08:00 WIB\n',
                        style: TextStyle(
                          height: 1.5,
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      TextSpan(
                        text: '• 09:00 WIB\n',
                        style: TextStyle(
                          height: 1.5,
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      TextSpan(
                        text: '• 10:00 WIB\n',
                        style: TextStyle(
                          height: 1.5,
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      TextSpan(
                        text: '• 11:00 WIB\n',
                        style: TextStyle(
                          height: 1.5,
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      const TextSpan(
                        text: 'Fasilitas stasiun : \n',
                        style: TextStyle(
                          height: 3,
                          fontSize: 14,
                        ),
                      ),
                      TextSpan(
                        text: '• Toilet\n',
                        style: TextStyle(
                          height: 1.5,
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      TextSpan(
                        text: '• Tempat tunggu\n',
                        style: TextStyle(
                          height: 1.5,
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      TextSpan(
                        text: '• Kantin\n',
                        style: TextStyle(
                          height: 1.5,
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      height: 2,
                      fontSize: 14.0,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
