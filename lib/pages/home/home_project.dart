import 'package:flutter/material.dart';
import 'package:flutter_module/model/bean_article.dart';
import 'package:flutter_module/pages/items/item_project.dart';
import 'package:flutter_module/util/network.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ProjectPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ProjectPageState();
  }
}

class ProjectPageState extends State<ProjectPage> {

  _getProjects() => HttpX.get('article/listproject/0/json')
      .then((value) => ArticleData.fromJson(value.data).articles);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Article>>(
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? _buildList(snapshot.data)
              : Center(child: CircularProgressIndicator());
        },
        future: _getProjects());
  }

  Widget _buildList(List<Article> data) {
    return StaggeredGridView.countBuilder(
      padding: EdgeInsets.all(8),
      crossAxisCount: 2,
      mainAxisSpacing: 8,
      crossAxisSpacing: 8,
      itemBuilder: (BuildContext context, int index) {
        return ProjectItem.create(data[index]);
      },
      staggeredTileBuilder: (int index) =>
          StaggeredTile.fit(1),
      itemCount: data.length,
    );
  }
}
