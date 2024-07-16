import 'package:clean_service/model/cat_model.dart';
import 'package:hive/hive.dart';

class StoreService {
  int currentIndex = 0;
  List<CatModel> cacheCats = [];
  Box<CatModel> catBox = Hive.box<CatModel>("storeModel");
  Future<void> store(List<CatModel> cats) async {
    await catBox.clear();
    for (var cat in cats) {
      await catBox.add(cat);
    }
  }

  List<CatModel> get() {
    for (int i = currentIndex; i < currentIndex + 5 && i < catBox.length; i++) {
      cacheCats.add(catBox.getAt(i)!);
    }
    currentIndex += 5;
    if (currentIndex >= catBox.length) {
      currentIndex = 0;
    }
    return cacheCats;
  }
}
