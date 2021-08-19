import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class MyList extends StatefulWidget {
  const MyList({Key? key}) : super(key: key);

  @override
  _MyListState createState() => _MyListState();
}

class _MyListState extends State<MyList> {

  Widget _buildTask(int index)
  {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.0),
      child: Column(
        children: <Widget>[
      ListTile(
      title: Text('Movie Name'),
      subtitle: Text('Director'),
      ),
          const Divider(
            color: Colors.black,
            thickness: 1,
          ),
        ],

      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
        ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext context, int index){
            if(index == 0)
              {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
                  child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                ),
                );
              }
            return Slidable(
              actionPane: SlidableDrawerActionPane(),
              child: _buildTask(index),
              secondaryActions: <Widget>[
                IconSlideAction(
                  caption: 'Edit',
                  color: Colors.grey,
                  icon: Icons.edit,
                  onTap: (){},
                ),
                IconSlideAction(
                  caption: 'Delete',
                  color: Colors.red,
                  icon: Icons.delete,
                  onTap: (){},
                )

              ],
            );
          },
        )
    );
  }
}
