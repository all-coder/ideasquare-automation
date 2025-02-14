// necessary imports
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';

// relative imports
import '../screens/checkout.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({required this.totalCount,super.key});
  final int totalCount;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Row(
        children: [
          // side drawer menu button
          Container(
            margin: const EdgeInsets.only(right: 5),
            height: 50,
            width: 50,
            padding: const EdgeInsets.fromLTRB(10, 10, 14, 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: const Color(0xff2F2E2E),
            ),
            child: const Icon(
              Ionicons.menu_outline,
              color: Colors.white,
              size: 30,
            ),
          ),

          // search textfield
          Container(
            margin: const EdgeInsets.only(right: 3),
            width: MediaQuery.of(context).size.width / 1.5,
            child: TextField(
              textAlign: TextAlign.center,
              style: GoogleFonts.ubuntuMono(
                color: Colors.white,
                fontSize: 25,
              ),
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Ionicons.search_outline,
                  color: Colors.white,
                  size: 25,
                ),
                hintText: "search",
                hintStyle: GoogleFonts.ubuntuMono(
                  color: const Color(0xffced4da),
                  fontSize: 25,
                ),
                filled: true,
                fillColor: const Color(0xff2F2E2E),
                contentPadding: const EdgeInsets.fromLTRB(0, 0, 55, 0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          // component cart button
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: const Color(0xff2F2E2E),
            ),
            child: Stack(
              children: [
                Positioned(
                  left: 8,
                  top: 8,
                  child: GestureDetector(
                    onTap: () => {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (ctx) => CheckoutView(),
                        ),
                      ),
                    },
                    child: Icon(
                      Ionicons.cart_outline,
                      color: Colors.white,
                      size: 33,
                    ),
                  ),
                ),
                Positioned(
                  top: 30,
                  right: 1,
                  child: Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: const Color(0xffE25353)),
                    child: Text(
                      "$totalCount", // counter button
                      style: GoogleFonts.firaMono(
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
