// necessary imports
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// relative imports
import '../providers/providers.dart';
import '../models/component.dart';

// writing the checkoutTile as a separate widget
Widget checkoutTile(Component component, int count) {
  return Material(
    elevation: 20,
    child: Container(
      padding: EdgeInsets.fromLTRB(7, 0, 7, 0),
      width: double.infinity,
      height: 80,
      decoration: BoxDecoration(color: const Color(0xffFFFFFF)),
      child: Stack(
        children: [
          Positioned(
            top: 14,
            child: Text(
              component.name,
              style: GoogleFonts.firaMono(
                fontWeight: FontWeight.w500,
                fontSize: 22,
                color: Colors.black,
              ),
            ),
          ),
          Positioned(
            top: 45,
            child: Text(
              "Rack No:${component.position[0]}",
              style: GoogleFonts.firaMono(
                  fontSize: 17, color: const Color(0xff827D7D)),
            ),
          ),
          Positioned(
            top: 45,
            left: 115,
            child: Text(
              "Box No:${component.position[1]}",
              style: GoogleFonts.firaMono(
                fontSize: 17,
                color: const Color(0xff827D7D),
              ),
            ),
          ),
          Positioned(
            right: 8,
            top: 24,
            child: Row(
              children: [
                Container(
                  height: 35,
                  width: 35,
                  color: const Color(0xffBFBABA),
                  child: GestureDetector(
                    child: Icon(Ionicons.remove_sharp),
                  ),
                ),
                Container(
                  height: 35,
                  width: 35,
                  color: const Color(0xffD9D9D9),
                  child: Center(
                    // Centering the text
                    child: Text(
                      "$count",
                      style: GoogleFonts.firaMono(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 35,
                  width: 35,
                  color: const Color(0xffBFBABA),
                  child: GestureDetector(
                    child: Icon(Ionicons.add_sharp),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

class CheckoutView extends ConsumerStatefulWidget {
  const CheckoutView({super.key});
  @override
  ConsumerState<CheckoutView> createState() {
    return _CheckoutViewState();
  }
}

class _CheckoutViewState extends ConsumerState<CheckoutView> {
  @override
  Widget build(BuildContext context) {
    final checkoutWidgets = ref.watch(cartNotifier);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: const Color(0xff2F2E2E),
        centerTitle: true,
        title: Text(
          "Checkout",
          style: GoogleFonts.firaMono(
            fontWeight: FontWeight.w500,
            color: const Color(0xffced4da),
            fontSize: 30,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(10, 10, 10, 8),
            padding: EdgeInsets.only(top: 20, bottom: 20),
            height: 300,
            width: double.infinity,
            child: Column(
              children: checkoutWidgets.entries
                  .map((entry) => checkoutTile(entry.key, entry.value))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
