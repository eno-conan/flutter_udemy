import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import 'package:loading_animation_widget/loading_animation_widget.dart';

class GoogleBooks extends StatefulWidget {
  const GoogleBooks({Key? key}) : super(key: key);

  @override
  State<GoogleBooks> createState() => _GoogleBooksState();
}

class _GoogleBooksState extends State<GoogleBooks> {
  List items = [];

  Future<void> getData() async {
    var response = await http.get(Uri.https(
        'www.googleapis.com',
        '/books/v1/volumes',
        {'q': '{Flutter}', 'maxResults': '30', 'langRestrict': 'ja'}));

    var jsonResponse = jsonDecode(response.body);

    setState(() {
      items = jsonResponse['items'];
    });
  }

  @override
  void initState() {
    super.initState();

    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Books Page'),
      ),
      body: FutureBuilder(
          future: _wait(3),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return _loadingWidget(50);
            } else {
              return Center(
                child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: Column(
                        children: <Widget>[
                          ListTile(
                            leading: Image.network(
                              items[index]['volumeInfo']['imageLinks']
                                  ['thumbnail'],
                            ),
                            title: Text(items[index]['volumeInfo']['title']),
                            subtitle: Text(
                                items[index]['volumeInfo']['publishedDate']),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              );
            }
          }),
    );
  }
}

Widget _loadingWidget(double size) {
  return Center(
    child: LoadingAnimationWidget.inkDrop(
      color: Colors.blue,
      size: size,
    ),
  );
}

Future _wait(seconds) async {
  return await Future.delayed(Duration(seconds: seconds));
}
