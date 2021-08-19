import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:music_app/add_task_screen.dart';
import 'package:music_app/google_controler_login.dart';
import 'package:provider/provider.dart';
import 'my_list.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text("Yellow Class music",
        style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
      ),
      body: loginUI(),
    );
  }

  loginUI(){
    return Consumer<GoogleSignInControler>(
      builder: (context, model, child){
        if(model.googleAccount != null){
          return Center(child: loggedUI(model),);
        }
        else{
          return loginControls(context);
        }
      },
    );
  }

  loggedUI(GoogleSignInControler model) {
    String name = model.googleAccount!.displayName ?? "";
    return Scaffold(
      appBar: AppBar(
        title: Text(name.substring(0,name.indexOf(" ")) + "'s Music",),
        backgroundColor: Colors.black,
        actions: [
          ActionChip(
            avatar: CircleAvatar(
              backgroundImage: Image.network(model.googleAccount!.photoUrl ?? '').image,
              radius: 20,
            ),
            label: Text("Logout"),
            onPressed: (){
              Provider.of<GoogleSignInControler>(context, listen: false).logout();
            },
          ),
        ],

      ),
      body: MyList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => AddTaskScreen())),
        child: Icon(Icons.add),
        backgroundColor: Colors.grey,
      ),
    );
    /*return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundImage: Image.network(model.googleAccount!.photoUrl ?? '').image,
          radius: 50,
        ),
        Text(model.googleAccount!.displayName ?? ''),
        Text(model.googleAccount!.email),
        ActionChip(
          avatar: Icon(Icons.logout),
          label: Text("Logout"),
          onPressed: (){
            Provider.of<GoogleSignInControler>(context, listen: false).logout();
          },
        )
      ],
    );*/
  }

  loginControls(BuildContext context) {
    return Center(
       child:
       Column(
         //mainAxisAlignment: MainAxisAlignment.center,
         crossAxisAlignment: CrossAxisAlignment.center,
         children: [
           SizedBox(height: 100,),
           Text("Login",
           style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,),
           ),
           SizedBox(height: 200,),
           GestureDetector(
            child:
            Image.asset(
              "assets/images/google.png",
              width: 250,
            ),
            onTap: (){
              Provider.of<GoogleSignInControler>(context, listen: false).login();
            }),
         ],
       )
    );
  }
}