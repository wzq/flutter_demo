import 'package:flutter/material.dart';
import 'package:flutter_module/model/bean_login.dart';
import 'package:flutter_module/util/network.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatelessWidget {
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('User Login')),
      body: Container(
          margin: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _controller1,
                decoration: InputDecoration(
                    labelText: '账号', border: OutlineInputBorder()),
              ),
              SizedBox(height: 18),
              TextField(
                obscureText: true,
                keyboardType: TextInputType.visiblePassword,
                controller: _controller2,
                decoration: InputDecoration(
                    labelText: '密码', border: OutlineInputBorder()),
              ),
              SizedBox(height: 60),
              RaisedButton(
                onPressed: (){_login(context);},
                child: Text('提交'),
              )
            ],
          )),
    );
  }

  _login(BuildContext context){
    var account = _controller1.text;
    var password = _controller2.text;
    //user/login
    HttpX.post('user/login', queryParameters: {
      'username':account,
      'password':password
    }).then((value){
      if(value.data == null || value.errorCode != 0){
        Fluttertoast.showToast(
            msg: value.errorMsg,
            toastLength: Toast.LENGTH_SHORT,
        );
      } else {
        UserInfo user = UserInfo.fromJson(value.data);
        SharedPreferences.getInstance().then((value){
          value.setInt('user_id', user.id);
        });
        Fluttertoast.showToast(
          msg: "登录成功",
          toastLength: Toast.LENGTH_SHORT,
        );
        Navigator.pop(context);
      }
    });
  }
}
