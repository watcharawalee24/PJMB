import 'dart:convert';

import 'package:flutter/material.dart';
import 'model/config.dart';
import 'model/item.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_application_1/Screen/ProductDetailPage.dart';

class CartItem {
  final String id;
  final String title;
  final double price;

  CartItem({
    required this.id,
    required this.title,
    required this.price,
  });
}

class CartPage extends StatefulWidget {
  static const routeName = '/cart';

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<Item> items = [];

  // Future<void> getItems() async {
  //   var url = Uri.http(Configure.server, "items");
  //   var resp = await http.get(url);
  //   setState(() {
  //     items = itemFromJson(resp.body);
  //   });
  // }

  // Future<void> removeItem(Item item) async {
  //   var url = Uri.http(Configure.server, "items/${item.id}");
  //   var resp = await http.delete(url);
  //   print(resp.body);
  // }

  @override
  // void initState() {
  //   super.initState();
  //   if (Configure.showItem != null) {
  //     getItems();
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ตะกร้าสินค้า'),
        actions: [
          IconButton(
            icon: Icon(Icons.clear),
            onPressed: () {
              setState(() {
                items.clear();
              });
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (ctx, index) {
          return ListTile(
            title: Text(items[index].name ?? ''),
            subtitle: Text(
                'ราคา: \$${items[index].price ?? ''} x ${items[index].quantity ?? ''}'),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                setState(() {
                  // removeItem(items[index]);
                  items.removeAt(index);
                });
              },
            ),
          );
        },
      ),
    );
  }
}

class ItemsWidget extends StatelessWidget {
  final List<String> imgUrls = [
    'https://www.cerave.co.th/-/media/Project/Loreal/BrandSites/CeraVe/Master/CeraveAPAC/Hong-Kong/Shared/Product/cleansers/CeraVe_FoamingCleanser_NEW_v021.png',
    'https://www.cetaphil.co.th/on/demandware.static/-/Sites-galderma-th-m-catalog/default/dw6e756fd1/HFCC/Packshot473mL_1200x1200.png',
    'https://www.larocheposay-th.com/-/media/project/loreal/brand-sites/lrp/apac/th/products/physiological/micellar-water-ultra-sensitive/la-roche-posay-productpage-face-cleanser-physiological-micellar-ultra-400ml-3337872411595-front.png',
    'https://acne-aid.in.th/wp-content/uploads/2021/12/95039_Product-Images-website-images-for-Acne-Aid-Liquid-cleanser-100ml-Bottle-Front_V0-e1662192157189.png',
    'https://www.biorethailand.com/media/product_image/aacb7ad0_aa47_11ea_82dc_d780b9030fa6.png',
    'https://smooth-e.com/wp-content/uploads/2014/08/1587947317.89525c4b45bad1d4ec4c7ebfc9419a26.png',
  ];
  final List<Map<String, dynamic>> itemsData = [
    {
      'img':'https://www.cerave.co.th/-/media/Project/Loreal/BrandSites/CeraVe/Master/CeraveAPAC/Hong-Kong/Shared/Product/cleansers/CeraVe_FoamingCleanser_NEW_v021.png',
      'name': 'Cerave',
      'description': 'Cleanser',
      'price': 699.0,
      'rating': '★★★★★'
    },
    {
      'img':'https://www.cetaphil.co.th/on/demandware.static/-/Sites-galderma-th-m-catalog/default/dw6e756fd1/HFCC/Packshot473mL_1200x1200.png',
      'name': 'Cetaphil',
      'description': 'Packshot',
      'price': 599.0,
      'rating': '★★★☆☆'
    },
    {
      'img':'https://www.larocheposay-th.com/-/media/project/loreal/brand-sites/lrp/apac/th/products/physiological/micellar-water-ultra-sensitive/la-roche-posay-productpage-face-cleanser-physiological-micellar-ultra-400ml-3337872411595-front.png',
      'name': 'La Roche',
      'description': ' Micellar Ultra',
      'price': 1029.0,
      'rating': '★★★★★'
    },
    {
      'img':'https://acne-aid.in.th/wp-content/uploads/2021/12/95039_Product-Images-website-images-for-Acne-Aid-Liquid-cleanser-100ml-Bottle-Front_V0-e1662192157189.png',
      'name': 'Acne Aid',
      'description': 'Liquid Cleanser',
      'price': 490.0,
      'rating': '★★★☆☆'
    },
    {
       'img':'https://www.biorethailand.com/media/product_image/aacb7ad0_aa47_11ea_82dc_d780b9030fa6.png',
      'name': 'biore',
      'description': ' Micellar Ultra',
      'price': 799.0,
      'rating': '★★★★★'
    },
    {
       'img':'https://smooth-e.com/wp-content/uploads/2014/08/1587947317.89525c4b45bad1d4ec4c7ebfc9419a26.png',
      'name': 'smooth-e',
      'description': 'Micellar Cleanser',
      'price': 690.0,
      'rating': '★★★☆☆'
    },
  ];

