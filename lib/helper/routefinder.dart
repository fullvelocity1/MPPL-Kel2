import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dijkstra/dijkstra.dart';
import 'package:krl_info/model/station_model.dart';

class RouteFinder {
  List<Station> list_st = [];
  List<dynamic> st_ids = [];
  Map st_graph = {};
  Map<String?, dynamic> mapHarga = {};
  List<Station> stDalamRute = [];
  var hargaFinal = 0;
  num distance = 0;

  List<String> stationsToStName() {
    List<String> res = [];
    for (var i in list_st) {
      // print(i.stationName);
      res.add(i.stationName);
    }
    return res;
  }

  Station searchStById(String idStasiun) {
    for (var i in list_st) {
      if (i.id == idStasiun) {
        return i;
      }
    }
    throw Exception('Station Not Foundnd');
  }

  String? searchIdByName(String namaStasiun) {
    for (var i in list_st) {
      if (i.stationName == namaStasiun) {
        return i.id;
      }
    }
    return "ID Not Found";
  }

  String searchNameById(String idStasiun) {
    for (var i in list_st) {
      if (i.id == idStasiun) {
        return i.stationName;
      }
    }
    return "ID Not Found";
  }

  void stationsToGraph() async {
    // Fetch Stations Data
    final ref =
        await FirebaseFirestore.instance.collection("dummy-stasiun").get();
    list_st = List.from(ref.docs.map((doc) => Station.fromSnapshot(doc)));
    // print(list_st.length);

    // List Fetch Data into Variables
    for (var i in list_st) {
      st_ids.add(i.id);
      st_graph[i.id] = i.connections;
    }
    // print(st_ids);
    // print(st_graph);
  }

  List<dynamic> findRoute(st_from, st_to) {
    // Dummy Test
    // var st_from = "kmpngbndn";
    // var st_to = "mnggr";

    // Route Finder using Dijkstra
    stationsToGraph();
    mapHarga.clear();
    stDalamRute = [];
    var routefinder_output =
        Dijkstra.findPathFromGraph(st_graph, st_from, st_to);
    for (var i in routefinder_output) {
      Station stTemp = searchStById(i);
      stDalamRute.add(stTemp);
    }
    calculateDistance(routefinder_output);
    calculatePrice(distance);
    print(stDalamRute);
    print(mapHarga);
    return (routefinder_output);
    // print("routefinder debug report :");
    // print(routefinder_output);
    // print(st_graph[routefinder_output[0]]);
  }

  void calculateDistance(rute) {
    // Distance Counter
    distance = 0;
    for (var i = 0; i < rute.length - 1; i++) {
      var current_st = rute[i];
      var next_st = rute[i + 1];
      distance = distance + st_graph[current_st][next_st].round();
      calculatePrice(distance);
      String? namaNextSt = searchNameById(next_st);
      mapHarga[namaNextSt] = hargaFinal;
    }
    // print(distance);
  }

  void calculatePrice(distance) {
    // Price Counter
    // distance = 105000;
    hargaFinal = 3000;
    if (distance <= 25000) {
      hargaFinal = 3000;
    } else {
      var ongkosSetiapSepuluhKM = 1000;
      var new_dist = distance - 25000;
      double dist_multiplier = new_dist / 10000;
      int fix_dist = dist_multiplier.ceil();
      hargaFinal = hargaFinal + fix_dist * ongkosSetiapSepuluhKM;
    }

    // print(hargaFinal);
  }
}
