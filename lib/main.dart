import 'dart:async';
import 'package:flutter/material.dart';
import 'package:work_with_http/widgets/ItemListWidget.dart';
import 'model/posts_model.dart';


void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<List<Data>> futureData;

  @override
  void initState() {
    super.initState();
    futureData = Data().fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black12,
        appBar: AppBar(
          title: Text('Http Example'),
          centerTitle: true,
          backgroundColor: Colors.black,
          actions: [
            IconButton(icon: Icon(Icons.more_vert), onPressed: (){})
          ],
        ),
        body:Center(
          child: FutureBuilder<List<Data>>(
              future: futureData,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ItemListWidgetClass(data: snapshot.data,);
                  // return Text(snapshot.data[0].body);
                } else if (snapshot.hasError) {
                  return Text("error :-- ${snapshot.error}");
                }
                // By default, show a loading spinner.
                return CircularProgressIndicator();
              },
            ),
        ),
      ),
    );
  }
}


