import 'package:flutter/material.dart';
import 'package:flutter_module/model/bean_banner.dart';
import 'package:flutter_module/util/network.dart';
import 'package:flutter_module/widget/view_swipe.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text("search page"),
            pinned: true,
            expandedHeight: 200,
            flexibleSpace:  FlexibleSpaceBar(
              background: FutureBuilder<List<BannerItem>>(
                future: HttpX.dio().get("banner/json").then((value) => BannerData.fromJson(value.data).data),
                builder: (context, snapshot){
                  if (snapshot.hasError) print(snapshot.error);
                  return snapshot.hasData
                      ?  SwipeView(data: snapshot.data,)
                      : Center(child: CircularProgressIndicator());
                },
              ),
            ),
          ),
          SliverList(delegate: SliverChildBuilderDelegate((context, index){
            return Text("1111");
          }, childCount: 200),

          ),
        ],
      ),
    );
  }
}
