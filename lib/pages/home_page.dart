import 'package:clean_service/config/config.dart';

import 'package:clean_service/model/cat_model.dart';
import 'package:clean_service/model/handel_model.dart';
import 'package:clean_service/service/cat_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    ValueNotifier<ResultModel> result =
        ValueNotifier<ResultModel>(ResultModel());
    return Scaffold(
      appBar: AppBar(),
      body: ValueListenableBuilder(
        valueListenable: result,
        builder: (context, value, child) {
          if (value is ListOf<CatModel>) {
            return ListView.builder(
                itemCount: value.modelList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(value.modelList[index].name),
                    leading: Image.network(value.modelList[index].image),
                  );
                });
          } else if (value is ExceptionModel) {
            return Text(value.messege);
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(onPressed: () async {
        result.value = await core.get<CatServiceImp>().getAllcat();
      }),
    );
  }
}

class TempPage extends StatelessWidget {
 const TempPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(),
            ));
      }),
    );
  }
}
