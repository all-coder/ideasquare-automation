import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// relative imports
// import '../models/dummy.dart';
import '../models/component.dart';
import '../utils/helper.dart';

// read-only provider for components, for now holds the dummy data.
// final componentsProvider = Provider((ref) {
//   return dummyData;
// });
class CachedComponentsNotifier extends StateNotifier<Map<String, List<Component>>> {
  CachedComponentsNotifier() : super({});

  void addToCache(String key, List<Component> components) {
    state = {...state, key: components};  // Ensures immutability
  }

  List<Component>? getFromCache(String key) {
    return state[key];
  }
}

final cachedComponentsProvider = StateNotifierProvider<CachedComponentsNotifier, Map<String, List<Component>>>(
  (ref) => CachedComponentsNotifier(),
);

final componentsProvider = FutureProvider.family<List<Component>, List<String>>((ref, ids) async {
  final cacheNotifier = ref.read(cachedComponentsProvider.notifier);
  final cacheKey = ids.join(',');

  // Return cached result if available
  final cachedData = cacheNotifier.getFromCache(cacheKey);
  if (cachedData != null) return cachedData;

  // Fetch data and update cache
  final fetchedData = await getComponents(ids);
  cacheNotifier.addToCache(cacheKey, fetchedData);

  return fetchedData;
});



class CartNotifier extends Notifier<Map<Component, int>> {
  @override
  Map<Component, int> build() => {}; // Initial state

  void increment(Component component,int count) {
    state = {
      ...state,
      component: state.containsKey(component) ? state[component]! + count : count,
    };
  }

void decrement(Component component) {
  if (state.containsKey(component)) {
    if (state[component]! > 1) {
      state = {...state, component: state[component]! - 1};
    } else {
      // Remove the component if count reaches 0
      final updatedState = Map<Component, int>.from(state);
      updatedState.remove(component);
      state = updatedState;
    }
  }
}

}

final cartNotifier = NotifierProvider<CartNotifier, Map<Component, int>>(() {
  return CartNotifier();
});

final totalCount = Provider<int>((ref) {
  final cartProducts = ref.watch(cartNotifier);
  int total = 0;

  // Summing up the quantities of each component
  cartProducts.forEach((component, count) {
    total += count;
  });

  return total;
});
