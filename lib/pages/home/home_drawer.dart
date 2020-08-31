import 'package:flutter/material.dart';
import 'package:flutter_module/pages/login.dart';

class HomeDrawerPage extends StatefulWidget {
  @override
  _HomeDrawerPageState createState() => _HomeDrawerPageState();
}

class _HomeDrawerPageState extends State<HomeDrawerPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(padding: EdgeInsets.zero, children: <Widget>[
      DrawerHeader(
        decoration: BoxDecoration(color: Colors.blue),
        child: Center(
          child: FlutterLogo(
            size: 45,
          ),
        ),
      ),
      ListTile(title: Text('用户登录'), leading: Icon(Icons.account_circle), onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
          return Login();
        }));
      }),
      ListTile(title: Text("每日一问"), onTap: () {}),
      ListTile(
        title: Text("收藏文章"),
      ),
      ListTile(
        title: Text("关于APP"),
      ),
    ]);
  }
}
