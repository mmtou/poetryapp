import 'package:flutter/material.dart';

class Chat extends StatefulWidget {
  final _id;
  final _name;

  Chat(this._id, this._name);

  @override
  State<StatefulWidget> createState() {
    return _ChatState(_id, _name);
  }
}

class _ChatState extends State<Chat> {
  var _inited = false;
  var id;
  var name;

  _ChatState(this.id, this.name);

  var list = [];

  @override
  void initState() {
    get();

    super.initState();
  }

  Future<Null> get() async {
    setState(() {
      list = [
        {
          'avatar': 'upload/avatar/10060.jpg',
          'name': '二狗子',
          'message': '来 王者',
          'time': '昨天',
          'owner': false
        },
        {
          'avatar': 'upload/avatar/10060.jpg',
          'name': '足浴店',
          'message': '约吗',
          'time': '昨天',
          'owner': false
        },
        {
          'avatar': 'upload/avatar/default.png',
          'name': '咫尺',
          'message': '晚安',
          'time': '刚刚',
          'owner': true
        }
      ];
      _inited = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: !_inited
          ? CircularProgressIndicator()
          : ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                var item = list[index];
                return Container(
                  child: item['owner']
                      ? ListTile(
                          title: Container(
                            child: Text(
                              item['message'],
                              textAlign: TextAlign.right,
                              style: TextStyle(
//                                color: Colors.white,
                                  ),
                            ),
                            decoration: BoxDecoration(
//                              color: Colors.lime,
                              borderRadius: BorderRadius.all(
                                Radius.circular(
                                  4.0,
                                ),
                              ),
                            ),
                            padding: EdgeInsets.all(
                              12.0,
                            ),
                          ),
                          trailing: CircleAvatar(
                            backgroundImage: NetworkImage(
                                'https://poetry.mmtou.xyz/${item['avatar']}'),
                          ),
                        )
                      : ListTile(
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(
                                'https://poetry.mmtou.xyz/${item['avatar']}'),
                          ),
                          title: Container(
                            child: Text(item['message']),
                            decoration: BoxDecoration(
//                              color: Colors.black12,
                              borderRadius: BorderRadius.all(
                                Radius.circular(
                                  4.0,
                                ),
                              ),
                            ),
                            padding: EdgeInsets.all(
                              12.0,
                            ),
                          ),
                        ),
                  margin: EdgeInsets.only(
                    top: 12.0,
                  ),
                );
              },
              padding: EdgeInsets.only(),
            ),
      bottomNavigationBar: Container(
        child: TextField(
          decoration: InputDecoration(
            suffixIcon: IconButton(
              icon: Icon(
                Icons.tag_faces,
              ),
              onPressed: () {},
            ),
            contentPadding: EdgeInsets.all(12.0),
          ),
          maxLines: 1,
        ),
        decoration: BoxDecoration(
            border: Border.all(
          width: 0.3,
        )),
        padding: EdgeInsets.only(top: 0.3),
      ),
    );
  }
}
