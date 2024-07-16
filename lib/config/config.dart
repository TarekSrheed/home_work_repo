import 'package:clean_service/service/cat_service.dart';
import 'package:get_it/get_it.dart';

GetIt core = GetIt.instance;

init() {
  core.registerSingleton(CatServiceImp());
}
