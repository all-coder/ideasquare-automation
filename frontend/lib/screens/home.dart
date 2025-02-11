// author : Niranjan M(all-coder)
import 'package:flutter/material.dart';
//relative imports
import '../widgets/filters.dart';
import '../widgets/component_tile.dart';
import '../widgets/appbar.dart';
import '../models/dummy.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF2E9E4),
      body: Column(
        children: [
          // custom appbar widget
          const SafeArea(
            child: CustomAppBar(),
          ),
          
          // filter widget
          const Filter(),

          const SizedBox(
            height: 5,
          ),

          // scrollable area, where the individual components are loaded onto the screen
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
