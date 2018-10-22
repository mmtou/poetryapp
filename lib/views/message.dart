import 'package:flutter/material.dart';
import 'chat.dart';

class Message extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MessageState();
  }
}

class _MessageState extends State<Message> {
  var _inited = false;

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
          'id': 1,
          'avatar': 'upload/avatar/default.png',
          'name': '咫尺',
          'lastMsg': '晚安',
          'lastTime': '刚刚'
        },
        {
          'id': 2,
          'avatar': 'upload/avatar/10060.jpg',
          'name': '二狗子',
          'lastMsg': '来 王者',
          'lastTime': '昨天'
        },
        {
          'id': 3,
          'avatar': 'upload/avatar/10067.jpg',
          'name': '足浴店',
          'lastMsg': '约吗',
          'lastTime': '昨天'
        }
      ];
      _inited = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('我的消息'),
      ),
      body: !_inited
          ? CircularProgressIndicator()
          : ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                var item = list[index];
                return Container(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://poetry.mmtou.xyz/${item['avatar']}'),
                    ),
                    title: Text(item['name']),
                    subtitle: Text(item['lastMsg']),
                    trailing: Text(item['lastTime']),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              Chat(item['id'], item['name'])));
                    },
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
    );
  }
}
