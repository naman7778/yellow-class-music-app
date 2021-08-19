import 'package:flutter/material.dart';
import 'package:music_app/google_controler_login.dart';
import 'package:music_app/login_page.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => GoogleSignInControler(),
            child: LoginPage(),
          )
        ],
        child: MaterialApp(
          title: 'Yellow Class',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: LoginPage(),
       ),
    );
  }
}
