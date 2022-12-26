import 'package:flutter/material.dart';

class MyCart extends StatefulWidget {
  MyCart({super.key, required this.cartList});

  final List<Map<String, dynamic>> cartList;
  //final Function refresh;

  @override
  State<MyCart> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  @override
  Widget build(BuildContext context) {
    print("mycart build");

    return Scaffold(
      appBar: AppBar(title: Text("MyCart")),
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
                  child: Image.network("${widget.cartList[index]['image']}"),
                ),
              ),
              title: Text(
                "${widget.cartList[index]['title']}",
                maxLines: 1,
              ),
              subtitle: Text("Price \$ ${widget.cartList[index]['price']}"),
              trailing: IconButton(
                  onPressed: () {
                    setState(() {
                      //widget.refresh();
                      widget.cartList.remove(widget.cartList[index]);
                    });
                  },
                  icon: Icon(Icons.delete)),
            );
          },
          itemCount: widget.cartList.length),
    );
  }
}
