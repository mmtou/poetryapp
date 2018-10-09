import 'package:flutter/material.dart';
import './detail.dart';

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

  _UserState(this._id);

  var _detail;
  var _poetry = [];

  @override
  void initState() {
    _detail = {
      'id': 1,
      'name': '李白',
      'description':
          '李白（701年－762年），字太白，号青莲居士，唐朝浪漫主义诗人，被后人誉为“诗仙”。祖籍陇西成纪(待考)，出生于西域碎叶城，4岁再随父迁至剑南道绵州。李白存世诗文千余篇，有《李太白集》传世。762年病逝，享年61岁。其墓在今安徽当涂，四川江油、湖北安陆有纪念馆。',
      'avatar': 'https://www.gushiwen.com/touxiang/libai.jpg'
    };

    _poetry = [
      {
        'id': 1,
        'author': '李白',
        'avatar': '',
        'title': '黄鹤楼送孟浩然之广陵',
        'content': '故人西辞黄鹤楼，烟花三月下扬州。孤帆远影碧空尽，唯见长江天际流。',
        'tags': [
          {'id': 1, 'name': '唐'},
          {'id': 2, 'name': '抒情'}
        ]
      },
      {
        'id': 1,
        'author': '李白',
        'avatar': '',
        'title': '黄鹤楼送孟浩然之广陵',
        'content': '故人西辞黄鹤楼，烟花三月下扬州。孤帆远影碧空尽，唯见长江天际流。',
        'tags': [
          {'id': 1, 'name': '唐'},
          {'id': 2, 'name': '抒情'}
        ]
      },
    ];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                child: Column(
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage: Image.network(_detail['avatar']).image,
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
                            right: 5.0,
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
                  image: DecorationImage(
                      image: NetworkImage(
                        'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1539081659583&di=5f3da366900d9e5c0229f6d429ac8d46&imgtype=0&src=http%3A%2F%2Fimg.tupianzj.com%2Fuploads%2FBizhi%2Fby6_19201.jpg',
                      ),
                      fit: BoxFit.fill),
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
                        ListView.builder(
                          itemCount: _poetry.length,
                          itemBuilder: (context, index) {
                            var item = _poetry[index];

                            return Container(
                              child: ListTile(
                                title: Text(item['title']),
                                subtitle: Text(
                                  item['content'],
                                  maxLines: 2,
                                  softWrap: true,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          Detail(item['id'])));
                                },
                                onLongPress: () {},
                                dense: true,
                                contentPadding:
                                    EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
                              ),
                              decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: Colors.grey, width: 0.3)),
                              ),
                            );
                          },
                        ),
                        Text('动态'),
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
