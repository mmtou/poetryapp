import 'package:flutter/material.dart';

import '../components/poetryList.dart';

class Search extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SearchState();
  }
}

class SearchState extends State<Search> {
  final searchController = TextEditingController();

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
      appBar: AppBar(
        title: TextField(
          controller: searchController,
        ),
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            }),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            tooltip: 'search',
            onPressed: () {
              setState(() {
                searchController.text;
              });
            },
          ),
        ],
        elevation: 0.0,
      ),
      body: searchController.text == null || searchController.text == ''
          ? Center(
              child: Text('无数据'),
            )
          : PoetryList(keyword: searchController.text),
    );
  }
}
