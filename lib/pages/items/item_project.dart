import 'package:flutter/material.dart';
import 'package:flutter_module/model/bean_article.dart';
import 'package:flutter_module/pages/router.dart';
import 'package:flutter_module/widget/view_text.dart';

class ProjectItem extends StatelessWidget {
  ProjectItem.create(this._article);

  final Article _article;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: (){
          AppRouter.open(context, AppRouter.detail, arg: _article.link);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 3 / 4,
              child: Image.network(
                _article.envelopePic,
                fit: BoxFit.fitWidth,
              ),
            ),
            TextView.create(
              _article.title,
              style: TextStyle(color: Colors.black87, fontSize: 14),
              maxLines: 1,
              paddingStart: 8,
              paddingEnd: 8,
              paddingTop: 8,
            ),
            TextView.create(
              _article.desc,
              style: TextStyle(color: Colors.grey[700], fontSize: 12),
              maxLines: 3,
              paddingStart: 8,
              paddingEnd: 8,
              paddingTop: 8,
            ),
            TextView.create(
              _article.niceDate,
              style: TextStyle(color: Colors.grey[500], fontSize: 12),
              maxLines: 1,
              padding: EdgeInsets.all(8),
            ),
          ],
        ),
      ),
    );
  }
}
