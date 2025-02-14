import 'package:flutter/material.dart';

//relative imports
import './screens/home.dart';
import './screens/auth.dart';
// import './screens/component_view.dart';
// import './models/dummy.dart';
// import './models/component.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
