import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller.dart';
import 'new/niam.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
  ));
}

class Home extends StatelessWidget {
  final Controller productController = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Center(child: Text('Academic year Details')),
            actions: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.lightGreen),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MyHomePage()));
                  },
                  child: Text('Next'))
            ]),
        body: Container(
          child: Obx(
            () {
              if (productController.isLoading.value) {
                return Center(child: CircularProgressIndicator());
              } else {
                return ListView.builder(
                  itemCount: productController.productList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      leading: Text(productController
                          .productList[index].academicYearId
                          .toString()),
                      title: Text(productController
                          .productList[index].academicStart
                          .toString()),
                      trailing: Text(productController
                          .productList[index].academicEnd
                          .toString()),
                    );
                  },
                );
              }
            },
          ),
        ));
  }
}
