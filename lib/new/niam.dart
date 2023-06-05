import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../controller.dart';
import '../regfile/save.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Controller productController = Get.put(Controller());
  List photos = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Class Details')),
          actions: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyHome()));
                },
                child: Text('Register'))
          ],
        ),
        body: photos.isEmpty
            ? Container(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SafeArea(
                      child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        OutlinedButton.icon(
                            onPressed: () {
                              login();
                            },
                            icon: Icon(
                              Icons.login,
                              size: 18,
                            ),
                            label: Text('Load Class Details')),
                      ],
                    ),
                  )),
                ),
              )
            : ListView.builder(
                itemCount: photos.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: Text(photos[index]['courseTreeId'].toString()),
                    title: Text(photos[index]['course']),
                    trailing: Text(photos[index]['courseType'].toString()),
                  );
                }));
  }

  //Create Function to call POST API
  Future<void> login() async {
    var response = await http.post(
        Uri.parse(
            "https://llabdemo.orell.com/api/masters/anonymous/getAllClassList"),
        body: jsonEncode({
          'institutionId': 32,
          'academicYearId':
              "${productController.productList[0].academicYearId.toString()}"
        }),
        headers: {'content-type': 'application/json'});
    final data = json.decode(response.body);
    setState(() {
      photos = data;
    });
    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Success')));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Invalid Creadentials')));
    }
  }
}
