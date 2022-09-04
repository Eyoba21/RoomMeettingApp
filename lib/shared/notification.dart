import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[700],
        elevation: 0.0,
        title: Center(
          child: Text('Notification',
              style: GoogleFonts.italianno(fontSize: 49, color: Colors.white)),
        ),
      ),
      backgroundColor: Colors.blue[700],
      body: Column(
        children: [
          SizedBox(
            height: 200,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50)),
              ),
              
            ),
          ),
        
        ],
      ),
    );
  }
}
