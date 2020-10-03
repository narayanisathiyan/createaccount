import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_database/firebase_database.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  TextEditingController _controller = TextEditingController();
  TextEditingController _controller1 = TextEditingController();

  final DatabaseReference databaseReference = FirebaseDatabase.instance.reference().child("pathDemo");
  void sendData()
  {
    String email = _controller.text;
    String password = _controller1.text;

    Map<String,String> detail = {
      'Email' : email,
      'Password' : password
    };
    databaseReference.push().set(detail);

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.green),
      home: Scaffold(
        appBar: AppBar(title: Text("firebase connection demo"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
             TextField(
                decoration: InputDecoration(labelText: 'E-mail'),

                controller: _controller,
        ),
             TextField(
          decoration: InputDecoration(labelText: 'Password'),
               controller: _controller1,
              ),
              FlatButton(
                color: Colors.blue,
                child: Text("ok"),
                textColor: Colors.pink,
                  onPressed:() {
                    sendData();
                  }
              )
            ],
          )),
      ),
    );
  }
}


