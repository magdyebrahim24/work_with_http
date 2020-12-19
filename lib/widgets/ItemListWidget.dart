import 'package:flutter/material.dart';
import '../model/posts_model.dart';

class ItemListWidgetClass extends StatelessWidget {
  // list of object of Class[Data] to pass in constructure
  final List<Data> data;
  ItemListWidgetClass({this.data});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            title: Text(data[index].name,
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: Text(data[index].email),
            trailing: Text('id: ${data[index].id.toString()}'),
            leading: CircleAvatar(
              child: Text(
                '${index+1}',
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.black,
            ),
          ),
        );
      },
    );
  }
}