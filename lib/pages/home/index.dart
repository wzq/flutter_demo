import 'package:flutter/material.dart';
import 'package:flutter_module/model/bean_article.dart';
import 'package:flutter_module/model/bean_banner.dart';
import 'package:flutter_module/pages/items/item_article.dart';
import 'package:flutter_module/util/network.dart';
import 'package:flutter_module/widget/view_sliver_header.dart';
import 'package:flutter_module/widget/view_swipe.dart';

class IndexPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return IndexPageState();
  }
}

class IndexPageState extends State<IndexPage> {

  List<Article> listData;
  void fetchData() {
    HttpX.get("article/list/0/json").then((value) {
      var articles = ArticleData.fromJson(value.data).articles;
      setState(() {
        listData = articles;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPersistentHeader(
            delegate: SliverHeaderView(
          _bindBanner(),
        )),
        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            return ArticleItem(listData[index]);
          }, childCount: listData == null ? 0 : listData.length),
        ),
      ],
    );
  }

  Widget _bindBanner() => FutureBuilder<List<BannerItem>>(
        future: HttpX.dio()
            .get("banner/json")
            .then((value) => BannerData.fromJson(value.data).data),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? SwipeView(
                  data: snapshot.data,
                )
              : Center(child: CircularProgressIndicator());
        },
      );
}
