// all-coder
import 'package:flutter/material.dart';
//relative imports
import '../widgets/filters.dart';
import '../widgets/component_tile.dart';
import '../widgets/appbar.dart';
import '../models/dummy.dart';

//#######  important comments ########
//this is the root or the home page of the app
//this is stateless widget by default
//where you see sizedBox(), I mainly used them for spacing and relative adjustment of widgets
//never use chatgpt, it always complicates your code.
//use stackoverflow to understand the problem and try adjusting the code on your own.

class Home extends StatelessWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF2E9E4),
      body: Column(
        children: [
          const SafeArea(
            child: CustomAppBar(),
          ),

          const Filter(),
          const SizedBox(
            height: 5,
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 256,
                // childAspectRatio: 0.8,
              ),
              itemCount: dummyData.length, // Total number of items
              itemBuilder: (context, index) {
                return SizedBox(
                  height: 250,
                  child: ComponentTile(
                    component: dummyData[index],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
