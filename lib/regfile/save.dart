import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyHome extends StatefulWidget {
  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passController = TextEditingController();
  var mobController = TextEditingController();
  var addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SafeArea(
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                    child: Text(
                  'Registration Form',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.redAccent),
                )),
                Text('Name'),
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.person)),
                ),
                SizedBox(
                  height: 10,
                ),
                Text('Email'),
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.email)),
                ),
                SizedBox(
                  height: 10,
                ),
                Text('Password'),
                TextFormField(
                  controller: passController,
                  obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.password)),
                ),
                SizedBox(
                  height: 10,
                ),
                Text('Mobile Number'),
                TextFormField(
                  controller: mobController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.phone)),
                ),
                SizedBox(
                  height: 10,
                ),
                Text('Address'),
                TextFormField(
                  keyboardType: TextInputType.multiline,
                  maxLines: 5,
                  controller: addressController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.location_city)),
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: OutlinedButton.icon(
                      onPressed: () {
                        login();
                      },
                      icon: Icon(
                        Icons.login,
                        size: 18,
                      ),
                      label: Text('Register')),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //Create Function to call POST API
  Future<void> login() async {
    if (passController.text.isNotEmpty && emailController.text.isNotEmpty) {
      var response = await http.post(
          Uri.parse(
              "https://llabdemo.orell.com/api/userService/anonymous/saveUser"),
          body: jsonEncode({
            "academicYearId": "",
            "address": "${addressController.text}",
            "createdBy": "",
            "emailId": "${emailController.text}",
            "image": "",
            "institutionId": 32,
            "mobileCode": "",
            "mobileNo": "${mobController.text}",
            "modifiedBy": "",
            "name": "${nameController.text}",
            "password": "${passController.text}",
            "status": "",
            "userClassDetailsList": [
              {"userClassId": 0, "userId": "", "classId": ""}
            ],
            "classId": "",
            "userClassId": 0,
            "userId": "",
            "userCode": "",
            "userId": "",
            "userType": "",
            "whatsappCode": "",
            "whatsappNo": "${mobController.text}"
          }),
          headers: {'content-type': 'application/json'});
      if (response.statusCode == 200) {
         nameController.clear();
         emailController.clear();
         passController.clear();
         mobController.clear();
         addressController.clear();
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Success')));
      }else if(response.statusCode == 400){
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('User already exists')));
      }
      else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Invalid Credentials')));
      }
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Blank field not allowed')));
    }
  }
}
