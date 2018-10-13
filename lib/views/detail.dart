import 'package:flutter/material.dart';
import './user.dart';
import '../components/httpClient.dart';

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
  var _inited = false;

  _DetailState(this._id);

  var _poetry = {};

  @override
  void initState() {
    _get();

    super.initState();
  }

  Future<Null> _get() async {
    Map response = await HttpClient.get('/api/poetry/${_id}');
    setState(() {
      this._poetry = response['result'];
      _inited = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    var title = _poetry['title'];
    title = title == null ? '详情' : title;

    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: Text(title),
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
        body: !_inited
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView(
                children: <Widget>[
                  Text(
                    title,
                    style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.w500,
                        height: 1.5),
                    textAlign: TextAlign.center,
                  ),
                  GestureDetector(
                    child: Text(
                      _poetry['authorName'],
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
                        fontSize: 16.0,
                        fontWeight: FontWeight.w300,
                        height: 1.5),
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
