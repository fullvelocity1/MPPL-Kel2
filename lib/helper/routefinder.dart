import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dijkstra/dijkstra.dart';
import 'package:krl_info/model/station_model.dart';

class RouteFinder {
  List<Station> list_st = [];
  List<dynamic> stNames = [];
  Map st_graph = {};
  var harga = 3000;
  num distance = 0;

  void stationsToGraph() async {
    // Fetch Stations Data
    final ref =
        await FirebaseFirestore.instance.collection("dummy-stasiun").get();
    list_st = List.from(ref.docs.map((doc) => Station.fromSnapshot(doc)));
    // print(list_st.length);

    // List Fetch Data into Variables
    for (var i in list_st) {
      stNames.add(i.id);
      st_graph[i.id] = i.connections;
    }
    // print(stNames);
    // print(st_graph);
  }

  List<dynamic> findRoute(st_from, st_to) {
    // Dummy Test
    // var st_from = "kmpngbndn";
    // var st_to = "mnggr";

    // Route Finder using Dijkstra
    stationsToGraph();
    var routefinder_output =
        Dijkstra.findPathFromGraph(st_graph, st_from, st_to);
    calculateDistance(routefinder_output);
    calculatePrice(distance);
    return (routefinder_output);
    // print("routefinder debug report :");
    // print(routefinder_output);
    // print(st_graph[routefinder_output[0]]);
  }

  void calculateDistance(rute) {
    // Distance Counter
    for (var i = 0; i < rute.length - 1; i++) {
      var current_st = rute[i];
      var next_st = rute[i + 1];
      distance = distance + st_graph[current_st][next_st].round();
    }
    // print(distance);
  }

  void calculatePrice(distance) {
    // Price Counter
    // distance = 105000;
    if (distance <= 25000) {
      harga = 3000;
    } else {
      var ongkosSetiapSepuluhKM = 1000;
      var new_dist = distance - 25000;
      double dist_multiplier = new_dist / 10000;
      int fix_dist = dist_multiplier.ceil();
      harga = harga + fix_dist * ongkosSetiapSepuluhKM;
    }

    // print(harga);
  }
}
