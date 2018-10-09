import 'package:flutter/material.dart';
import './detail.dart';
import './user.dart';

import 'package:lpinyin/lpinyin.dart';
import 'package:badges/badges.dart';

class Index extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return IndexState();
  }
}

class IndexState extends State<Index> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  ScrollController _scrollController = new ScrollController();
  var _load = false;

  var _list = [];

  @override
  void initState() {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _loadMore();
      }
    });

    _refresh();

    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<Null> _refresh() async {
    var list = await _pull();
    setState(() {
      this._list = list;
    });
  }

  Future<Null> _loadMore() async {
    if (!_load) {
      setState(() {
        this._load = true;
      });
      var list = await _pull();
      setState(() {
        this._list.addAll(list);
        this._load = false;
      });
    }
  }

  Future<List> _pull() async {
    var list = [
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
        'id': 2,
        'author': '陶渊明',
        'avatar': '',
        'title': '归园田居·其二',
        'content': '种豆南山下，草盛豆苗稀。晨兴理荒秽，带月荷锄归。道狭草木长，夕露沾我衣。衣沾不足惜， 但使愿无违。',
        'tags': [
          {'id': 3, 'name': '东晋'},
          {'id': 2, 'name': '抒情'}
        ]
      },
      {
        'id': 3,
        'author': '李白',
        'avatar': '',
        'title': '春江花月夜',
        'content':
            '春江潮水連海平，海上明月共潮生。灩灩隨波千萬裏，何處春江無月明!江流宛轉繞芳甸，月照花林皆似霰;空裏流霜不覺飛，汀上白沙看不見。江天一色無纖塵，皎皎空中孤月輪。江畔何人初見月？江月何年初照人？人生代代無窮已，江月年年望相似。不知江月待何人，但見長江送流水。白雲一片去悠悠，青楓浦上不勝愁。誰家今夜扁舟子？何處相思明月樓？可憐樓上月徘徊，應照離人妝鏡臺。玉戶簾中卷不去，搗衣砧上拂還來。此時相望不相聞，願逐月華流照君。鴻雁長飛光不度，魚龍潛躍水成文。昨夜閒潭夢落花，可憐春半不還家。江水流春去欲盡，江潭落月復西斜。斜月沉沉藏海霧，碣石瀟湘無限路。不知乘月幾人歸，落月搖情滿江樹。',
        'tags': [
          {'id': 1, 'name': '唐'},
          {'id': 4, 'name': '月'}
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
      {
        'id': 2,
        'author': '陶渊明',
        'avatar': '',
        'title': '归园田居·其二',
        'content': '种豆南山下，草盛豆苗稀。晨兴理荒秽，带月荷锄归。道狭草木长，夕露沾我衣。衣沾不足惜， 但使愿无违。',
        'tags': [
          {'id': 3, 'name': '东晋'},
          {'id': 2, 'name': '抒情'}
        ]
      },
      {
        'id': 3,
        'author': '李白',
        'avatar': '',
        'title': '春江花月夜',
        'content':
            '春江潮水連海平，海上明月共潮生。灩灩隨波千萬裏，何處春江無月明!江流宛轉繞芳甸，月照花林皆似霰;空裏流霜不覺飛，汀上白沙看不見。江天一色無纖塵，皎皎空中孤月輪。江畔何人初見月？江月何年初照人？人生代代無窮已，江月年年望相似。不知江月待何人，但見長江送流水。白雲一片去悠悠，青楓浦上不勝愁。誰家今夜扁舟子？何處相思明月樓？可憐樓上月徘徊，應照離人妝鏡臺。玉戶簾中卷不去，搗衣砧上拂還來。此時相望不相聞，願逐月華流照君。鴻雁長飛光不度，魚龍潛躍水成文。昨夜閒潭夢落花，可憐春半不還家。江水流春去欲盡，江潭落月復西斜。斜月沉沉藏海霧，碣石瀟湘無限路。不知乘月幾人歸，落月搖情滿江樹。',
        'tags': [
          {'id': 1, 'name': '唐'},
          {'id': 4, 'name': '月'}
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
      {
        'id': 2,
        'author': '陶渊明',
        'avatar': '',
        'title': '归园田居·其二',
        'content': '种豆南山下，草盛豆苗稀。晨兴理荒秽，带月荷锄归。道狭草木长，夕露沾我衣。衣沾不足惜， 但使愿无违。',
        'tags': [
          {'id': 3, 'name': '东晋'},
          {'id': 2, 'name': '抒情'}
        ]
      },
      {
        'id': 3,
        'author': '李白',
        'avatar': '',
        'title': '春江花月夜',
        'content':
            '春江潮水連海平，海上明月共潮生。灩灩隨波千萬裏，何處春江無月明!江流宛轉繞芳甸，月照花林皆似霰;空裏流霜不覺飛，汀上白沙看不見。江天一色無纖塵，皎皎空中孤月輪。江畔何人初見月？江月何年初照人？人生代代無窮已，江月年年望相似。不知江月待何人，但見長江送流水。白雲一片去悠悠，青楓浦上不勝愁。誰家今夜扁舟子？何處相思明月樓？可憐樓上月徘徊，應照離人妝鏡臺。玉戶簾中卷不去，搗衣砧上拂還來。此時相望不相聞，願逐月華流照君。鴻雁長飛光不度，魚龍潛躍水成文。昨夜閒潭夢落花，可憐春半不還家。江水流春去欲盡，江潭落月復西斜。斜月沉沉藏海霧，碣石瀟湘無限路。不知乘月幾人歸，落月搖情滿江樹。',
        'tags': [
          {'id': 1, 'name': '唐'},
          {'id': 4, 'name': '月'}
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
      {
        'id': 2,
        'author': '陶渊明',
        'avatar': '',
        'title': '归园田居·其二',
        'content': '种豆南山下，草盛豆苗稀。晨兴理荒秽，带月荷锄归。道狭草木长，夕露沾我衣。衣沾不足惜， 但使愿无违。',
        'tags': [
          {'id': 3, 'name': '东晋'},
          {'id': 2, 'name': '抒情'}
        ]
      },
      {
        'id': 3,
        'author': '李白',
        'avatar': '',
        'title': '春江花月夜',
        'content':
            '春江潮水連海平，海上明月共潮生。灩灩隨波千萬裏，何處春江無月明!江流宛轉繞芳甸，月照花林皆似霰;空裏流霜不覺飛，汀上白沙看不見。江天一色無纖塵，皎皎空中孤月輪。江畔何人初見月？江月何年初照人？人生代代無窮已，江月年年望相似。不知江月待何人，但見長江送流水。白雲一片去悠悠，青楓浦上不勝愁。誰家今夜扁舟子？何處相思明月樓？可憐樓上月徘徊，應照離人妝鏡臺。玉戶簾中卷不去，搗衣砧上拂還來。此時相望不相聞，願逐月華流照君。鴻雁長飛光不度，魚龍潛躍水成文。昨夜閒潭夢落花，可憐春半不還家。江水流春去欲盡，江潭落月復西斜。斜月沉沉藏海霧，碣石瀟湘無限路。不知乘月幾人歸，落月搖情滿江樹。',
        'tags': [
          {'id': 1, 'name': '唐'},
          {'id': 4, 'name': '月'}
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
      {
        'id': 2,
        'author': '陶渊明',
        'avatar': '',
        'title': '归园田居·其二',
        'content': '种豆南山下，草盛豆苗稀。晨兴理荒秽，带月荷锄归。道狭草木长，夕露沾我衣。衣沾不足惜， 但使愿无违。',
        'tags': [
          {'id': 3, 'name': '东晋'},
          {'id': 2, 'name': '抒情'}
        ]
      },
      {
        'id': 3,
        'author': '李白',
        'avatar': '',
        'title': '春江花月夜',
        'content':
            '春江潮水連海平，海上明月共潮生。灩灩隨波千萬裏，何處春江無月明!江流宛轉繞芳甸，月照花林皆似霰;空裏流霜不覺飛，汀上白沙看不見。江天一色無纖塵，皎皎空中孤月輪。江畔何人初見月？江月何年初照人？人生代代無窮已，江月年年望相似。不知江月待何人，但見長江送流水。白雲一片去悠悠，青楓浦上不勝愁。誰家今夜扁舟子？何處相思明月樓？可憐樓上月徘徊，應照離人妝鏡臺。玉戶簾中卷不去，搗衣砧上拂還來。此時相望不相聞，願逐月華流照君。鴻雁長飛光不度，魚龍潛躍水成文。昨夜閒潭夢落花，可憐春半不還家。江水流春去欲盡，江潭落月復西斜。斜月沉沉藏海霧，碣石瀟湘無限路。不知乘月幾人歸，落月搖情滿江樹。',
        'tags': [
          {'id': 1, 'name': '唐'},
          {'id': 4, 'name': '月'}
        ]
      },
    ];

    return Future.delayed(Duration(seconds: 2), () {
      return list;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text('小流'),
          leading: BadgeIconButton(
              itemCount: 1,
              icon: new Icon(Icons.menu),
              onPressed: () => _scaffoldKey.currentState.openDrawer()),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              tooltip: 'search',
              onPressed: () {},
            ),
          ],
          elevation: 0.0,
        ),
        body: RefreshIndicator(
            child: ListView.builder(
              itemCount: _list.length + 1,
              itemBuilder: (context, index) {
                if (index == _list.length) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: new Center(
                      child: new Opacity(
                        opacity: _load ? 1.0 : 0.0,
                        child: new CircularProgressIndicator(),
                      ),
                    ),
                  );
                } else {
                  var item = _list[index];
                  var avatar =
                      'https://www.gushiwen.com/touxiang/${PinyinHelper.convertToPinyinString(item['author'], separator: "", format: PinyinFormat.WITHOUT_TONE)}.jpg';

                  return Container(
                    child: ListTile(
                      leading: GestureDetector(
                        child: CircleAvatar(
//                    backgroundImage: DefaultImage(
//                        image: avatar, placeholder: 'assets/defaultAvatar.png'),
                            backgroundImage: FadeInImage.assetNetwork(
                                    placeholder: 'assets/defaultAvatar.png',
                                    image: avatar)
                                .image,
                            backgroundColor: Colors.white),
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => User(item['id'])));
                        },
                      ),
                      title: Text('${item['title']} [${item['author']}]'),
                      subtitle: Text(
                        item['content'],
                        maxLines: 1,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                      ),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Detail(item['id'])));
                      },
                      onLongPress: () {},
                      dense: true,
                      contentPadding: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
                    ),
                    decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(color: Colors.grey, width: 0.3)),
                    ),
                  );
                }
              },
              controller: _scrollController,
            ),
            onRefresh: _refresh),
        drawer: Drawer(
            child: ListView(children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text("mmtou"),
            accountEmail: Text("mmtouo@gmail.com"),
            currentAccountPicture: new CircleAvatar(
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
