// author : Niranjan M (all-coder)
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Relative imports
import '../widgets/filters.dart';
import '../widgets/component_tile.dart';
import '../widgets/appbar.dart';
import '../providers/providers.dart';
import '../widgets/side_drawer.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const List<String> ids = ["1", "2", "3"];
    final componentsAsync = ref.watch(componentsProvider(ids));
    final totalComponentsCount = ref.watch(totalCount);

    return Scaffold(
      drawer: SideDrawer(),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SafeArea(
            child: CustomAppBar(totalCount: totalComponentsCount),
          ),
          const SizedBox(height: 10),
          const Filter(),
          Expanded(
            child: componentsAsync.when(
              data: (components) => GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 256,
                ),
                itemCount: components.length,
                itemBuilder: (context, index) {
                  return SizedBox(
                    height: 250,
                    child: ComponentTile(component: components[index]),
                  );
                },
              ),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (err, stack) => Center(child: Text("Error: $err")),
            ),
          ),
        ],
      ),
    );
  }
}
