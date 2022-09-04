// To parse this JSON data, do
//
//     final roomModel = roomModelFromJson(jsonString);

import 'dart:convert';

List<RoomModel> roomModelFromJson(String str) =>
    List<RoomModel>.from(json.decode(str).map((x) => RoomModel.fromJson(x)));

String roomModelToJson(List<RoomModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RoomModel {
  RoomModel({
    required this.id,
    required this.name,
    required this.unavailbleDate,
    required this.v,
    required this.roomNo,
    required this.image,
  });

  String id;
  String name;
  List<dynamic> unavailbleDate;
  int v;
  int? roomNo;
  String image;

  factory RoomModel.fromJson(Map<String, dynamic> json) => RoomModel(
        id: json["_id"],
        name: json["name"],
        unavailbleDate:
            List<dynamic>.from(json["unavailbleDate"].map((x) => x)),
        v: json["__v"],
        roomNo: json["roomNo"] ?? null,
        image: json["image"] ?? ''  ,
      );
  static List<RoomModel> recipesFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return RoomModel.fromJson(data);
    }).toList();
  }

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "unavailbleDate": List<dynamic>.from(unavailbleDate.map((x) => x)),
        "__v": v,
        "roomNo": roomNo,
        "image": image,
      };
  @override
  String toString() {
    return 'RoomModel { name: $name, image: $image} ';
  }
}
