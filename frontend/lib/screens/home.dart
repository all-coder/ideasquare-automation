// author : Niranjan M(all-coder)
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
//relative imports
import '../widgets/filters.dart';
import '../widgets/component_tile.dart';
import '../widgets/appbar.dart';
import '../providers/providers.dart';

class Home extends ConsumerWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    // listens for data from the componentsProvider
    final components = ref.watch(componentsProvider);
    return Scaffold(
      // backgroundColor: const Color(0xffF2E9E4),
      backgroundColor: Colors.white,
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
              itemCount: components.length, // Total number of items
              itemBuilder: (context, index) {
                return SizedBox(
                  height: 250,
                  child: ComponentTile(
                    component: components[index],
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
