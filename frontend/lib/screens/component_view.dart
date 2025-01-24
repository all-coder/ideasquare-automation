// all-coder 

import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';

//relative imports
import "../models/component.dart";

class ComponentView extends StatelessWidget {
  const ComponentView({required this.component, super.key});

  final Component component;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color(0xff2F2E2E),
        centerTitle: true,
        title: Text(
          component.name,
          style: GoogleFonts.firaMono(
            fontSize: 30,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          //this container displays the component's image
          Container(
            margin: const EdgeInsets.fromLTRB(15, 20, 15, 4),
            height: MediaQuery.of(context).size.height / 2.8,
            child: Card(
              // color: Colors.amber,
              elevation: 150,
              child: Image.asset(
                component.imageURL,
                fit: BoxFit.cover,
              ),
            ),
          ),

          //this container contains the details about the component(stock availability and position in the rack)
          Container(
            width: double.infinity,
            margin: const EdgeInsets.fromLTRB(17, 15, 17, 5),
            padding: const EdgeInsets.fromLTRB(20, 10, 5, 4),
            height: MediaQuery.of(context).size.height / 6,
            decoration: BoxDecoration(
              color: const Color(0xff2F2E2E),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Total Quantity :        ${component.position[0]}",
                  style: GoogleFonts.firaMono(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "In Stock :             ${component.available}",
                  style: GoogleFonts.firaMono(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "Rack No :               ${component.position[1]}",
                  style: GoogleFonts.firaMono(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "Box No :                ${component.position[2]}",
                  style: GoogleFonts.firaMono(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              const SizedBox(
                width: 14,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xffEE6C4D),
                ),
                onPressed: () {},
                child: Text(
                  "Datasheet",
                  style: GoogleFonts.firaMono(
                    fontSize: 25,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xffA73032),
                  
                ),
                onPressed: () {},
                child: Text(
                  "  Report  ",
                  style: GoogleFonts.firaMono(
                    fontSize: 25,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
