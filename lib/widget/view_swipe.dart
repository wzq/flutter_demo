import 'package:flutter/material.dart';
import 'package:flutter_module/model/bean_banner.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class SwipeView extends StatelessWidget {
  final List<BannerItem> data;

  SwipeView({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Swiper(
      autoplay: true,
      itemCount: data.length,
      itemBuilder: (context, index) {
        return Image.network(data[index].imagePath, fit: BoxFit.cover,);
      },
      pagination: SwiperPagination(),
    );
  }
}
