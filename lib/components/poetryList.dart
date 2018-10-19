import 'package:flutter/material.dart';

import '../components/httpClient.dart';
import '../views/detail.dart';
import '../views/user.dart';

class PoetryList extends StatefulWidget {
  final keyword;
  final authorId;

  PoetryList({this.keyword = '', this.authorId});

  @override
  State<StatefulWidget> createState() {
    return _PoetryListState(keyword, authorId);
  }
}

class _PoetryListState extends State<PoetryList> {
  ScrollController _scrollController = ScrollController();
  var _load = false;
  var _inited = false;

  var _list = [];

  var _pageNo = 1;

  var _keyword;
  var _authorId;

  _PoetryListState(this._keyword, this._authorId);

  @override
  void initState() {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _loadMore();
      }
    });

    _init();

    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<Null> _init() async {
    _pageNo = 1;
    var list = await _pull();
    setState(() {
      this._list = list;
      this._inited = true;
    });
  }

  Future<Null> _refresh() async {
    _pageNo = 1;
    var list = await _pull();
    setState(() {
      this._list = list;
    });
  }

  Future<Null> _loadMore() async {
    _pageNo++;
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
    var uri =
        '/api/poetry/list?orderField=1&page.pageNo=${_pageNo}&keyword=${_keyword}';
    if (_authorId != null) {
      uri = '${uri}&authorId=${_authorId}';
    }
    Map response = await HttpClient.get(uri);
    return response['result'];
  }

  @override
  Widget build(BuildContext context) {
    return !_inited
        ? Center(
            child: CircularProgressIndicator(),
          )
        : RefreshIndicator(
            child: ListView.builder(
              itemCount: _list.length + 1,
              itemBuilder: (context, index) {
                if (index == _list.length) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Opacity(
                        opacity: _load ? 1.0 : 0.0,
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  );
                } else {
                  var item = _list[index];
                  var avatar = item['avatar'];

                  return Container(
                    child: ListTile(
                      leading: _authorId != null
                          ? null
                          : GestureDetector(
                              child: CircleAvatar(
                                  backgroundImage: avatar != null
                                      ? Image.network(
                                              'https://poetry.mmtou.xyz${avatar}')
                                          .image
                                      : Image.asset('assets/defaultAvatar.png')
                                          .image,
                                  backgroundColor: Colors.white),
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        User(item['authorId'])));
                              },
                            ),
                      title: Text('${item['title']} [${item['authorName']}]'),
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
              padding: EdgeInsets.only(),
            ),
            onRefresh: _refresh,
          );
  }
}
