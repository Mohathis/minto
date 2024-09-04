import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:minto_app/login/login_page.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(MaterialApp(home: splashminto(),
    debugShowCheckedModeBanner: false,),
  );
}


class splashminto extends StatefulWidget {
  const splashminto({Key? key}) : super(key: key);

  @override
  State<splashminto> createState() => _splashmintoState();
}

class _splashmintoState extends State<splashminto> {
  @override
  void initState(){
    Timer(Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>LoginPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Center(
      child: Image.asset("assets/icons/splash.jpg"),
    ),
    );
  }
}
