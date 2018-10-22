import 'package:flutter/material.dart';
import './detail.dart';
import '../components/httpClient.dart';
import '../components/poetryList.dart';

import 'package:share/share.dart';

class User extends StatefulWidget {
  final _id;

  User(this._id);

  @override
  State<StatefulWidget> createState() {
    return _UserState(_id);
  }
}

class _UserState extends State<User> {
  var _id;

  var _inited = false;

  _UserState(this._id);

  var _detail = {};

  var _dynamics = [];

  @override
  void initState() {
    _get();
    _getDynamics();

    super.initState();
  }

  Future<Null> _get() async {
    Map response = await HttpClient.get('/api/user/${_id}');
    setState(() {
      this._detail = response['result'];
      _inited = true;
    });
  }

  Future<Null> _getDynamics() async {
    setState(() {
      this._dynamics = [
        {'time': '昨天', 'content': '安得广厦千万间，大庇天下寒士俱欢颜。'},
        {'time': '昨天', 'content': '安得广厦千万间，大庇天下寒士俱欢颜。'},
        {'time': '昨天', 'content': '安得广厦千万间，大庇天下寒士俱欢颜。'},
        {'time': '昨天', 'content': '安得广厦千万间，大庇天下寒士俱欢颜。'},
        {'time': '昨天', 'content': '安得广厦千万间，大庇天下寒士俱欢颜。'},
      ];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: !_inited
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      child: Column(
                        children: <Widget>[
                          CircleAvatar(
                            backgroundImage: Image.network(
                                    'https://poetry.mmtou.xyz/${_detail['avatar']}')
                                .image,
                            radius: 36.0,
                          ),
                          Padding(padding: EdgeInsets.only(bottom: 12.0)),
                          Text(
                            _detail['name'],
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 18.0,
                            ),
                          ),
                          Text(
                            '粉丝11.7万',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 12.0,
                            ),
                          ),
                          Row(
                            children: <Widget>[
                              Transform(
                                transform: Matrix4.identity()..scale(0.8),
                                child: Chip(
                                  label: Text(
                                    '唐代',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  backgroundColor: Colors.grey,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  right: 3.0,
                                ),
                              ),
                              Transform(
                                transform: Matrix4.identity()..scale(0.8),
                                child: Chip(
                                  label: Text(
                                    '诗仙',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  backgroundColor: Colors.grey,
                                ),
                              ),
                            ],
                            crossAxisAlignment: CrossAxisAlignment.end,
                          )
                        ],
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                      ),
                      decoration: BoxDecoration(
//                        image: DecorationImage(
//                            image: NetworkImage(
//                              'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1539081659583&di=5f3da366900d9e5c0229f6d429ac8d46&imgtype=0&src=http%3A%2F%2Fimg.tupianzj.com%2Fuploads%2FBizhi%2Fby6_19201.jpg',
//                            ),
//                            fit: BoxFit.fill),
                        color: Theme.of(context).primaryColor,
                      ),
                      height: 270.0,
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.fromLTRB(12.0, 0.0, 12.0, 0.0),
                    ),
                    Positioned(
                      left: 0.0,
                      top: 40.0,
                      child: IconButton(
                        icon: Icon(Icons.arrow_back),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                    Positioned(
                      right: 0.0,
                      top: 40.0,
                      child: IconButton(
                        icon: Icon(Icons.share),
                        onPressed: () {
                          Share.share(_detail['description']);
                        },
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Container(
                    child: DefaultTabController(
                      length: 3,
                      child: Column(
                        children: <Widget>[
                          TabBar(
                            tabs: [
                              Text('作品'),
                              Text('动态'),
                              Text('关于'),
                            ],
                            labelStyle: TextStyle(height: 2.0),
                            labelColor: Colors.red,
                            indicatorColor: Colors.red,
                            unselectedLabelColor: Colors.grey,
                            indicatorSize: TabBarIndicatorSize.label,
                          ),
                          Divider(),
                          Expanded(
                            child: TabBarView(children: [
                              PoetryList(
                                authorId: _id,
                              ),
                              ListView.builder(
                                itemCount: _dynamics.length,
                                itemBuilder: (context, index) {
                                  var dynamic = _dynamics[index];
                                  return Container(
                                    child: ListTile(
                                      leading: CircleAvatar(
                                        backgroundImage: NetworkImage(
                                            'https://poetry.mmtou.xyz/${_detail['avatar']}'),
                                      ),
                                      title: Text(_detail['name']),
                                      subtitle: Text(dynamic['content']),
                                    ),
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          color: Colors.grey,
                                          width: 0.3,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                padding: EdgeInsets.only(),
                              ),
                              Container(
                                child: Text(
                                  _detail['description'],
                                  style: TextStyle(height: 1.3),
                                ),
                                padding: EdgeInsets.all(12.0),
                              ),
                            ]),
                          ),
                        ],
                      ),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.horizontal(
                            left: Radius.circular(12.0),
                            right: Radius.circular(12.0))),
                  ),
                )
              ],
            ),
    );
  }
}
