import 'package:flutter/material.dart';
import 'model/cartAPI.dart';
import 'model/config.dart';
import 'package:http/http.dart' as http;

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  List<CartData> myCart = [];
  int _cartItemCount = 0; // ตัวแปรเก็บจำนวนรายการในตระกร้า

  @override
  void initState() {
    super.initState();
    getMyList();
  }

  Future<void> getMyList() async {
    var url = Uri.http(Configure.server, 'myList');
    var resp = await http.get(url);

    setState(() {
      myCart = cartDataFromJson(resp.body);
      _cartItemCount = myCart.length; 
    });
  }

  Future<void> removeItem(CartData cartItem) async {
    var url = Uri.http(Configure.server, 'myList/${cartItem.id}');
    var resp = await http.delete(url);

    if (resp.statusCode == 200) {
      
      setState(() {
        myCart.remove(cartItem);
        _cartItemCount--; 
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('ลบรายการ ${cartItem.name} ออกจากตะกร้าแล้ว'),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('เกิดข้อผิดพลาดในการลบรายการ'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cart',
          style: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            color: const Color.fromARGB(255, 247, 236, 232),
          ),
        ),
        backgroundColor: Colors.brown,
        actions: [
          Stack(
            children: [
              IconButton(
                icon: Icon(Icons.shopping_cart),
                
                onPressed: () {
                  
                },
              ),
              Positioned(
                right: 5,
                top: 5,
                child: Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.green, 
                  ),
                  child: Text(
                    _cartItemCount.toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      backgroundColor: Color.fromARGB(255, 219, 199, 195),
      body: ListView.builder(
        itemCount: myCart.length,
        itemBuilder: (ctx, index) {
          final cartItem = myCart[index];
          return Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              leading: Image.network(
                cartItem.img ?? '', // URL ของรูปภาพ
                width: 50,
                height: 50,
              ),
              title: Text(cartItem.name ?? ''),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('ราคา: ${cartItem.price!.toStringAsFixed(2)} บาท'),
                  Text('จำนวน: ${cartItem.quantity} ชิ้น'),
                ],
              ),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                 
                  removeItem(cartItem);
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
