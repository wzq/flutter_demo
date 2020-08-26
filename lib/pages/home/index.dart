import 'package:flutter/material.dart';
import 'package:flutter_module/model/bean_article.dart';
import 'package:flutter_module/pages/items/item_article.dart';
import 'package:flutter_module/util/network.dart';
import 'package:flutter_module/widget/view_swipe.dart';

class IndexPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return IndexPageState();
  }
}

class IndexPageState extends State<IndexPage> {
  Future<List<Article>> fetchData() async {
    return HttpX.get("article/list/0/json")
        .then((value) => ArticleData.fromJson(value.data).articles);
  }

  @override
  Widget build(BuildContext context) {
    return Center(child:
      FutureBuilder<List<Article>>(
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
