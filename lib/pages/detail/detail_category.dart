import 'package:flutter/material.dart';
import 'package:flutter_module/model/bean_category.dart';
import 'package:flutter_module/pages/items/Item_detail_category.dart';

class CategoryDetailPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CategoryDetailPageState();
}

class _CategoryDetailPageState extends State<CategoryDetailPage> {
  final pageController = PageController(initialPage: 0);
  final tabController = TabController(length: , vsync: vsync)
  var _currentIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Category params = ModalRoute
        .of(context)
        .settings
        .arguments;
    return DefaultTabController(
        length: params.children.length,
        child: Scaffold(
          appBar: AppBar(
            title: Text(params.name),
            bottom: TabBar(
              controller: ,
              tabs: params.children
                  .map((e) =>
                  Tab(
                    text: e.name,
                  ))
                  .toList(),

              onTap: (index) {
                pageController.jumpTo(index.toDouble());
              },
              isScrollable: true,
            ),
          ),
          body: Center(
            child: PageView.builder(
              controller: pageController,
              itemCount: params.children.length,
              itemBuilder: (BuildContext context, int index) {
                var param = params.children[index];
                return CategoryTabPage.create(param);
              },
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
          ),
        ));
  }

}