  ItemsWidget({Key? key});

  Future<void> postProductData(newProductData) async {
    var url = Uri.http(Configure.server, 'myList');
    var resp = await http.post(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(newProductData));
    print(newProductData);
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      mainAxisSpacing: 7,
      crossAxisSpacing: 5,
      shrinkWrap: true,
      childAspectRatio: (170 / 260),
      children: [
        for (int i = 0; i < imgUrls.length; i++)
          Container(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color.fromARGB(255, 255, 255, 255),
              boxShadow: [
                BoxShadow(
                  color: const Color.fromARGB(255, 113, 76, 62),
                  spreadRadius: 1,
                  blurRadius: 2,
                ),
              ],
            ),
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ProductDetailPage(
                          imgUrl: imgUrls[i],
                          name: itemsData[i]['name'] ?? '',
                          description: itemsData[i]['description'] ?? '',
                          price: itemsData[i]['price'].toStringAsFixed(2) ?? '0.00',
                          rating: itemsData[i]['rating'] ?? '',
                        ),
                      ),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.all(5),
                    child: Image.network(
                      imgUrls[i],
                      width: 150,
                      height: 150,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 1),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          itemsData[i]['name'] ?? '',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.brown,
                          ),
                        ),
                        Text(
                          itemsData[i]['description'] ?? '',
                          style: TextStyle(
                            fontSize: 18,
                            color: const Color.fromARGB(255, 142, 107, 107),
                          ),
                        ),
                        Text(
                          '\$${itemsData[i]['price'].toStringAsFixed(2)}' ?? '',
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.w700,
                            color: const Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                        Text(
                          itemsData[i]['rating'] ?? '',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color.fromARGB(255, 246, 194, 50),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                ElevatedButton(
  onPressed: () {
    // สร้างข้อมูลสินค้าที่จะส่งไปยัง postProductData
    Map<String, dynamic> productData = {
      'img': itemsData[i]['img'] ?? '',
      'name': itemsData[i]['name'] ?? 'ชื่อสินค้า',
      'description': itemsData[i]['description'] ?? 'รายละเอียดสินค้า',
      'price': itemsData[i]['price'] ?? 0.0, // ราคาสินค้า
      'quantity': 1, // จำนวนสินค้า
    };

    postProductData(productData);
  },
  style: ButtonStyle(
    padding: MaterialStateProperty.all(EdgeInsets.all(8.0)), // ปรับ Padding ของปุ่ม
    textStyle: MaterialStateProperty.all(TextStyle(fontSize: 14)), // ปรับขนาดตัวอักษร
    backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 219, 78, 26)),
    
  ),
  child: Text('ADD'), // ข้อความบนปุ่ม
                )
              ],
            ),
          ),
      ],
    );
  }
}
