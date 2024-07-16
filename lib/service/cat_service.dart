import 'package:clean_service/model/cat_model.dart';
import 'package:clean_service/model/handel_model.dart';
import 'package:clean_service/service/core_service.dart';
import 'package:clean_service/service/store_service.dart';

abstract class CatService extends CoreService {
  Future<ResultModel> getAllcat();
}

class CatServiceImp extends CatService {
  StoreService storeService = StoreService();
  @override
  Future<ResultModel> getAllcat() async {
    try {
      if (storeService.catBox.isNotEmpty) {
        return ListOf(modelList: storeService.get());
      } else {
        response = await dio.get("${baseUrl}cats");
        if (response.statusCode == 200) {
          List<CatModel> store = List.generate(
            response.data.length,
            (index) => CatModel.fromMap(response.data[index]),
          );
          storeService.store(store);
          return ListOf(modelList: storeService.get());
        } else {
          return ErrorModel(massege: 'There Is A Problem');
        }
      }
    } catch (e) {
      return ExceptionModel(messege: e.toString());
    }
  }
}
