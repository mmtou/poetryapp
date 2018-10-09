import 'package:flutter/material.dart';
import './user.dart';

import 'package:share/share.dart';

class Detail extends StatefulWidget {
  final _id;

  Detail(this._id);

  @override
  State<StatefulWidget> createState() {
    return _DetailState(_id);
  }
}

class _DetailState extends State<Detail> {
  var _id;

  _DetailState(this._id);

  var _poetry;

  @override
  void initState() {
    _poetry = {
      'id': 3,
      'authorId': 1,
      'author': '张若虚',
      'avatar': '',
      'title': '春江花月夜',
      'content':
          '春江潮水連海平，海上明月共潮生。\n灩灩隨波千萬裏，何處春江無月明！\n江流宛轉繞芳甸，月照花林皆似霰；\n空裏流霜不覺飛，汀上白沙看不見。\n江天一色無纖塵，皎皎空中孤月輪。\n江畔何人初見月？江月何年初照人？\n人生代代無窮已，江月年年望相似。\n不知江月待何人，但見長江送流水。\n白雲一片去悠悠，青楓浦上不勝愁。\n誰家今夜扁舟子？何處相思明月樓？\n可憐樓上月徘徊，應照離人妝鏡臺。\n玉戶簾中卷不去，搗衣砧上拂還來。\n此時相望不相聞，願逐月華流照君。\n鴻雁長飛光不度，魚龍潛躍水成文。\n昨夜閒潭夢落花，可憐春半不還家。\n江水流春去欲盡，江潭落月復西斜。\n斜月沉沉藏海霧，碣石瀟湘無限路。\n不知乘月幾人歸，落月搖情滿江樹。',
      'tags': [
        {'id': 1, 'name': '唐'},
        {'id': 4, 'name': '月'}
      ]
    };

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: Text(_poetry['title']),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.share),
              onPressed: () {
                Share.share(_poetry['content']);
              },
            ),
          ],
          elevation: 0.0,
        ),
        body: ListView(
          children: <Widget>[
            Text(
              _poetry['title'],
              style: TextStyle(
                  fontSize: 24.0, fontWeight: FontWeight.w500, height: 1.5),
              textAlign: TextAlign.center,
            ),
            GestureDetector(
              child: Text(
                _poetry['author'],
                style: TextStyle(fontSize: 16.0, height: 0.5),
                textAlign: TextAlign.right,
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => User(_poetry['authorId'])));
              },
            ),
            Text(
              _poetry['content'],
              style: TextStyle(
                  fontSize: 16.0, fontWeight: FontWeight.w300, height: 1.5),
              textAlign: TextAlign.center,
              softWrap: true,
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 24.0),
            ),
          ],
          padding: EdgeInsets.fromLTRB(12.0, 0.0, 12.0, 0.0),
        ));
  }
}
