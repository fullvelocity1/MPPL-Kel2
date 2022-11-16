import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dijkstra/dijkstra.dart';
import 'package:krl_info/model/station_model.dart';

class RouteFinder {
  List<Station> list_st = [];
  Map st_graph = {};

  void stationsToGraph() async {
    final ref =
        await FirebaseFirestore.instance.collection("dummy-stasiun").get();
    list_st = List.from(ref.docs.map((doc) => Station.fromSnapshot(doc)));
    print(list_st.length);
    List<dynamic> stNames = [];
    for (var i in list_st) {
      stNames.add(i.id);
      st_graph[i.id] = i.connections;
    }
    print(stNames);
    print(st_graph);

    var st_from = "kmpngbndn";
    var st_to = "mnggr";

    var routefinder_output =
        Dijkstra.findPathFromGraph(st_graph, st_from, st_to);
    print("routefinder debug report :");
    print(routefinder_output);
  }
}
