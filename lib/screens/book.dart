import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BookNow extends StatefulWidget {
  const BookNow({Key? key}) : super(key: key);

  @override
  State<BookNow> createState() => _BookNowState();
}

class _BookNowState extends State<BookNow> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          title: Center(
              child: Text(
            'BookNow',
            style: GoogleFonts.italianno(
              fontSize: 40,
            ),
          )),
          backgroundColor: Colors.blue[700],
          toolbarHeight: 80,
        ),
        backgroundColor: Colors.blue[700],
        body: Column(
          children: [
            SizedBox(
              height: 200,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 5),
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40))),
                    child: Column(
                      children: [
                        SizedBox(height: 10),
                        Center(
                            child: Text(
                          'Things to know',
                          style: GoogleFonts.bebasNeue(fontSize: 30),
                        )),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Rules:',
                          style: GoogleFonts.bebasNeue(fontSize: 30),
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Icon(Icons.timer),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 30),
                              child: Text(
                                'Maximum time to book is 4 hours',
                                style: GoogleFonts.bebasNeue(fontSize: 30),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Icon(Icons.timer),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 30),
                              child: Text(
                                'Minimum time to book is 15 minutes',
                                style: GoogleFonts.bebasNeue(fontSize: 30),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 150),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Icon(Icons.warning),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Text(
                                  'No smoking!!',
                                  style: GoogleFonts.bebasNeue(fontSize: 30),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 150,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(25),
                          child: Container(
                            width: double.infinity,
                            height: 60,
                            child: RaisedButton(
                              onPressed: () => {},
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              color: Colors.blue[700],
                              child: Text(
                                'Book Now',
                                style: GoogleFonts.italianno(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        )
                      ],
                    )),
              ),
            ),
          ],
        ));
  }
}
