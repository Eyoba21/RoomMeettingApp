import 'package:firebase/services/auth.dart';
import 'package:firebase/shared/navbar.dart';
import 'package:firebase/shared/room_tile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      drawer: NavBar(),
      appBar: AppBar(
        actions:  [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: GestureDetector(
              onTap: _auth.SignOut,
              child: Icon(Icons.person)),
          )
        ],
        elevation: 0.0,
        title: const Text('HomePage'),
        backgroundColor: Colors.transparent,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: ""),
        ],
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              "Find the best office for you ",
              style: GoogleFonts.bebasNeue(
                fontSize: 50,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: TextField(
                decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search),
              hintText: "Find you'r office...",
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade600),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade600),
              ),
            )),
          ),
          SizedBox(height: 25),
          Expanded(
              child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              RommTile(
                roomImagePath: 'assets/room.jpg',
                roomName: 'Room1',
              ),
               RommTile(
                roomImagePath: 'assets/room2.jpg',
                roomName: 'Room2',
              ),
               RommTile(
                roomImagePath: 'assets/room3.jpg',
                roomName: 'Room3',
              ),
               RommTile(
                roomImagePath: 'assets/room4.jpg',
                roomName: 'Room4',
              ),
               RommTile(
                roomImagePath: 'assets/room5.jpg',
                roomName: 'Room5',
              ),
            ],
          )),
        ],
      ),
    );
  }
}
