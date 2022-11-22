import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:krl_info/constants.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:krl_info/screens/cari_rute/best_route.dart';
import 'package:krl_info/screens/info_stasiun/station_info.dart';
import 'package:krl_info/model/station_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'components/app_title_n_profile.dart';
import 'package:intl/date_symbol_data_local.dart';

class FindRoute extends StatefulWidget {
  const FindRoute({super.key});

  @override
  State<FindRoute> createState() => _FindRouteState();
}

class _FindRouteState extends State<FindRoute> {
  String? stKeberangkatan;
  String? stTujuan;
  List<Station> stations = [];
  List<String> stations_name = [];
  DateFormat dateFormat = DateFormat();
  DateFormat dayFormat = DateFormat();
  DateFormat monthFormat = DateFormat();
  DateFormat yearFormat = DateFormat();
  DateFormat timeFormat = DateFormat();
  String history_stFrom = "";
  String history_stTo = "";
  String history_date = "";
  String? user = "";

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    initializeDateFormatting();

    user = FirebaseAuth.instance.currentUser?.uid;
    dateFormat = new DateFormat.yMMMEd('in');
    dayFormat = new DateFormat.d('in');
    monthFormat = new DateFormat.MMMM('in');
    yearFormat = new DateFormat.y('in');
    timeFormat = new DateFormat.Hms('in');
    readHistory();
    getStationsList();
  }

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
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const StationInfo()),
                          );
                        },
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
            Form(
              key: _formKey,
              child: Column(
                children: [
                  // Stasiun Keberangkatan Form
                  DropdownSearch<String>(
                    validator: (value) {
                      if (value == null) {
                        return 'Silahkan masukkan stasiun keberangkatan';
                      }
                      return null;
                    },
                    popupProps: const PopupProps.menu(
                      showSelectedItems: true,
                      showSearchBox: true,
                    ),
                    // items: [
                    //   "Stasiun A",
                    //   "Stasiun B",
                    //   "Stasiun C",
                    //   "Stasiun D",
                    //   "Stasiun E",
                    //   "Stasiun F"
                    // ],
                    items: stationsToStName(),
                    dropdownDecoratorProps: DropDownDecoratorProps(
                      dropdownSearchDecoration: InputDecoration(
                        filled: true,
                        fillColor: const Color.fromRGBO(37, 37, 37, 0.1),
                        hintText: "Stasiun keberangkatan",
                        hintStyle:
                            const TextStyle(fontFamily: 'Inter', fontSize: 14),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                        prefixIcon: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Image(
                            height: 33,
                            image: AssetImage(
                                'assets/images/icon_departureSt.png'),
                          ),
                        ),
                      ),
                    ),
                    onChanged: (newvalue) {
                      setState(() {
                        stKeberangkatan = newvalue!; //updated
                      });
                    },
                  ),
                  const SizedBox(height: 11),
                  // Stasiun Tujuan Form
                  DropdownSearch<String>(
                    validator: (value) {
                      if (value == null) {
                        return 'Silahkan masukkan stasiun tujuan';
                      }
                      return null;
                    },
                    popupProps: const PopupProps.menu(
                      showSelectedItems: true,
                      showSearchBox: true,
                    ),
                    // items: [
                    //   "Stasiun A",
                    //   "Stasiun B",
                    //   "Stasiun C",
                    //   "Stasiun D",
                    //   "Stasiun E",
                    //   "Stasiun F"
                    // ],
                    items: stationsToStName(),
                    dropdownDecoratorProps: DropDownDecoratorProps(
                      dropdownSearchDecoration: InputDecoration(
                        filled: true,
                        fillColor: const Color.fromRGBO(37, 37, 37, 0.1),
                        hintText: "Stasiun tujuan",
                        hintStyle:
                            const TextStyle(fontFamily: 'Inter', fontSize: 14),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                        hintMaxLines: 2,
                        prefixIcon: const Padding(
                          padding: EdgeInsets.all(11.0),
                          child: Image(
                            height: 33,
                            image: AssetImage(
                                'assets/images/icon_destinationSt.png'),
                          ),
                        ),
                      ),
                    ),
                    onChanged: (newvalue) {
                      setState(() {
                        stTujuan = newvalue!; //updated
                      });
                    },
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
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4),
                                    side: const BorderSide(color: primColor)))),
                        onPressed: () {
                          if (_formKey.currentState != null &&
                              _formKey.currentState!.validate() &&
                              stKeberangkatan != stTujuan) {
                            saveHistory();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BestRoute(
                                        stKeberangkatan: stKeberangkatan,
                                        stTujuan: stTujuan,
                                        notifyParent: refresh,
                                      )),
                            );
                            readHistory();
                          }
                        },
                        child: const Text("Cari Rute",
                            style: TextStyle(
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w700,
                                fontSize: 14))),
                  ),
                ],
              ),
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
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BestRoute(
                      stKeberangkatan: history_stFrom,
                      stTujuan: history_stTo,
                      notifyParent: refresh,
                    ),
                  ),
                );
              },
              child: Container(
                height: 80,
                decoration: BoxDecoration(
                  border: Border.all(color: primColor),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: Row(children: <Widget>[
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
                              TextSpan(text: history_stFrom), // dinamis
                              TextSpan(text: ' - '), // statis
                              TextSpan(text: history_stTo), // dinamis
                              TextSpan(
                                  text: '\ndiakses tanggal ', // statis
                                  style: TextStyle(
                                      height: 2,
                                      fontSize: 12,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w100,
                                      color: Color.fromRGBO(37, 37, 37, 0.7))),
                              TextSpan(
                                  text: history_date, // dinamis
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
                        height: 24,
                        image: AssetImage('assets/images/arrow.png')),
                  ),
                ]),
              ),
            )
          ],
        ),
      ),
    ));
  }

  List<String> stationsToStName() {
    List<String> res = [];
    for (var i in stations) {
      // print(i.stationName);
      res.add(i.stationName);
    }
    return res;
  }

  Future getStationsList() async {
    final ref =
        await FirebaseFirestore.instance.collection("dummy-stasiun").get();
    List<Station> list_st =
        List.from(ref.docs.map((doc) => Station.fromSnapshot(doc)));
    // print(list_st);
    setState(() {
      stations = list_st;
    });
  }

  refresh() {}

  Future saveHistory() async {
    // print(user);
    // print(stKeberangkatan);
    // print(stTujuan);
    String day = dayFormat.format(DateTime.now());
    String month = monthFormat.format(DateTime.now());
    String year = yearFormat.format(DateTime.now());
    String date = day + ' ' + month + ' ' + year;
    // print(date);
    final ref = FirebaseFirestore.instance.collection('history').doc(user);

    final query = ref.set({
      'stKeberangkatan': stKeberangkatan,
      'stTujuan': stTujuan,
      'tanggalAkses': date,
    });
  }

  Future readHistory() async {
    final ref = FirebaseFirestore.instance.collection('history').doc(user);
    final data = ref.get().then((doc) {
      setState(() {
        history_stFrom = doc.data()!['stKeberangkatan'];
        history_stTo = doc.data()!['stTujuan'];
        history_date = doc.data()!['tanggalAkses'];
      });
    });
    print(history_stFrom);
    print(history_stTo);
    print(history_date);
  }
}
