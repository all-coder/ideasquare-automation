// necessary imports
import 'package:flutter_riverpod/flutter_riverpod.dart';

//relative imports
import '../models/component.dart';
import '../utils/helper.dart';

// poor implementation of cached items, could use sqlflite.
class CachedComponentsNotifier
    extends StateNotifier<Map<String, List<Component>>> {
  CachedComponentsNotifier() : super({});
  // so basically looks like this ["1","2","3"] : [<Component>,<Component>]
  void addToCache(String key, List<Component> components) {
    state = {...state, key: components};
  }

  List<Component>? getFromCache(String key) {
    return state[key];
  }
}

// reading from the CachedComponentsProvider
final cachedComponentsProvider = StateNotifierProvider<CachedComponentsNotifier,
    Map<String, List<Component>>>(
  (ref) => CachedComponentsNotifier(),
);

// doesn't handle partial caching. will have to implement that
final componentsProvider =
    FutureProvider.family<List<Component>, List<String>>((ref, ids) async {
  final cacheNotifier = ref.read(cachedComponentsProvider.notifier);
  final cacheKey = ids.join(','); // joinin them to use a single map key.

  final cachedData = cacheNotifier.getFromCache(cacheKey);
  if (cachedData != null) return cachedData;
  //if present in cached data return it, otherwise, go for an api call.

  final fetchedData = await getComponents(ids);
  cacheNotifier.addToCache(cacheKey, fetchedData);

  return fetchedData;
});

class CartNotifier extends Notifier<Map<Component, int>> {
  @override
  Map<Component, int> build() => {}; // Initial state

  void increment(Component component, int count) {
    state = {
      ...state,
      component:
          state.containsKey(component) ? state[component]! + count : count,
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
