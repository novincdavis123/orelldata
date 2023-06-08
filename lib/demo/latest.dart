import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Content(),
  ));
}

class Content extends StatefulWidget {
  const Content({super.key});

  @override
  State<Content> createState() => _ContentState();
}

class _ContentState extends State<Content> {
  List data = [];
  Future<void> fetchdata() async {
    var request = http.Request(
        'GET', Uri.parse('https://jsonplaceholder.typicode.com/photos'));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {

     var data1=json.decode(await response.stream.bytesToString());
     setState(() {
       data=data1;
     });
     
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('error')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: data.isEmpty?ElevatedButton(
          onPressed: () {
            fetchdata();
          },
          child: Text('click')):Text(data[0]['albumId'].toString())
    );
  }
}
