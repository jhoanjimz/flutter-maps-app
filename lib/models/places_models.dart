import 'dart:convert';

class PlacesResponse {
  final String type;
  // final List<String> query;
  final List<Feature> features;
  final String attribution;

  PlacesResponse({
    required this.type,
    // required this.query,
    required this.features,
    required this.attribution,
  });

  factory PlacesResponse.fromJson(String str) => PlacesResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PlacesResponse.fromMap(Map<String, dynamic> json) => PlacesResponse(
    type: json["type"],
    // query: List<String>.from(json["query"].map((x) => x)),
    features: List<Feature>.from(json["features"].map((x) => Feature.fromMap(x))),
    attribution: json["attribution"],
  );

  Map<String, dynamic> toMap() => {
    "type": type,
    // "query": List<dynamic>.from(query.map((x) => x)),
    "features": List<dynamic>.from(features.map((x) => x.toMap())),
    "attribution": attribution,
  };
}

class Feature {
  final String id;
  final String type;
  final List<String> placeType;
  final Properties properties;
  final String textEs;
  final String placeNameEs;
  final String text;
  final String placeName;
  final List<double>? bbox;
  final List<double> center;
  final Geometry geometry;
  final List<Context> context;
  final String? matchingText;
  final String? matchingPlaceName;

  Feature({
    required this.id,
    required this.type,
    required this.placeType,
    required this.properties,
    required this.textEs,
    required this.placeNameEs,
    required this.text,
    required this.placeName,
    this.bbox,
    required this.center,
    required this.geometry,
    required this.context,
    this.matchingText,
    this.matchingPlaceName,
  });

  factory Feature.fromJson(String str) => Feature.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Feature.fromMap(Map<String, dynamic> json) => Feature(
    id: json["id"],
    type: json["type"],
    placeType: List<String>.from(json["place_type"].map((x) => x)),
    properties: Properties.fromMap(json["properties"]),
    textEs: json["text_es"],
    placeNameEs: json["place_name_es"],
    text: json["text"],
    placeName: json["place_name"],
    bbox: json["bbox"] == null ? [] : List<double>.from(json["bbox"]!.map((x) => x?.toDouble())),
    center: List<double>.from(json["center"].map((x) => x?.toDouble())),
    geometry: Geometry.fromMap(json["geometry"]),
    context: List<Context>.from(json["context"].map((x) => Context.fromMap(x))),
    matchingText: json["matching_text"],
    matchingPlaceName: json["matching_place_name"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "type": type,
    "place_type": List<dynamic>.from(placeType.map((x) => x)),
    "properties": properties.toMap(),
    "text_es": textEs,
    "place_name_es": placeNameEs,
    "text": text,
    "place_name": placeName,
    "bbox": bbox == null ? [] : List<dynamic>.from(bbox!.map((x) => x)),
    "center": List<dynamic>.from(center.map((x) => x)),
    "geometry": geometry.toMap(),
    "context": List<dynamic>.from(context.map((x) => x.toMap())),
    "matching_text": matchingText,
    "matching_place_name": matchingPlaceName,
  };

  @override
  String toString() {
    return 'Feature: $text';
  }

}

class Context {
  final String id;
  final String mapboxId;
  final String textEs;
  final String text;
  final String? wikidata;
  final String? shortCode;

  Context({
    required this.id,
    required this.mapboxId,
    required this.textEs,
    required this.text,
    this.wikidata,
    this.shortCode,
  });

  factory Context.fromJson(String str) => Context.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Context.fromMap(Map<String, dynamic> json) => Context(
    id: json["id"],
    mapboxId: json["mapbox_id"],
    textEs: json["text_es"],
    text: json["text"],
    wikidata: json["wikidata"],
    shortCode: json["short_code"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "mapbox_id": mapboxId,
    "text_es": textEs,
    "text": text,
    "wikidata": wikidata,
    "short_code": shortCode,
  };
}

class Geometry {
  final String type;
  final List<double> coordinates;

  Geometry({
    required this.type,
    required this.coordinates,
  });

  factory Geometry.fromJson(String str) => Geometry.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Geometry.fromMap(Map<String, dynamic> json) => Geometry(
    type: json["type"],
    coordinates: List<double>.from(json["coordinates"].map((x) => x?.toDouble())),
  );

  Map<String, dynamic> toMap() => {
    "type": type,
    "coordinates": List<dynamic>.from(coordinates.map((x) => x)),
  };
}

class Properties {
  final String? mapboxId;
  final String? wikidata;
  final String? foursquare;
  final bool? landmark;
  final String? address;
  final String? category;
  final String? maki;

  Properties({
    this.mapboxId,
    this.wikidata,
    this.foursquare,
    this.landmark,
    this.address,
    this.category,
    this.maki,
  });

  factory Properties.fromJson(String str) => Properties.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Properties.fromMap(Map<String, dynamic> json) => Properties(
    mapboxId: json["mapbox_id"],
    wikidata: json["wikidata"],
    foursquare: json["foursquare"],
    landmark: json["landmark"],
    address: json["address"],
    category: json["category"],
    maki: json["maki"],
  );

  Map<String, dynamic> toMap() => {
    "mapbox_id": mapboxId,
    "wikidata": wikidata,
    "foursquare": foursquare,
    "landmark": landmark,
    "address": address,
    "category": category,
    "maki": maki,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
