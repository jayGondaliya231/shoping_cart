import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Demo extends StatelessWidget {
  var count = 0.obs;

  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
      body: Center(child: Obx(() {
        print("obx");
        return Text(
          "Counter: $count",
          style: TextStyle(fontSize: 20),
        );
      })),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          count++;
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
