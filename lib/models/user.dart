class Users {
  final String uid;
  Users({required this.uid});
}

class Room {
  final String roomName;
  final String address;
  final String imgUrl;
  String avaliablity;

  Room({
    required this.roomName,
    required this.address,
    required this.imgUrl,
    required this.avaliablity,
  });
}
