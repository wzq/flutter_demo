import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_module/model/bean_category.dart';
import 'package:flutter_module/pages/router.dart';
import 'package:flutter_module/util/network.dart';
import 'package:flutter_module/widget/view_text.dart';

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<List<Category>>(
        future: HttpX.dio()
            .get("tree/json")
            .then((value) => CategoryData.fromJson(value.data).data),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? bindList(snapshot.data)
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget bindList(List<Category> data) {
    return ListView.separated(
      itemBuilder: (BuildContext context, int index) {
        Category item = data[index];
        var desc = '';
        item.children.forEach((element) {
          desc += "${element.name}    ";
        });
        return InkWell(
            onTap: () {
              AppRouter.open(context, AppRouter.categoryDetail, arg: item);
            },
            child: Container(
              padding: EdgeInsets.all(16),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextView.create(
                    item.name,
                    style: new TextStyle(color: Colors.black87, fontSize: 16),
                    paddingBottom: 8,
                  ),
                  TextView.create(
                    desc,
                    style: new TextStyle(color: Colors.grey[500], fontSize: 14),
                  ),
                ],
              ),
            ));
      },
      itemCount: data.length,
      separatorBuilder: (BuildContext context, int index) {
        return Divider(
          height: 1,
        );
      },
    );
  }
}
