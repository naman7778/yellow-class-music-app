import 'package:flutter/material.dart';
class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
        GestureDetector(
            onTap: () => Navigator.pop(context),
          child: Icon(Icons.arrow_back_ios, size: 30.0,),
        ),
          SizedBox(height: 20.0,),
          Text("Add Movie", style: TextStyle(color: Colors.black, fontSize: 40.0, fontWeight: FontWeight.bold),),
      ],),
    );
  }
}
