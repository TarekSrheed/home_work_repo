// ignore_for_file: public_member_api_docs, sort_constructors_first

class ResultModel {}

class ErrorModel extends ResultModel {
  String massege;
  ErrorModel({
    required this.massege,
  });
}

class ExceptionModel extends ResultModel {
  String messege;
  ExceptionModel({
    required this.messege,
  });
}

class StoreModel extends ResultModel {
  Map modelMap;
  StoreModel({
    required this.modelMap,
  });
}

class ListOf<T> extends ResultModel {
  List<T> modelList;
  ListOf({
    required this.modelList,
  });
}
