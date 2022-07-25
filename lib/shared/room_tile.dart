import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RommTile extends StatelessWidget {
  final String roomImagePath;
  final String roomName;
  RommTile({required this.roomImagePath, required this.roomName});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25),
      child: Container(
        width: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.black54,
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(roomImagePath)),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Column(
                  children: [
                    Text(
                      roomName,
                      style: GoogleFonts.bebasNeue(fontSize: 20),
                    ),
                  ],
                ),
              ),
              Icon(Icons.room),
              Text(
                'Bole Atlas',
                style: GoogleFonts.bebasNeue(fontSize: 20),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Available',
                      style: GoogleFonts.bebasNeue(
                        fontSize: 20,
                      )),
                  Padding(
                    padding: const EdgeInsets.all(4),
                    child: Container(
                        decoration: BoxDecoration(
                          color: Colors.deepPurple,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Icon(Icons.add)),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
