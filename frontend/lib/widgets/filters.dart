// all-coder

import 'package:flutter/material.dart';

class Filter extends StatelessWidget {
  const Filter({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: const Color(0xffD9D2D2)),
      margin: const EdgeInsets.fromLTRB(10, 5, 10, 20),
      child: const Text("*Filters are yet to be decided*"),
    );
  }
}
