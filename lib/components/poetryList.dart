import 'package:flutter/material.dart';

import '../components/httpClient.dart';
import '../views/detail.dart';
import '../views/user.dart';

class PoetryList extends StatefulWidget {
  final keyword;

  PoetryList({this.keyword = ''});

  @override
  State<StatefulWidget> createState() {
    print('aaaaa ${keyword}');
    return _PoetryListState(keyword);
  }
}

class _PoetryListState extends State<PoetryList> {
  ScrollController _scrollController = ScrollController();
  var _load = false;
  var _inited = false;

  var _list = [];

  var _pageNo = 1;

  var _keyword;

  _PoetryListState(this._keyword);

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
    Map response = await HttpClient.get(
        '/api/poetry/list?orderField=1&page.pageNo=${_pageNo}&keyword=${_keyword}');
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
                      leading: GestureDetector(
                        child: CircleAvatar(
                            backgroundImage: avatar != null
                                ? Image.network(avatar).image
                                : Image.asset('assets/defaultAvatar.png').image,
                            backgroundColor: Colors.white),
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => User(item['id'])));
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
            ),
            onRefresh: _refresh,
          );
  }
}
