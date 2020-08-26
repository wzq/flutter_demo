import 'package:flutter_module/util/network.dart';

class ArticleRepo {
  static Future<RespX> collect(int id, bool action) => action
      ? HttpX.get("lg/collect/$id/json")
      : HttpX.get("lg/uncollect_originId/$id/json");
}
