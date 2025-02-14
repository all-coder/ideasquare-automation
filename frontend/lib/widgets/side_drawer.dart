import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';

class SideDrawer extends StatelessWidget {
  const SideDrawer({super.key});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
              decoration: const BoxDecoration(
                color: Color(0xff2F2E2E),
              ),
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Row(
                    children: [
                      const SizedBox(
                        width: 18,
                      ),
                    ],
                  )
                ],
              )),
          ListTile(
            leading: const Icon(
              Icons.bubble_chart,
              size: 26,
              color: Color(0xff2F2E2E),
            ),
            title: Text(
              'Add Component',
              style: GoogleFonts.firaMono(
                  fontWeight: FontWeight.w400,
                  fontSize: 25,
                  color: Colors.black),
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.shopping_cart_checkout,
              size: 26,
              color: Color(0xff2F2E2E),
            ),
            title: Text(
              'Checkouts',
              style: GoogleFonts.firaMono(
                  fontWeight: FontWeight.w400,
                  fontSize: 25,
                  color: Colors.black),
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.ios_share_rounded,
              size: 26,
              color: Color(0xff2F2E2E),
            ),
            title: Text(
              'All Issues',
              style: GoogleFonts.firaMono(
                  fontWeight: FontWeight.w400,
                  fontSize: 25,
                  color: Colors.black),
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.request_quote_outlined,
              size: 25,
              color: Color(0xff2F2E2E),
            ),
            title: Text(
              'Requests',
              style: GoogleFonts.firaMono(
                  fontWeight: FontWeight.w400,
                  fontSize: 25,
                  color: Colors.black),
            ),
          ),
          ListTile(
            leading: const Icon(
              Ionicons.settings_sharp,
              size: 25,
              color: Color(0xff2F2E2E),
            ),
            title: Text(
              'Settings',
              style: GoogleFonts.firaMono(
                  fontWeight: FontWeight.w400,
                  fontSize: 25,
                  color: Colors.black),
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.people,
              size: 26,
              color: Color(0xff2F2E2E),
            ),
            title: Text(
              'Authors',
              style: GoogleFonts.firaMono(
                  fontWeight: FontWeight.w400,
                  fontSize: 25,
                  color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
