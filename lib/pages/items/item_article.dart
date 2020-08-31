import 'package:flutter/material.dart';
import 'package:flutter_module/model/bean_article.dart';
import 'package:flutter_module/router.dart';
import 'package:flutter_module/util/repo_article.dart';

class ArticleItem extends StatefulWidget {
  final Article _data;

  ArticleItem(this._data, {Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ArticleItemState(_data);
  }
}

class ArticleItemState extends State<ArticleItem> {
  final Article data;

  ArticleItemState(this.data) : super();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
        decoration: BoxDecoration(
          color: Colors.white,
            borderRadius: BorderRadius.circular(4.0),
            boxShadow: [BoxShadow(
                color: Colors.grey[300],
                offset: Offset(0.0,1.0),
                blurRadius: 8
            )
            ]
        ),
        child: InkWell(
          onTap: (){
            AppRouter.open(context, AppRouter.detail, arg: data.link);
          },
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data.chapterName,
                          style: new TextStyle(
                            fontSize: 14,
                            color: Colors.red[400],   // 设置字体颜色为灰色
                          ),),
                        SizedBox(height: 8,),
                        Text(data.title,
                          style: new TextStyle(
                            fontSize: 16,
                            color: Colors.black87,   // 设置字体颜色为灰色
                          ),
                          maxLines: 2,
                          softWrap: true,
                          ),
                        SizedBox(height: 8,),
                        Text(data.niceShareDate,
                        style: new TextStyle(
                          fontSize: 12,
                          color: Colors.grey[500],   // 设置字体颜色为灰色
                        ),)
                      ],
                )),
                SizedBox(height: 16,),
                    IconButton(
                      icon: favorButton(),
                      onPressed: () {
                        setState(() {
                          ArticleRepo.collect(data.id, !data.collect).then((value) {
                            data.collect = !data.collect;
                            Scaffold.of(context).showSnackBar(SnackBar(content: Text('操作成功'),));
                          }, onError: (e){
                            print(e);
                            Scaffold.of(context).showSnackBar(SnackBar(content: Text('未登录'),));
                          });
                        });
                      },
                    )
                  ],
            ))));
  }

  Widget favorButton() {
    return data.collect ? Icon(Icons.favorite,color: Colors.red[400],): Icon(Icons.favorite_border,color: Colors.grey[500],);
  }

}
