import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: '2022 Memories'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  late Response response;
  Dio dio = Dio();
  bool loading = false; //for data featching status
  var apidata; //for decoded JSON data

  void _incrementCounter() {
    getData();
    setState(() {
      _counter++;
    });
  }

// https://www.fluttercampus.com/guide/235/fetch-data-from-rest-api/
  getData() async {
    setState(() {
      loading = true; //make loading true to show progressindicator
    });
    //   String url = "http://localhost:3000/";
    //   Response response = await dio.get(url);
    //   apidata = response.data; //get JSON decoded data from response
    //   print(apidata); //printing the JSON recieved
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Link(
              // 開きたいWebページのURLを指定
              uri: Uri.parse('https://flutter.dev'),
              // targetについては後述
              target: LinkTarget.blank,
              builder: (BuildContext ctx, FollowLink? openLink) {
                return TextButton(
                  onPressed: openLink,
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(EdgeInsets.zero),
                    // minimumSize:
                    //     MaterialStateProperty.all(Size.zero),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: const Text(
                    'flutter公式サイト',
                    style: TextStyle(fontSize: 12),
                  ),
                );
              },
            ),
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            SizedBox(
              // https://www.choge-blog.com/programming/flutterdatatable-fulwidth/
              width: double.infinity,
              child: DataTable(
                columns: const [
                  DataColumn(
                    label: Text('名前'),
                  ),
                  DataColumn(
                    label: Text('年齢'),
                  ),
                  DataColumn(
                    label: Text('性別'),
                  ),
                ],
                rows: [
                  for (var i = 0; i < 3; i++)
                    DataRow(
                      cells: [
                        DataCell(Text('${10 - i}郎')),
                        DataCell(Text('$i')),
                        DataCell(Text(i.isOdd ? '男' : '女')),
                      ],
                    ),
                ],
              ),
            ),
            // Table(
            //   border: TableBorder.all(color: Colors.grey),
            //   // columnWidths: const <int, TableColumnWidth>{
            //   //   0: IntrinsicColumnWidth(),
            //   //   1: FlexColumnWidth(0.4),
            //   //   2: FixedColumnWidth(80.0),
            //   // },
            //   children: <TableRow>[
            //     TableRow(
            //         decoration: BoxDecoration(
            //           color: Colors.grey.shade400,
            //         ),
            //         children: ['title1', 'title2', 'title3']
            //             .map((e) => Container(
            //                 alignment: Alignment.center,
            //                 margin: const EdgeInsets.only(top: 5, bottom: 5),
            //                 child: Text(e)))
            //             .toList()),
            //     TableRow(
            //       children: ['abc', '123', 'lmn']
            //           .map((e) => Container(
            //               alignment: Alignment.center,
            //               margin: const EdgeInsets.only(top: 5, bottom: 5),
            //               child: Text(e)))
            //           .toList(),
            //     ),
            //   ],
            // ),
            // Column(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Image.asset(
            //       'assets/images/ritsurinpark.jpg',
            //       scale: 24,
            //     ),
            //     Image.asset(
            //       'assets/images/ritsurinpark.jpg',
            //       scale: 24,
            //     ),
            //   ],
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  'assets/images/ritsurinpark.jpg',
                  fit: BoxFit.cover,
                  scale: 24,
                ),
                Image.asset(
                  'assets/images/ritsurinpark.jpg',
                  fit: BoxFit.cover,
                  scale: 24,
                ),
                Image.asset(
                  'assets/images/ritsurinpark.jpg',
                  fit: BoxFit.cover,
                  scale: 24,
                ),
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
