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

class IndexState extends State<Index> with AutomaticKeepAliveClientMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

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
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('咫尺'),
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
        child: ListView(
          children: <Widget>[
            _username == null
                ? Container(
                    child: Center(
                      child: Column(
                        children: <Widget>[
                          Text(
                            '不积跬步无以至千里，不积小流无以成江海',
                            style: TextStyle(
                              height: 2,
                              color: Colors.white,
                            ),
                          ),
                          OutlineButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed('/login');
                            },
                            child: Text(
                              '立即登录',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                    ),
                    padding: EdgeInsets.only(
                      top: 56.0,
                      bottom: 12.0,
                    ),
                  )
                : UserAccountsDrawerHeader(
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
              trailing: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(50.0),
                  ),
                  color: Colors.red,
                ),
                width: 6.0,
                height: 6.0,
              ),
              onTap: () {
                Navigator.of(context).pushNamed('/message');
              },
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
          ],
          padding: EdgeInsets.only(),
        ),
      ),
    );
  }

  // TODO: implement wantKeepAlive
  @override
  bool get wantKeepAlive => true;
}
