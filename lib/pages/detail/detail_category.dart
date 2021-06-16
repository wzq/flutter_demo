import 'package:flutter/material.dart';
import 'package:flutter_module/model/bean_category.dart';
import 'package:flutter_module/pages/items/Item_detail_category.dart';

class CategoryDetailPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CategoryDetailPageState();
}

class _CategoryDetailPageState extends State<CategoryDetailPage>
    with SingleTickerProviderStateMixin {
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Category params = ModalRoute.of(context).settings.arguments;
    return DefaultTabController(
      length: params.children.length,
      child: Builder(
        builder: (BuildContext context) {
          final TabController tabController = DefaultTabController.of(context);
          return Scaffold(
            appBar: AppBar(
              title: Text(params.name),
              bottom: TabBar(
                tabs: params.children
                    .map((e) => Tab(
                          text: e.name,
                        ))
                    .toList(),
                onTap: (index) {
                  _pageController.animateToPage(index,
                      duration: Duration(milliseconds: 300),
                      curve: Curves.ease);
                },
                isScrollable: true,
              ),
            ),
            body: Center(
              child: PageView.builder(
                controller: _pageController,
                itemCount: params.children.length,
                itemBuilder: (BuildContext context, int index) {
                  var param = params.children[index];
                  return CategoryTabPage.create(param);
                },
                onPageChanged: (index) {
                  tabController.animateTo(index);
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
