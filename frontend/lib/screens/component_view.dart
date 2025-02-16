// all-coder
//necessary imports
import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';

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
                elevation: 150,
                child: CachedNetworkImage(
                  imageUrl: component.imageURL,
                  fit: BoxFit.cover,
                )),
          ),

          //this container contains the details about the component(stock availability and position in the rack)
          Container(
            width: double.infinity,
            margin: const EdgeInsets.fromLTRB(17, 15, 17, 5),
            padding: const EdgeInsets.fromLTRB(20, 15, 20, 2),
            height: MediaQuery.of(context).size.height / 6,
            decoration: BoxDecoration(
              color: const Color(0xff2F2E2E),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total Quantity:",
                      style: GoogleFonts.firaMono(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "${component.totalCount}",
                      style: GoogleFonts.firaMono(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "In Stock",
                      style: GoogleFonts.firaMono(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "${component.available}",
                      style: GoogleFonts.firaMono(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Rack No",
                      style: GoogleFonts.firaMono(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "${component.position[0]}",
                      style: GoogleFonts.firaMono(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Box No:",
                      style: GoogleFonts.firaMono(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "${component.position[1]}",
                      style: GoogleFonts.firaMono(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          // action buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                padding: const EdgeInsets.all(5),
                width: MediaQuery.of(context).size.width / 2.1,
                decoration: BoxDecoration(
                    color: const Color(0xffEE6C4D),
                    borderRadius: BorderRadius.circular(20)),
                child: Text(
                  "Datasheet",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.firaMono(
                    fontSize: 23,
                    color: Colors.white,
                  ),
                ),
              ),
              //0xffA73032
              Container(
                padding: const EdgeInsets.all(5),
                width: MediaQuery.of(context).size.width / 2.5,
                decoration: BoxDecoration(
                    color: const Color(0xffA73032),
                    borderRadius: BorderRadius.circular(20)),
                child: Text(
                  "Report",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.firaMono(
                    fontSize: 23,
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
