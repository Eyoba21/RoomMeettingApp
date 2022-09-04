// ignore_for_file: deprecated_member_use

import 'package:firebase/screens/book.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';

// ignore: must_be_immutable
class RommTile extends StatefulWidget {
  final String roomImagePath;
  final String roomName;
  final String address;
  String avaliablity;

  RommTile(
      {required this.roomImagePath,
      required this.roomName,
      required this.address,
      required this.avaliablity});

  @override
  State<RommTile> createState() => _RommTileState();
}

class _RommTileState extends State<RommTile> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Stack(children: [
      Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Container(
          height: screenSize.height * 0.35,
          width: screenSize.width,
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: screenSize.height * 0.22,
                width: screenSize.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: CachedNetworkImageProvider(widget.roomImagePath), fit: BoxFit.cover),
                ),
              ),
              SizedBox(height: 6),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  widget.roomName,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 4),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                child: Text(
                  widget.address,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Center(
                  child: Container(
                    height: 42,
                    width: screenSize.width * 0.4,
                    child: RaisedButton(
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => BookNow())),
                      color: Colors.blue[700],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      child: Text(
                        'Book Now',
                        style: GoogleFonts.bebasNeue(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      Positioned(
        right: 15,
        child: Container(
          height: 20,
          width: 100,
          decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(4)),
          child: Text(
            widget.avaliablity,
            style: TextStyle(fontSize: 16, color: Colors.black),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    ]);
  }
}
