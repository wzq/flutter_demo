import 'package:flutter/material.dart';
import 'package:flutter_module/model/bean_article.dart';
import 'package:flutter_module/model/bean_category.dart';
import 'package:flutter_module/pages/items/item_article.dart';
import 'package:flutter_module/util/network.dart';

class CategoryDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Category params = ModalRoute.of(context).settings.arguments;
    return DefaultTabController(
        length: params.children.length,
        child: Scaffold(
          appBar: AppBar(
            title: Text(params.name),
            bottom: TabBar(
              tabs: params.children
                  .map((e) => Tab(
                        text: e.name,
                      ))
                  .toList(),
              isScrollable: true,
            ),
          ),
          body: TabBarView(children: params.children.map((e) => _TabPage.create(e),).toList() ,
        )));
  }
}

class _TabPage extends StatefulWidget {
  final Category _data;

  _TabPage.create(this._data);

  @override
  _TabPageState createState() => _TabPageState.create(_data);
}

class _TabPageState extends State<_TabPage> {
  Category _data;

  _TabPageState.create(this._data);

  Future<List<Article>> fetchData() async {
    return HttpX.get("article/list/0/json", queryParameters: {"cid": _data.id}).then((value) => ArticleData.fromJson(value.data).articles);
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
