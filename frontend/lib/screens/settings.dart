
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:flutter/cupertino.dart';

class Settings extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Settingsstate();
  }
}


class Settingsstate extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: const Color(0xff2F2E2E),
        centerTitle: true,
        title: Text(
          "Settings",
          style: GoogleFonts.firaMono(
            fontWeight: FontWeight.w400,
            color: const Color(0xffced4da),
            fontSize: 30,
          ),
        ),
      ),

    );
  }
  
}