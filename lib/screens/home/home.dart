import 'package:firebase/shared/navbar.dart';
import 'package:firebase/shared/profileView.dart';
import 'package:firebase/shared/room_tile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: NavBar(),
      appBar: AppBar(
        toolbarHeight: 80,
        elevation: 0.0,
        title: Center(
            child: Text(
          'HomePage',
          style: GoogleFonts.italianno(fontSize: 40),
        )),
        backgroundColor: Colors.blue[700],
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
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextField(
                  decoration: InputDecoration(
                border: InputBorder.none,
                prefixIcon: const Icon(Icons.search),
                hintText: "Find you'r office...",
              )),
            ),
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
