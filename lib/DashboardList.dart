import 'dart:ffi';
import 'dart:ui';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'rest_api.dart';

void main() => runApp(MaterialApp(
  home: Homedash(),
));

class Homedash extends StatefulWidget {
  @override
  _HomeDashlistState createState() => _HomeDashlistState();
}

class _HomeDashlistState extends State<Homedash> {

  List<String> listItems = List<String>.generate(100, (i) => "List Item $i");

  List MainLists = [];
  List filteredList = [];
  getListdata() async {
    var response = await Dio().get(URLS.BASE_URL + 'api/users?page=1');
    return response.data;
  }
  @override
  void initState() {
    getListdata().then((data) {
      setState(() {
        MainLists = filteredList = data;
        print(MainLists);
      });
    });
    super.initState();
  }
  void _filterCountries(value) {
    setState(() {
      filteredList = MainLists
          .where((country) =>
          country['data'].toLowerCase().contains(value.toLowerCase()))
          .toList();
      print(filteredList);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('List'),),
        body:ListView.builder(
          itemCount: listItems.length,
          itemBuilder: (context,index){
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.account_circle,size: 40,),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('${listItems[index]}', style: TextStyle(fontSize: 16),),

                        // Text('This is sub heading',style: TextStyle(fontSize: 14, color: Colors.grey),)
                      ],
                    ),
                    trailing: Icon(Icons.fast_forward),
                  ),
                  Divider()
                ],
              ),
            );
          },
        )

      /*
      // Stctic List View
      Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: <Widget>[
            ListTile(title: Text('Call'), trailing: Icon(Icons.call),),
            ListTile(title: Text('Video Call'), trailing: Icon(Icons.video_call),),
            ListTile(title: Text('Text Message'), trailing: Icon(Icons.sms),),
            ListTile(title: Text('Call'), trailing: Icon(Icons.call),),
            ListTile(title: Text('Video Call'), trailing: Icon(Icons.video_call),),
            ListTile(title: Text('Text Message'), trailing: Icon(Icons.sms),),
            ListTile(title: Text('Call'), trailing: Icon(Icons.call),),
            ListTile(title: Text('Video Call'), trailing: Icon(Icons.video_call),),
            ListTile(title: Text('Text Message'), trailing: Icon(Icons.sms),),
          ],
        ),
       ), */

    );
  }
}




