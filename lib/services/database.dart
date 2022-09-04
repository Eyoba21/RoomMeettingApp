import 'dart:convert';

import 'package:firebase/models/room.dart';
import 'package:http/http.dart' as http;

class NetworkHelper {
  static Future<List<RoomModel>> getData() async {
    try {
      var response = await http.get(
        Uri.parse("https://realstate-api-backend.herokuapp.com/api/room"),
      );
      print(response.statusCode);
      if (response.statusCode == 201) {
        print(response.body);
        List jsonResponse = jsonDecode(response.body);
        return jsonResponse.map((data) => RoomModel.fromJson(data)).toList();
      } else {
        throw Exception("Api error");
      }
    } catch (e) {
      rethrow;
    }
  }
}

  // void post(String roomName, add, imgUrl) async {
  //   try {
  //     var response = await http.post(
  //       Uri.parse("realstate-api-backend.herokuapp.com/api/room"),
  //       body: jsonEncode({
  //         "roomname": roomName,
  //         "address": add,
  //         "image": imgUrl,
  //       }),
  //     );
  //     if (response.statusCode == 200) {
  //       //success
  //     } else {
  //       print(response.statusCode);
  //     }
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

 

//realstate-api-backend.herokuapp.com/api/room