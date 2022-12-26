import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoping_cart/screens/mycart.dart';

import '../services/Data.dart';

class Home extends StatefulWidget {
  Home({super.key, required this.allProductList});

  final List<Map<String, dynamic>> allProductList;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List<RxBool> addCartButtonStates;

  List<Map<String, dynamic>> myCartList = [];

  @override
  void initState() {
    addCartButtonStates =
        List.generate(widget.allProductList.length, (index) => false.obs);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("1 build");

    return Scaffold(
      appBar: AppBar(title: Text("ESHOP"), actions: [
        IconButton(
            onPressed: () => addToCartOnPressed(context),
            icon: Icon(Icons.add_shopping_cart))
      ]),
      body: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: Material(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                clipBehavior: Clip.antiAlias,
                elevation: 10,
                child: SizedBox(
                  width: 60,
                  height: 60,
                  child:
                      Image.network("${widget.allProductList[index]['image']}"),
                ),
              ),
              title: Text(
                "${widget.allProductList[index]['title']}",
                maxLines: 1,
              ),
              subtitle:
                  Text("Price \$ ${widget.allProductList[index]['price']}"),
              trailing: Obx(() {
                return Wrap(
                  children: [
                    IconButton(
                        onPressed: () {
                          if (addCartButtonStates[index].value) {
                            myCartList.remove(widget.allProductList[index]);
                            addCartButtonStates[index].value = false;
                          } else {
                            myCartList.add(widget.allProductList[index]);
                            addCartButtonStates[index].value = true;
                          }
                        }, //addCartOnPressed(index),
                        icon: Icon(
                          Icons.shopping_cart,
                          color: addCartButtonStates[index].value
                              ? Colors.green
                              : Colors.grey,
                        )),
                  ],
                );
              }),
            );
          },
          itemCount: widget.allProductList.length),
      floatingActionButton: FloatingActionButton(onPressed: () {
        // Get.snackbar('title', 'message',
        //     snackPosition: SnackPosition.BOTTOM,
        //     borderRadius: 20,
        //     backgroundColor: Colors.white,
        //     mainButton: TextButton(
        //       onPressed: () {},
        //       child: Text("data"),
        //     ));

        Get.defaultDialog(title: "Title", middleText: "khbejahgfabh");
      }),
    );
  }

  void addToCartOnPressed(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MyCart(
                  cartList: myCartList,
                )));
  }
}
