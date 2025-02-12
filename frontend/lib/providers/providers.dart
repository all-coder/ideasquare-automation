import 'package:flutter_riverpod/flutter_riverpod.dart';

// relative imports
import '../models/dummy.dart';


final componentsProvider = Provider((ref){
  return dummyData;
});