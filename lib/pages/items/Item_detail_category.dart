import 'package:flutter/material.dart';
import 'package:flutter_module/model/bean_article.dart';
import 'package:flutter_module/model/bean_category.dart';
import 'package:flutter_module/util/network.dart';

import 'item_article.dart';

class CategoryTabPage extends StatefulWidget {
  final Category _data;

  CategoryTabPage.create(this._data);

  @override
  _CategoryTabPageState createState() => _CategoryTabPageState.create(_data);
}

class _CategoryTabPageState extends State<CategoryTabPage> {
  Category _data;

  _CategoryTabPageState.create(this._data);

  Future<List<Article>> fetchData() async {
    return HttpX.get("article/list/0/json", queryParameters: {"cid": _data.id})
        .then((value) => ArticleData.fromJson(value.data).articles);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<List<Article>>(
        future: fetchData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? bindList(snapshot.data)
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  ListView bindList(List<Article> listData) => ListView.builder(
      itemCount: listData.length,
      itemBuilder: (BuildContext context, int index) {
        var itemData = listData[index];
        return ArticleItem(itemData);
      });
}
