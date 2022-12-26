import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoping_cart/screens/home_screen.dart';
import 'package:shoping_cart/services/Data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // home: Demo(),
      home: FutureBuilder(
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Home(allProductList: snapshot.data!);
            } else {
              return Material(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
          },
          future: SignInService.getUsersFromServer()),
    );
  }
}
