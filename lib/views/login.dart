import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginState();
  }
}

class _LoginState extends State<Login> {
  var _username;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('登录'),
        actions: <Widget>[
          FlatButton(
            onPressed: () {},
            child: Text(
              '注册',
              style:
                  TextStyle(color: Theme.of(context).scaffoldBackgroundColor),
            ),
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            child: TextField(
              decoration: InputDecoration(
//                  labelText: '手机号',
                hintText: '请输入手机号',
                prefixIcon: Icon(Icons.phone_android),
              ),
              keyboardType: TextInputType.phone,
            ),
            padding: EdgeInsets.fromLTRB(24.0, 56.0, 24.0, 0.0),
          ),
          Container(
            child: TextField(
              decoration: InputDecoration(
//                  labelText: '手机号',
                  hintText: '请输入密码',
                  prefixIcon: Icon(Icons.lock_outline),
                  suffixIcon: IconButton(
                      icon: Icon(Icons.remove_red_eye), onPressed: () {})),
              keyboardType: TextInputType.number,
            ),
            padding: EdgeInsets.fromLTRB(24.0, 28.0, 24.0, 0.0),
          ),
          Container(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/index');
                    },
                    child: Text(
                      '登录',
                      style: TextStyle(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        fontSize: 16.0,
                      ),
                    ),
                    color: Theme.of(context).primaryColor,
                    padding: EdgeInsets.fromLTRB(0.0, 12.0, 0.0, 12.0),
                  ),
                ),
              ],
            ),
            padding: EdgeInsets.fromLTRB(24.0, 28.0, 24.0, 0.0),
          ),
        ],
      ),
    );
  }
}
