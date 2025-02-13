import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// relative imports
import '../models/dummy.dart';
import '../models/component.dart';

// holds the dummy data
final componentsProvider = Provider((ref) {
  return dummyData;
});

class CartNotifier extends Notifier<Map<Component, int>> {
  @override
  Map<Component, int> build() => {dummyData[0]: 2}; // Initial state

  void addProduct(Component component, int count) {
    state = {
      ...state,
      component:
          state.containsKey(component) ? state[component]! + count : count,
    };
  }
}

final cartNotifier = NotifierProvider<CartNotifier, Map<Component,int>>(() {
  return CartNotifier();
});
