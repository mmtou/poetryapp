import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

import '../components/poetryList.dart';
import 'search.dart';

class Index extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return IndexState();
  }
}

class IndexState extends State<Index> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

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
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text('小流'),
          leading: BadgeIconButton(
              itemCount: 1,
              icon: Icon(Icons.menu),
              onPressed: () => _scaffoldKey.currentState.openDrawer()),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              tooltip: 'search',
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Search()));
              },
            ),
          ],
          elevation: 0.0,
        ),
        body: PoetryList(),
        drawer: Drawer(
            child: ListView(children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text("mmtou"),
            accountEmail: Text("不积跬步无以至千里，不积小流无以成江海"),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage("assets/defaultAvatar.png"),
            ),
            onDetailsPressed: () {},
          ),
          ListTile(
            title: Text('我的消息'),
            leading: Icon(Icons.mail_outline),
            onTap: () {},
          ),
          ListTile(
            title: Text('个性换肤'),
            leading: Icon(Icons.color_lens),
            onTap: () {},
          ),
          ListTile(
            title: Text('设置'),
            leading: Icon(Icons.settings),
            onTap: () {},
          ),
          ListTile(
            title: Text('退出'),
            leading: Icon(Icons.power_settings_new),
            onTap: () {},
          )
        ])));
  }
}
