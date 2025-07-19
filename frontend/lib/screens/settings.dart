import 'package:flutter/material.dart';
import 'package:frontend/screens/home.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:settings_ui/settings_ui.dart';

class Settings extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Settingsstate();
  }
}

// class Settingsstate extends State<Settings> {
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Scaffold(
//         appBar: AppBar(
//           iconTheme: IconThemeData(color: Colors.white),
//           title: Text('Settings'),
//           centerTitle: true,
//
//         )
//     );
//   }
//
// }

//To Do - Need Functionality
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
      // body: ListTile(
      //     leading: Icon(Icons.security),
      //     title: Text('Privacy Settings'),
      //     onTap: () {
      //       // Navigate or toggle option
      //     },
      // )
      body: SettingsList(
          sections: [
            SettingsSection(
              title: Text('General'),
              tiles: <SettingsTile>[
                SettingsTile.navigation(
                  leading: Icon(Icons.person),
                  title: Text('Account'),
                  onPressed: (context) {
                    // Navigate or show dialog
                  },
                ),
                SettingsTile.switchTile(
                  onToggle: (value) {
                    // Toggle dark mode or something else
                  },
                  initialValue: true,
                  leading: Icon(Icons.dark_mode),
                  title: Text('Dark Mode'),
                ),
              ],
            ),
            SettingsSection(
              title: Text('Security'),
              tiles: <SettingsTile>[
                SettingsTile.navigation(
                  leading: Icon(Icons.lock),
                  title: Text('Change Password'),
                  onPressed: (context) {
                    // Navigate to change password
                  },
                ),
              ],
            ),
            SettingsSection(
                title: Text('About'),
                tiles: <SettingsTile>[
                  SettingsTile.navigation(
                      title: Text("App Version"),
                      leading: Icon(Icons.lock),
                      onPressed: (context) {
                        //App Version Data
                      },
                  ),
                  SettingsTile.navigation(
                      title: Text('Terms & Privacy Policy'),
                      leading: Icon(Icons.policy),
                      onPressed: (context) {
                        //Terms & Privacy Policy Tab Opens
                      },
                  )
                ]
            )
          ],

      )
    );
  }

}