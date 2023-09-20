import 'package:flutter/material.dart';

class ProductDetailPage extends StatefulWidget {
  final String imgUrl;
  final String name;
  final String description;
  final String price;
  final String rating;

  ProductDetailPage({
    required this.imgUrl,
    required this.name,
    required this.description,
    required this.price,
    required this.rating,
  });

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int itemCount = 1; // จำนวนสินค้าในตะกร้า

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('รายละเอียดสินค้า'),
        backgroundColor: const Color.fromARGB(255, 127, 98, 88),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(60.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Image.network(
                    widget.imgUrl,
                    width: 200,
                    height: 200,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                widget.name,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 36, 25, 21),
                ),
              ),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  widget.description,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 10),
              Text(
                widget.price,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              SizedBox(height: 10),
              Text(
                widget.rating,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.amber,
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // ใส่โค้ดที่คุณต้องการเมื่อคลิกที่ปุ่มลด
                      setState(() {
                        if (itemCount > 1) {
                          itemCount--; // ลดจำนวนสินค้าถ้ามากกว่า 1
                        }
                      });
                    },
                    child: Icon(Icons.remove),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.brown, // สีพื้นหลังของปุ่มลด
                      shape: CircleBorder(), // กำหนดรูปแบบของปุ่มเป็นวงกลม
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    itemCount.toString(), // แสดงจำนวนสินค้า
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      // ใส่โค้ดที่คุณต้องการเมื่อคลิกที่ปุ่มเพิ่ม
                      setState(() {
                        itemCount++; // เพิ่มจำนวนสินค้า
                      });
                    },
                    child: Icon(Icons.add),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.brown, // สีพื้นหลังของปุ่มเพิ่ม
                      shape: CircleBorder(), // กำหนดรูปแบบของปุ่มเป็นวงกลม
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // ใส่โค้ดที่คุณต้องการเมื่อคลิกที่ปุ่ม 'เพิ่มลงในตะกร้า'
                  // ตัวอย่างเช่น:
                  // เพิ่มสินค้าลงในตะกร้าด้วยข้อมูลจำนวนสินค้า (itemCount)
                  // และทำความสะอาดจำนวนสินค้า (itemCount) ให้เป็น 1 ใหม่
                  setState(() {
                    // ใส่โค้ดที่คุณต้องการเมื่อคลิกที่ปุ่ม 'เพิ่มลงในตะกร้า'
                    // ตัวอย่าง:
                    // เพิ่มสินค้าลงในตะกร้าด้วยจำนวนสินค้า (itemCount)
                    // และทำความสะอาดจำนวนสินค้า (itemCount) ให้เป็น 1 ใหม่
                    addToCart(itemCount);
                    itemCount = 1;
                  });
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.brown, // สีพื้นหลังของปุ่ม 'เพิ่มลงในตะกร้า'
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30), // ปรับขนาดขอบของปุ่ม
                  ),
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Text(
                    'เพิ่มลงในตะกร้า ($itemCount)',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white, 
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void addToCart(int itemCount) {
    // ทำการเพิ่มสินค้าในตะกร้าด้วยจำนวนสินค้า (itemCount)
    // คุณสามารถเพิ่มโค้ดที่ต้องการให้เพิ่มสินค้าลงในตะกร้าได้ที่นี่
  }
}
