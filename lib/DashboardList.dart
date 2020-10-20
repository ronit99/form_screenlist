import 'dart:ffi';
import 'dart:ui';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'rest_api.dart';


enum Gender { Male, Female }
Gender character = Gender.Male;
void main() => runApp(MaterialApp(
  home: Homedash(),
));

class Homedash extends StatefulWidget {
  @override
  _HomeDashlistState createState() => _HomeDashlistState();
}

class _HomeDashlistState extends State<Homedash> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,//
      body: Stack(
        children: <Widget>[
          Container(
              width: double.infinity,
              height: double.infinity,
              child: Image(
                image: AssetImage('assets/background_image_one_signin.png'),
                fit: BoxFit.fill,
              )
            // child: B,
          ),
        ],
      ),

    );
  }
}




