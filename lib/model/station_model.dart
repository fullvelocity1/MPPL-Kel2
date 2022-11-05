// Dummy database
class Station {
  String stationName;
  String address;
  List<String>? facilities;

  Station({
    required this.stationName,
    required this.address,
    this.facilities,
  });

  Map<String, dynamic> toJson() => {
        'stationName': stationName,
        'address': address,
        'facilites': facilities,
      };

  Station.fromSnapshot(snapshot)
      : stationName = snapshot.data()['stationName'],
        address = snapshot.data()['address'];
}

List<Station> allStation = [
  Station(
    stationName: "Stasiun Jakarta Kota",
    address: "Jakarta Utara",
    facilities: ["Toilet", "Tempat tunggu", "Kantin"],
  ),
  Station(
    stationName: "Stasiun Kali Deres",
    address: "Jakarta Barat",
    facilities: ["Toilet", "Tempat tunggu", "Kantin"],
  ),
  Station(
    stationName: "Stasiun Tebet",
    address: "Jakarta Timur",
    facilities: ["Toilet", "Tempat tunggu", "Kantin"],
  ),
  Station(
    stationName: "Stasiun Lenteng Agung",
    address: "Jakarta Selatan",
    facilities: ["Toilet", "Tempat tunggu", "Kantin"],
  ),
  Station(
    stationName: "Stasiun Depok Baru",
    address: "Depok",
    facilities: ["Toilet", "Tempat tunggu", "Kantin"],
  ),
  Station(
    stationName: "Stasiun Bogor",
    address: "Bogor",
    facilities: ["Toilet", "Tempat tunggu", "Kantin"],
  ),
  Station(
    stationName: "Stasiun Citayem",
    address: "Depok",
    facilities: ["Toilet", "Tempat tunggu", "Kantin"],
  ),
  Station(
    stationName: "Stasiun Universitas Indonesia",
    address: "Depok",
    facilities: ["Toilet", "Tempat tunggu", "Kantin"],
  ),
];
